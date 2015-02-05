/*
 * Copyright (C)2005-2012 Haxe Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
package jaxe.lang;

class JLongData {

	var high : Int;
	var low : Int;

	inline function new(high, low) {
		this.high = i32(high);
		this.low = i32(low);
	}

	@:extern static inline function i32(i) {
		#if (php || js || flash8)
		return i | 0;
		#else
		return i;
		#end
	}

	@:extern static inline function i32mul(a:Int,b:Int) {
		#if (php || js || flash8)
		/*
			We can't simply use i32(a*b) since we might overflow (52 bits precision in doubles)
		*/
		return i32(i32((a * (b >>> 16)) << 16) + (a * (b&0xFFFF)));
		#else
		return a * b;
		#end
	}
	
	#if as3 public #end function toString() {
		if ((high|low) == 0 )
			return "0";
		var str = "";
		var neg = false;
		var i = this;
		if( isNeg(i) ) {
			neg = true;
			i = JLongData.neg(i);
		}
		var ten = ofInt(10);
		while( !isZero(i) ) {
			var r = divMod(i, ten);
			str = r.modulus.low + str;
			i = r.quotient;
		}
		if( neg ) str = "-" + str;
		return str;
	}

	public static inline function make( high : Int, low : Int ) : JLongData {
		return new JLongData(high, low);
	}

	public static inline function ofInt( x : Int ) : JLongData {
		return new JLongData(x >> 31,x);
	}

	public static function toInt( x : JLongData ) : Int {
		if( x.high != 0 ) {
			if( x.high < 0 )
				return -toInt(neg(x));
			throw "Overflow";
		}
		return x.low;
	}

	public static function getLow( x : JLongData ) : Int {
		return x.low;
	}

	public static function getHigh( x : JLongData ) : Int {
		return x.high;
	}

	public static function add( a : JLongData, b : JLongData ) : JLongData {
		var high = i32(a.high + b.high);
		var low = i32(a.low + b.low);
		if( uicompare(low,a.low) < 0 )
			high++;
		return new JLongData(high, low);
	}

	public static function sub( a : JLongData, b : JLongData ) : JLongData {
		var high = a.high - b.high;
		var low = a.low - b.low;
		if( uicompare(a.low,b.low) < 0 )
			high--;
		return new JLongData(high, low);
	}

	public static function mul( a : JLongData, b : JLongData ) : JLongData {
		var mask = 0xFFFF;
		var al = a.low & mask, ah = a.low >>> 16;
		var bl = b.low & mask, bh = b.low >>> 16;
		var p00 = al * bl;
		var p10 = ah * bl;
		var p01 = al * bh;
		var p11 = ah * bh;
		var low = p00;
		var high = i32(p11 + (p01 >>> 16) + (p10 >>> 16));
		p01 = i32(p01 << 16); low = i32(low + p01); if( uicompare(low, p01) < 0 ) high = i32(high + 1);
		p10 = i32(p10 << 16); low = i32(low + p10); if( uicompare(low, p10) < 0 ) high = i32(high + 1);
		high = i32(high + i32mul(a.low,b.high));
		high = i32(high + i32mul(a.high,b.low));
		return new JLongData(high, low);
	}

	static function divMod( modulus : JLongData, divisor : JLongData ) {
		var quotient = new JLongData(0, 0);
		var mask = new JLongData(0, 1);
		divisor = new JLongData(divisor.high, divisor.low);
		while( divisor.high >= 0 ) {
			var cmp = ucompare(divisor, modulus);
			divisor.high = (divisor.high << 1) | (divisor.low >>> 31);
			divisor.low <<= 1;
			mask.high = (mask.high << 1) | (mask.low >>> 31);
			mask.low <<= 1;
			if( cmp >= 0 ) break;
		}
		while( (mask.low | mask.high) != 0 ) {
			if( ucompare(modulus, divisor) >= 0 ) {
				quotient.high |= mask.high;
				quotient.low |= mask.low;
				modulus = sub(modulus,divisor);
			}
			mask.low = (mask.low >>> 1) | (mask.high << 31);
			mask.high >>>= 1;

			divisor.low = (divisor.low >>> 1) | (divisor.high << 31);
			divisor.high >>>= 1;
		}
		return { quotient : quotient, modulus : modulus };
	}

	public static inline function div( a : JLongData, b : JLongData ) : JLongData {
		var sign = (a.high | b.high) < 0;
		if( a.high < 0 ) a = neg(a);
		if( b.high < 0 ) b = neg(b);
		var q = divMod(a, b).quotient;
		return sign ? neg(q) : q;
	}

	public static inline function mod( a : JLongData, b : JLongData ) : JLongData {
		var sign = (a.high | b.high) < 0;
		if( a.high < 0 ) a = neg(a);
		if( b.high < 0 ) b = neg(b);
		var m = divMod(a, b).modulus;
		return sign ? neg(m) : m;
	}

	public static inline function shl( a : JLongData, b : Int ) : JLongData {
		return if( b & 63 == 0 ) a else if( b & 63 < 32 ) new JLongData( (a.high << b) | (a.low >>> (32-(b&63))), a.low << b ) else new JLongData( a.low << (b - 32), 0 );
	}

	public static inline function shr( a : JLongData, b : Int ) : JLongData {
		return if( b & 63 == 0 ) a else if( b & 63 < 32 ) new JLongData( a.high >> b, (a.low >>> b) | (a.high << (32 - (b&63))) ) else new JLongData( a.high >> 31, a.high >> (b - 32) );
	}

	public static inline function ushr( a : JLongData, b : Int ) : JLongData {
		return if( b & 63 == 0 ) a else if( b & 63 < 32 ) new JLongData( a.high >>> b, (a.low >>> b) | (a.high << (32 - (b&63))) ) else new JLongData( 0, a.high >>> b - 32 );
	}

	public static inline function and( a : JLongData, b : JLongData ) : JLongData {
		return new JLongData( a.high & b.high, a.low & b.low );
	}

	public static inline function or( a : JLongData, b : JLongData ) : JLongData {
		return new JLongData( a.high | b.high, a.low | b.low );
	}

	public static inline function xor( a : JLongData, b : JLongData ) : JLongData {
		return new JLongData( a.high ^ b.high, a.low ^ b.low );
	}

	public static inline function neg( a : JLongData ) : JLongData {
		var high = ~a.high;
		var low = -a.low;
		if( low == 0 )
			high++;
		return new JLongData(high,low);
	}

	public static inline function isNeg( a : JLongData ) : JBoolean {
		return a.high < 0;
	}

	public static inline function isZero( a : JLongData ) : JBoolean {
		return (a.high | a.low) == 0;
	}

	static function uicompare( a : Int, b : Int ) {
		return a < 0 ? (b < 0 ? ~b - ~a : 1) : (b < 0 ? -1 : a - b);
	}

	public static inline function compare( a : JLongData, b : JLongData ) : Int {
		var v = a.high - b.high;
		return if( v != 0 ) v else uicompare(a.low,b.low);
	}

	/**
		Compare two JLongData in unsigned mode.
	**/
	public static inline function ucompare( a : JLongData, b : JLongData ) : Int {
		var v = uicompare(a.high,b.high);
		return if( v != 0 ) v else uicompare(a.low, b.low);
	}

	public static inline function toStr( a : JLongData ) : String {
		return a.toString();
	}
	
	
	
	

}
