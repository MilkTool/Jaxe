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
 	JInt provides a 32-bit integer with consistent overflow behavior across
 	all platforms.
 **/
abstract JInt(Int) from Int to Int {
	
	public static var MAX_VALUE : JInt = 0x7fffffff;
	public static var MIN_VALUE : JInt = 0x80000000;
	public static var SIZE : JInt = 32;
	public static var TYPE : JClass = JInt;
	
	@:op(-A) private function negate():JInt;

	@:op(++A) private inline function preIncrement():JInt
		return this = clamp(++this);

	@:op(A++) private inline function postIncrement():JInt {
		var ret = this++;
		this = clamp(this);
		return ret;
	}

	@:op(--A) private inline function preDecrement():JInt
		return this = clamp(--this);

	@:op(A--) private inline function postDecrement():JInt {
		var ret = this--;
		this = clamp(this);
		return ret;
	}

	@:op(A + B) private static inline function add(a:JInt, b:JInt):JInt
		return clamp( a + b );

	@:op(A + B) @:commutative private static inline function addInt(a:JInt, b:Int):JInt
		return clamp( (a : Int) + b );

	@:op(A + B) @:commutative private static function addFloat(a:JInt, b:Float):Float;

	@:op(A - B) private static inline function sub(a:JInt, b:JInt):JInt
		return clamp( a - b );

	@:op(A - B) private static inline function subInt(a:JInt, b:Int):JInt
		return clamp( (a : Int) - b );

	@:op(A - B) private static inline function intSub(a:Int, b:JInt):JInt
		return clamp( a - (b : Int) );

	@:op(A - B) private static function subFloat(a:JInt, b:Float):Float;

	@:op(A - B) public static function floatSub(a:Float, b:JInt):Float;

	#if (as3 || flash8 || js || php || python)

	@:op(A * B) private static function mul(a:JInt, b:JInt):JInt
		return clamp( a * (b & 0xFFFF) + clamp( a * (b >>> 16) << 16 ) );

	@:op(A * B) @:commutative private static inline function mulInt(a:JInt, b:Int):JInt
		return mul(a, b);

	#else

	@:op(A * B) private static function mul(a:JInt, b:JInt):JInt;
	@:op(A * B) @:commutative private static function mulInt(a:JInt, b:Int):JInt;

	#end

	@:op(A * B) @:commutative private static function mulFloat(a:JInt, b:Float):Float;

	@:op(A / B) private static function div(a:JInt, b:JInt):Float;
	@:op(A / B) private static function divInt(a:JInt, b:Int):Float;
	@:op(A / B) private static function intDiv(a:Int, b:JInt):Float;
	@:op(A / B) private static function divFloat(a:JInt, b:Float):Float;
	@:op(A / B) private static function floatDiv(a:Float, b:JInt):Float;

	@:op(A % B) private static function mod(a:JInt, b:JInt):JInt;
	@:op(A % B) private static function modInt(a:JInt, b:Int):Int;
	@:op(A % B) private static function intMod(a:Int, b:JInt):Int;
	@:op(A % B) private static function modFloat(a:JInt, b:Float):Float;
	@:op(A % B) private static function floatMod(a:Float, b:JInt):Float;

	@:op(A == B) private static function eq(a:JInt, b:JInt):JBoolean;
	@:op(A == B) @:commutative private static function eqInt(a:JInt, b:Int):JBoolean;
	@:op(A == B) @:commutative private static function eqFloat(a:JInt, b:Float):JBoolean;

	@:op(A != B) private static function neq(a:JInt, b:JInt):JBoolean;
	@:op(A != B) @:commutative private static function neqInt(a:JInt, b:Int):JBoolean;
	@:op(A != B) @:commutative private static function neqFloat(a:JInt, b:Float):JBoolean;

	@:op(A < B) private static function lt(a:JInt, b:JInt):JBoolean;
	@:op(A < B) private static function ltInt(a:JInt, b:Int):JBoolean;
	@:op(A < B) private static function intLt(a:Int, b:JInt):JBoolean;
	@:op(A < B) private static function ltFloat(a:JInt, b:Float):JBoolean;
	@:op(A < B) private static function floatLt(a:Float, b:JInt):JBoolean;

	@:op(A <= B) private static function lte(a:JInt, b:JInt):JBoolean;
	@:op(A <= B) private static function lteInt(a:JInt, b:Int):JBoolean;
	@:op(A <= B) private static function intLte(a:Int, b:JInt):JBoolean;
	@:op(A <= B) private static function lteFloat(a:JInt, b:Float):JBoolean;
	@:op(A <= B) private static function floatLte(a:Float, b:JInt):JBoolean;

	@:op(A > B) private static function gt(a:JInt, b:JInt):JBoolean;
	@:op(A > B) private static function gtInt(a:JInt, b:Int):JBoolean;
	@:op(A > B) private static function intGt(a:Int, b:JInt):JBoolean;
	@:op(A > B) private static function gtFloat(a:JInt, b:Float):JBoolean;
	@:op(A > B) private static function floatGt(a:Float, b:JInt):JBoolean;

	@:op(A >= B) private static function gte(a:JInt, b:JInt):JBoolean;
	@:op(A >= B) private static function gteInt(a:JInt, b:Int):JBoolean;
	@:op(A >= B) private static function intGte(a:Int, b:JInt):JBoolean;
	@:op(A >= B) private static function gteFloat(a:JInt, b:Float):JBoolean;
	@:op(A >= B) private static function floatGte(a:Float, b:JInt):JBoolean;

	@:op(~A) private function complement():JInt;

	@:op(A & B) private static function and(a:JInt, b:JInt):JInt;
	@:op(A & B) @:commutative private static function andInt(a:JInt, b:Int):JInt;

	@:op(A | B) private static function or(a:JInt, b:JInt):JInt;
	@:op(A | B) @:commutative private static function orInt(a:JInt, b:Int):JInt;

	@:op(A ^ B) private static function xor(a:JInt, b:JInt):JInt;
	@:op(A ^ B) @:commutative private static function xorInt(a:JInt, b:Int):JInt;


	@:op(A >> B) private static function shr(a:JInt, b:JInt):JInt;
	@:op(A >> B) private static function shrInt(a:JInt, b:Int):JInt;
	@:op(A >> B) private static function intShr(a:Int, b:JInt):JInt;

	@:op(A >>> B) private static function ushr(a:JInt, b:JInt):JInt;
	@:op(A >>> B) private static function ushrInt(a:JInt, b:Int):JInt;
	@:op(A >>> B) private static function intUshr(a:Int, b:JInt):JInt;

	#if (php || python)

	// PHP may be 64-bit, so shifts must be clamped
	@:op(A << B) private static inline function shl(a:JInt, b:JInt):JInt
		return clamp( a << b );

	@:op(A << B) private static inline function shlInt(a:JInt, b:Int):JInt
		return clamp( a << b );

	@:op(A << B) private static inline function intShl(a:JInt, b:Int):JInt
		return clamp( a << b );

	#else

	@:op(A << B) private static function shl(a:JInt, b:JInt):JInt;
	@:op(A << B) private static function shlInt(a:JInt, b:Int):JInt;
	@:op(A << B) private static function intShl(a:Int, b:JInt):JInt;

	#end

	@:to private inline function toFloat():Float
		return this;

	/**
		Compare `a` and `b` in unsigned mode.
	**/
	public static function ucompare( a : JInt, b : JInt ) : Int {
		if( a < 0 )
			return b < 0 ? ( ~b - ~a ) : 1;
		return b < 0 ? -1 : (a - b);
	}

	#if php
	static var extraBits : Int = untyped __php__("PHP_INT_SIZE") * 8 - 32;
	#end

	static inline function clamp( x : Int ) : Int {
		// force to-int conversion on platforms that require it
		#if (as3 || flash8 || js)
		return x | 0;
		#elseif php
		// we might be on 64-bit php, so sign extend from 32-bit
		return (x << extraBits) >> extraBits;
		#elseif python
		return (x + python.Syntax.opPow(2, 31)) % python.Syntax.opPow(2, 32) - python.Syntax.opPow(2, 31);
		#else
		return (x);
		#end
	}
	
}
