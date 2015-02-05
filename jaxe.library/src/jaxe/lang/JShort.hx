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
 
 /**
 	JShort provides a 16-bit integer with consistent overflow behavior across
 	all platforms.
 **/
abstract JShort(Int) from Int to Int {
	
	public static var MIN_VALUE : JShort = 0x8000;
	public static var MAX_VALUE : JShort = 0x7fff;
	public static var SIZE : JInt = 16;
	public static var TYPE : JClass = JShort;
	
	@:op(-A) private function negate():JShort;

	@:op(++A) private inline function preIncrement():JShort
		return this = clamp(++this);

	@:op(A++) private inline function postIncrement():JShort {
		var ret = this++;
		this = clamp(this);
		return ret;
	}

	@:op(--A) private inline function preDecrement():JShort
		return this = clamp(--this);

	@:op(A--) private inline function postDecrement():JShort {
		var ret = this--;
		this = clamp(this);
		return ret;
	}

	@:op(A + B) private static inline function add(a:JShort, b:JShort):JShort
		return clamp( a + b );

	@:op(A + B) @:commutative private static inline function addInt(a:JShort, b:Int):JShort
		return clamp( (a : Int) + b );

	@:op(A + B) @:commutative private static function addFloat(a:JShort, b:Float):Float;

	@:op(A - B) private static inline function sub(a:JShort, b:JShort):JShort
		return clamp( a - b );

	@:op(A - B) private static inline function subInt(a:JShort, b:Int):JShort
		return clamp( (a : Int) - b );

	@:op(A - B) private static inline function intSub(a:Int, b:JShort):JShort
		return clamp( a - (b : Int) );

	@:op(A - B) private static function subFloat(a:JShort, b:Float):Float;

	@:op(A - B) public static function floatSub(a:Float, b:JShort):Float;

	//#if (as3 || flash8 || js || php || python)

	// FIXME
	@:op(A * B) private static function mul(a:JShort, b:JShort):JShort
		return clamp( a * (b & 0xFFFF) + clamp( a * (b >>> 16) << 16 ) );

	@:op(A * B) @:commutative private static inline function mulInt(a:JShort, b:Int):JShort
		return mul(a, b);

	/*#else

	@:op(A * B) private static function mul(a:JShort, b:JShort):JShort;
	@:op(A * B) @:commutative private static function mulInt(a:JShort, b:Int):JShort;

	#end*/

	@:op(A * B) @:commutative private static function mulFloat(a:JShort, b:Float):Float;

	@:op(A / B) private static function div(a:JShort, b:JShort):Float;
	@:op(A / B) private static function divInt(a:JShort, b:Int):Float;
	@:op(A / B) private static function intDiv(a:Int, b:JShort):Float;
	@:op(A / B) private static function divFloat(a:JShort, b:Float):Float;
	@:op(A / B) private static function floatDiv(a:Float, b:JShort):Float;

	@:op(A % B) private static function mod(a:JShort, b:JShort):JShort;
	@:op(A % B) private static function modInt(a:JShort, b:Int):Int;
	@:op(A % B) private static function intMod(a:Int, b:JShort):Int;
	@:op(A % B) private static function modFloat(a:JShort, b:Float):Float;
	@:op(A % B) private static function floatMod(a:Float, b:JShort):Float;

	@:op(A == B) private static function eq(a:JShort, b:JShort):JBoolean;
	@:op(A == B) @:commutative private static function eqInt(a:JShort, b:Int):JBoolean;
	@:op(A == B) @:commutative private static function eqFloat(a:JShort, b:Float):JBoolean;

	@:op(A != B) private static function neq(a:JShort, b:JShort):JBoolean;
	@:op(A != B) @:commutative private static function neqInt(a:JShort, b:Int):JBoolean;
	@:op(A != B) @:commutative private static function neqFloat(a:JShort, b:Float):JBoolean;

	@:op(A < B) private static function lt(a:JShort, b:JShort):JBoolean;
	@:op(A < B) private static function ltInt(a:JShort, b:Int):JBoolean;
	@:op(A < B) private static function intLt(a:Int, b:JShort):JBoolean;
	@:op(A < B) private static function ltFloat(a:JShort, b:Float):JBoolean;
	@:op(A < B) private static function floatLt(a:Float, b:JShort):JBoolean;

	@:op(A <= B) private static function lte(a:JShort, b:JShort):JBoolean;
	@:op(A <= B) private static function lteInt(a:JShort, b:Int):JBoolean;
	@:op(A <= B) private static function intLte(a:Int, b:JShort):JBoolean;
	@:op(A <= B) private static function lteFloat(a:JShort, b:Float):JBoolean;
	@:op(A <= B) private static function floatLte(a:Float, b:JShort):JBoolean;

	@:op(A > B) private static function gt(a:JShort, b:JShort):JBoolean;
	@:op(A > B) private static function gtInt(a:JShort, b:Int):JBoolean;
	@:op(A > B) private static function intGt(a:Int, b:JShort):JBoolean;
	@:op(A > B) private static function gtFloat(a:JShort, b:Float):JBoolean;
	@:op(A > B) private static function floatGt(a:Float, b:JShort):JBoolean;

	@:op(A >= B) private static function gte(a:JShort, b:JShort):JBoolean;
	@:op(A >= B) private static function gteInt(a:JShort, b:Int):JBoolean;
	@:op(A >= B) private static function intGte(a:Int, b:JShort):JBoolean;
	@:op(A >= B) private static function gteFloat(a:JShort, b:Float):JBoolean;
	@:op(A >= B) private static function floatGte(a:Float, b:JShort):JBoolean;

	@:op(~A) private function complement():JShort;

	@:op(A & B) private static function and(a:JShort, b:JShort):JShort;
	@:op(A & B) @:commutative private static function andInt(a:JShort, b:Int):JShort;

	@:op(A | B) private static function or(a:JShort, b:JShort):JShort;
	@:op(A | B) @:commutative private static function orInt(a:JShort, b:Int):JShort;

	@:op(A ^ B) private static function xor(a:JShort, b:JShort):JShort;
	@:op(A ^ B) @:commutative private static function xorInt(a:JShort, b:Int):JShort;


	@:op(A >> B) private static function shr(a:JShort, b:JShort):JShort;
	@:op(A >> B) private static function shrInt(a:JShort, b:Int):JShort;
	@:op(A >> B) private static function intShr(a:Int, b:JShort):JShort;

	@:op(A >>> B) private static function ushr(a:JShort, b:JShort):JShort;
	@:op(A >>> B) private static function ushrInt(a:JShort, b:Int):JShort;
	@:op(A >>> B) private static function intUshr(a:Int, b:JShort):JShort;

	// PHP may be 64-bit, so shifts must be clamped
	@:op(A << B) private static inline function shl(a:JShort, b:JShort):JShort
		return clamp( a << b );

	@:op(A << B) private static inline function shlInt(a:JShort, b:Int):JShort
		return clamp( a << b );

	@:op(A << B) private static inline function intShl(a:JShort, b:Int):JShort
		return clamp( a << b );


	@:to private inline function toFloat():Float
		return this;

	/**
		Compare `a` and `b` in unsigned mode.
	**/
	public static function ucompare( a : JShort, b : JShort ) : Int {
		if( a < 0 )
			return b < 0 ? ( ~b - ~a ) : 1;
		return b < 0 ? -1 : (a - b);
	}

	#if php
	static var extraBits : Int = (untyped __php__("PHP_INT_SIZE") == 32) ? 16 : 48;
	#end

	static inline function clamp( x : Int ) : Int {
		// force to-int conversion on platforms that require it
		#if (as3 || flash8 || js)
		x =  x | 0;
		return (x << 16) >> 16;
		#elseif php
		// we might be on 64-bit php, so sign extend from 32-bit
		return (x << extraBits) >> extraBits;
		#elseif python
		return (x + python.Syntax.opPow(2, 15)) % python.Syntax.opPow(2, 16) - python.Syntax.opPow(2, 15);
		#else
		return (x << 16) >> 16;
		#end
	}
	
	public function equals(o : Dynamic) : JBoolean
	{
		if (Std.instance(o, JShort) != null) {
			cast(o, JShort);
			return o == this;
		} else {
			return false;
		}
	}
	
	public function compareTo(o : JShort) : JShort
	{
		return this - o;
	}

	public static function compare(x : JShort, y : JShort) : Int
	{
		return x - y;
	}
	
	public function hashCode() : JInt
	{
		return this;
	}
	
	public static function valueOf(value : JShort) : JShort
	{
		return value;
	}
	
	public function byteValue() : JByte {
		return this;
	}
	
	public function shortValue() : JShort {
		return this;
	}
	
	public function intValue() : JInt {
		return this;
	}
	
	public function longValue() : JLong {
		return JLong.fromInt(this);
	}
	
	public function toString() : JString {
		return Std.string(this);
	}
	
}
