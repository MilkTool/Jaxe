/*
 * Copyright (C)2005-2013 Haxe Foundation
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

abstract JLong(JLongData) from JLongData to JLongData
{
	public inline function new(x:JLongData) this = x;

	inline static function RAW(x:JLongData):JLong return new JLong(x);

	public static var MAX_VALUE:JLong = new JLong(JLongData.make(0x7fffffff, -1));
	public static var MIN_VALUE:JLong = new JLong(JLongData.make(0x80000000, 0));
	public static var TYPE : JClass = JLong;
	public static var SIZE : JInt = 64;

	static inline var TWO_32:Float =  4294967296.0;

	public static inline function make(a:Int, b:Int) {
		return RAW(JLongData.make(a, b));
	}

	@:from public static inline function fromInt(x:Int):JLong {
		return RAW(JLongData.ofInt(x));
	}

	@:from public static inline function fromFloat(x:Float):JLong {

		if (x > MAX_VALUE.toFloat()) throw "overflow";

		if (x < 0)
			return neg(fromFloat( -x));
		else
		{
			var high = Std.int(x / TWO_32);
			var low = Std.int(x - high * TWO_32);
			return RAW(JLongData.make(high, low));
		}
	}
	
	@:from
	public static inline function fromString(s:String): JLong {
		trace("fromString: " + s);
		return JLongObject.decodeLongString(s);
	}
	
	@:to
	public inline function toString():String {
		return JLongData.toStr(this);
	}

	/*
	 * warning: only valid if in the range [-2^53, 2^53]
	 */
	public inline function toFloat():Float {
		var high:Float = JLongData.getHigh(this)* TWO_32;
		var low:Float = JLongData.getLow(this);
		return high + low;
	}

	public inline function toInt():Int {
		return JLongData.toInt(this);
	}

	@:op(A+B) public static inline function add(a:JLong, b:JLong):JLong {
		return RAW(JLongData.add(a, b));
	}

	@:commutative @:op(A+B) public static inline function addf(a:JLong, b:Float):JLong {
		return add(a, fromFloat(b));
	}

	@:commutative @:op(A+B) public static inline function addi(a:JLong, b:Int):JLong {
		return add(a, fromInt(b));
	}

	@:op(A-B) public static inline function sub(a:JLong, b:JLong):JLong {
		return RAW(JLongData.sub(a, b));
	}

	@:op(A-B) public static inline function subf(a:JLong, b:Float):JLong {
		return sub(a, fromFloat(b));
	}

	@:op(A-B) public static inline function subi(a:JLong, b:Int):JLong {
		return sub(a, fromInt(b));
	}

	@:op(A-B) public static inline function fsub(a:Float, b:JLong):JLong {
		return sub(fromFloat(a), b);
	}

	@:op(A-B) public static inline function isub(a:Int, b:JLong):JLong {
		return sub(fromInt(a), b);
	}

	@:op(-A) public static inline function neg(x:JLong):JLong {
		return RAW(JLongData.neg(x));
	}

	@:op(A*B) public static inline function mul(a:JLong, b:JLong):JLong {
		return RAW(JLongData.mul(a, b));
	}

	@:commutative @:op(A*B) public static inline function mulf(a:JLong, b:Float):JLong {
		return mul(a, fromFloat(b));
	}

	@:commutative @:op(A*B) public static inline function muli(a:JLong, b:Int):JLong {
		return mul(a, fromInt(b));
	}

	@:op(A/B) public static inline function div(a:JLong, b:JLong):JLong {
		return RAW(JLongData.div(a, b));
	}

	@:op(A/B) public static inline function divf(a:JLong, b:Float):JLong {
		return div(a, fromFloat(b));
	}

	@:op(A/B) public static inline function divi(a:JLong, b:Int):JLong {
		return div(a, fromInt(b));
	}

	@:op(A/B) public static inline function fdiv(a:Float, b:JLong):JLong {
		return div(fromFloat(a), b);
	}

	@:op(A/B) public static inline function idiv(a:Int, b:JLong):JLong {
		return div(fromInt(a), b);
	}

	@:op(A % B) public static inline function mod(a:JLong, b:JLong):JLong {
		return RAW(JLongData.mod(a, b));
	}

	@:op(A%B) public static inline function modf(a:JLong, b:Float):JLong {
		return mod(a, fromFloat(b));
	}

	@:op(A%B) public static inline function modi(a:JLong, b:Int):JLong {
		return mod(a, fromInt(b));
	}

	@:op(A%B) public static inline function fmod(a:Float, b:JLong):JLong {
		return mod(fromFloat(a), b);
	}

	@:op(A%B) public static inline function imod(a:Int, b:JLong):JLong {
		return mod(fromInt(a), b);
	}

	@:op(A==B) public static inline function eq(a:JLong, b:JLong):JBoolean {
		return JLongData.compare(a, b) == 0;
	}

	@:commutative @:op(A==B) public static inline function eqf(a:JLong, b:Float):JBoolean {
		return eq(a, fromFloat(b));
	}

	@:commutative @:op(A == B) public static inline function eqi(a:JLong, b:Int):JBoolean {
		// check for special case when b == 0
		return b == 0 ? JLongData.isZero(a) : eq(a, fromInt(b));
	}

	@:op(A!=B) public static inline function neq(a:JLong, b:JLong):JBoolean {
		return JLongData.compare(a, b) != 0;
	}

	@:commutative @:op(A!=B) public static inline function neqf(a:JLong, b:Float):JBoolean {
		return neq(a, fromFloat(b));
	}

	@:commutative @:op(A!=B) public static inline function neqi(a:JLong, b:Int):JBoolean {
		// check for special case when b == 0
		return b == 0 ? !JLongData.isZero(a) : neq(a, fromInt(b));
	}

	@:op(A>B) public static inline function gt(a:JLong, b:JLong):JBoolean {
		return JLongData.compare(a, b) > 0;
	}

	@:op(A>B) public static inline function gtf(a:JLong, b:Float):JBoolean {
		return gt(a, fromFloat(b));
	}

	@:op(A>B) public static inline function gti(a:JLong, b:Int):JBoolean {
		return gt(a, fromInt(b));
	}

	@:op(A>B) public static inline function fgt(a:Float, b:JLong):JBoolean {
		return gt(fromFloat(a), b);
	}

	@:op(A>B) public static inline function igt(a:Int, b:JLong):JBoolean {
		return gt(fromInt(a), b);
	}

	@:op(A<B) public static inline function lt(a:JLong, b:JLong):JBoolean {
		return JLongData.compare(a, b) < 0;
	}

	@:op(A<B) public static inline function ltf(a:JLong, b:Float):JBoolean {
		return lt(a, fromFloat(b));
	}

	@:op(A<B) public static inline function lti(a:JLong, b:Int):JBoolean {
		return b == 0 ? JLongData.isNeg(a) : lt(a, fromInt(b));
	}

	@:op(A<B) public static inline function flt(a:Float, b:JLong):JBoolean {
		return lt(fromFloat(a), b);
	}

	@:op(A<B) public static inline function ilt(a:Int, b:JLong):JBoolean {
		return lt(fromInt(a), b);
	}

	@:op(A>=B) public static inline function gte(a:JLong, b:JLong):JBoolean {
		return JLongData.compare(a, b) >= 0;
	}

	@:op(A>=B) public static inline function gtef(a:JLong, b:Float):JBoolean {
		return gte(a, fromFloat(b));
	}

	@:op(A>=B) public static inline function gtei(a:JLong, b:Int):JBoolean {
		return b == 0 ? !JLongData.isNeg(a) : gte(a, fromInt(b));
	}

	@:op(A>=B) public static inline function fgte(a:Float, b:JLong):JBoolean {
		return gte(fromFloat(a), b);
	}

	@:op(A>=B) public static inline function igte(a:Int, b:JLong):JBoolean {
		return gte(fromInt(a), b);
	}

	@:op(A<=B) public static inline function lte(a:JLong, b:JLong):JBoolean {
		return JLongData.compare(a, b) <= 0;
	}

	@:op(A<=B) public static inline function ltef(a:JLong, b:Float):JBoolean {
		return lte(a, fromFloat(b));
	}

	@:op(A<=B) public static inline function ltei(a:JLong, b:Int):JBoolean {
		return lte(a, fromInt(b));
	}

	@:op(A<=B) public static inline function flte(a:Float, b:JLong):JBoolean {
		return lte(fromFloat(a), b);
	}

	@:op(A<=B) public static inline function ilte(a:Int, b:JLong):JBoolean {
		return lte(fromInt(a), b);
	}

	@:op(A<<B) public static inline function shl(a:JLong, b:Int):JLong {
		return RAW(JLongData.shl(a, b));
	}

	@:op(A>>B) public static inline function shr(a:JLong, b:Int):JLong {
		return RAW(JLongData.shr(a, b));
	}

	@:op(A>>>B) public static inline function ushr(a:JLong, b:Int):JLong {
		return RAW(JLongData.ushr(a, b));
	}

	@:op(A&B) public static inline function and(a:JLong, b:JLong):JLong {
		return RAW(JLongData.and(a, b));
	}

	@:commutative @:op(A&B) public static inline function andi(a:JLong, b:Int):JLong {
		return and(a, fromInt(b));
	}

	@:op(A|B) public static inline function or(a:JLong, b:JLong):JLong {
		return RAW(JLongData.or(a, b));
	}

	@:commutative @:op(A|B) public static inline function ori(a:JLong, b:Int):JLong {
		return or(a, fromInt(b));
	}

	@:op(A^B) public static inline function xor(a:JLong, b:JLong):JLong {
		return RAW(JLongData.xor(a, b));
	}

	@:commutative @:op(A^B) public static inline function xori(a:JLong, b:Int):JLong {
		return xor(a, fromInt(b));
	}
	
  
}
