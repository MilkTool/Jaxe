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
 	JByte provides a 8-bit integer with consistent overflow behavior across
 	all platforms.
 **/
abstract JByte(Int) from Int to Int {
	
	public static var MAX_VALUE : JByte = 0x7F;
	public static var MIN_VALUE : JByte = 0x80;
	public static var SIZE : JInt = 8;
	public static var TYPE : JClass = JByte;
	
	@:op(-A) private function negate():JByte;

	@:op(++A) private inline function preIncrement():JByte
		return this = clamp(++this);

	@:op(A++) private inline function postIncrement():JByte {
		var ret = this++;
		this = clamp(this);
		return ret;
	}

	@:op(--A) private inline function preDecrement():JByte
		return this = clamp(--this);

	@:op(A--) private inline function postDecrement():JByte {
		var ret = this--;
		this = clamp(this);
		return ret;
	}

	@:op(A + B) private static inline function add(a:JByte, b:JByte):JByte
		return clamp( a + b );

	@:op(A + B) @:commutative private static inline function addInt(a:JByte, b:Int):JByte
		return clamp( (a : Int) + b );

	@:op(A + B) @:commutative private static function addFloat(a:JByte, b:Float):Float;

	@:op(A - B) private static inline function sub(a:JByte, b:JByte):JByte
		return clamp( a - b );

	@:op(A - B) private static inline function subInt(a:JByte, b:Int):JByte
		return clamp( (a : Int) - b );

	@:op(A - B) private static inline function intSub(a:Int, b:JByte):JByte
		return clamp( a - (b : Int) );

	@:op(A - B) private static function subFloat(a:JByte, b:Float):Float;

	@:op(A - B) public static function floatSub(a:Float, b:JByte):Float;

	//#if (as3 || flash8 || js || php || python)

	// FIXME
	@:op(A * B) private static function mul(a:JByte, b:JByte):JByte
		return clamp( a * (b & 0xFFFF) + clamp( a * (b >>> 16) << 16 ) );

	@:op(A * B) @:commutative private static inline function mulInt(a:JByte, b:Int):JByte
		return mul(a, b);

	/*#else

	@:op(A * B) private static function mul(a:JByte, b:JByte):JByte;
	@:op(A * B) @:commutative private static function mulInt(a:JByte, b:Int):JByte;

	#end*/

	@:op(A * B) @:commutative private static function mulFloat(a:JByte, b:Float):Float;

	@:op(A / B) private static function div(a:JByte, b:JByte):Float;
	@:op(A / B) private static function divInt(a:JByte, b:Int):Float;
	@:op(A / B) private static function intDiv(a:Int, b:JByte):Float;
	@:op(A / B) private static function divFloat(a:JByte, b:Float):Float;
	@:op(A / B) private static function floatDiv(a:Float, b:JByte):Float;

	@:op(A % B) private static function mod(a:JByte, b:JByte):JByte;
	@:op(A % B) private static function modInt(a:JByte, b:Int):Int;
	@:op(A % B) private static function intMod(a:Int, b:JByte):Int;
	@:op(A % B) private static function modFloat(a:JByte, b:Float):Float;
	@:op(A % B) private static function floatMod(a:Float, b:JByte):Float;

	@:op(A == B) private static function eq(a:JByte, b:JByte):JBoolean;
	@:op(A == B) @:commutative private static function eqInt(a:JByte, b:Int):JBoolean;
	@:op(A == B) @:commutative private static function eqFloat(a:JByte, b:Float):JBoolean;

	@:op(A != B) private static function neq(a:JByte, b:JByte):JBoolean;
	@:op(A != B) @:commutative private static function neqInt(a:JByte, b:Int):JBoolean;
	@:op(A != B) @:commutative private static function neqFloat(a:JByte, b:Float):JBoolean;

	@:op(A < B) private static function lt(a:JByte, b:JByte):JBoolean;
	@:op(A < B) private static function ltInt(a:JByte, b:Int):JBoolean;
	@:op(A < B) private static function intLt(a:Int, b:JByte):JBoolean;
	@:op(A < B) private static function ltFloat(a:JByte, b:Float):JBoolean;
	@:op(A < B) private static function floatLt(a:Float, b:JByte):JBoolean;

	@:op(A <= B) private static function lte(a:JByte, b:JByte):JBoolean;
	@:op(A <= B) private static function lteInt(a:JByte, b:Int):JBoolean;
	@:op(A <= B) private static function intLte(a:Int, b:JByte):JBoolean;
	@:op(A <= B) private static function lteFloat(a:JByte, b:Float):JBoolean;
	@:op(A <= B) private static function floatLte(a:Float, b:JByte):JBoolean;

	@:op(A > B) private static function gt(a:JByte, b:JByte):JBoolean;
	@:op(A > B) private static function gtInt(a:JByte, b:Int):JBoolean;
	@:op(A > B) private static function intGt(a:Int, b:JByte):JBoolean;
	@:op(A > B) private static function gtFloat(a:JByte, b:Float):JBoolean;
	@:op(A > B) private static function floatGt(a:Float, b:JByte):JBoolean;

	@:op(A >= B) private static function gte(a:JByte, b:JByte):JBoolean;
	@:op(A >= B) private static function gteInt(a:JByte, b:Int):JBoolean;
	@:op(A >= B) private static function intGte(a:Int, b:JByte):JBoolean;
	@:op(A >= B) private static function gteFloat(a:JByte, b:Float):JBoolean;
	@:op(A >= B) private static function floatGte(a:Float, b:JByte):JBoolean;

	@:op(~A) private function complement():JByte;

	@:op(A & B) private static function and(a:JByte, b:JByte):JByte;
	@:op(A & B) @:commutative private static function andInt(a:JByte, b:Int):JByte;

	@:op(A | B) private static function or(a:JByte, b:JByte):JByte;
	@:op(A | B) @:commutative private static function orInt(a:JByte, b:Int):JByte;

	@:op(A ^ B) private static function xor(a:JByte, b:JByte):JByte;
	@:op(A ^ B) @:commutative private static function xorInt(a:JByte, b:Int):JByte;


	@:op(A >> B) private static function shr(a:JByte, b:JByte):JByte;
	@:op(A >> B) private static function shrInt(a:JByte, b:Int):JByte;
	@:op(A >> B) private static function intShr(a:Int, b:JByte):JByte;

	@:op(A >>> B) private static function ushr(a:JByte, b:JByte):JByte;
	@:op(A >>> B) private static function ushrInt(a:JByte, b:Int):JByte;
	@:op(A >>> B) private static function intUshr(a:Int, b:JByte):JByte;

	// PHP may be 64-bit, so shifts must be clamped
	@:op(A << B) private static inline function shl(a:JByte, b:JByte):JByte
		return clamp( a << b );

	@:op(A << B) private static inline function shlInt(a:JByte, b:Int):JByte
		return clamp( a << b );

	@:op(A << B) private static inline function intShl(a:JByte, b:Int):JByte
		return clamp( a << b );


	@:to private inline function toFloat():Float
		return this;

	/**
		Compare `a` and `b` in unsigned mode.
	**/
	public static function ucompare( a : JByte, b : JByte ) : Int {
		if( a < 0 )
			return b < 0 ? ( ~b - ~a ) : 1;
		return b < 0 ? -1 : (a - b);
	}

	#if php
	static var extraBits : Int = (untyped __php__("PHP_INT_SIZE") == 32) ? 24 : 56;
	#end

	static inline function clamp( x : Int ) : Int {
		#if (as3 || flash8 || js)
		// force to-int conversion on platforms that require it
		x =  x | 0;
		return (x << 24) >> 24;
		#elseif php
		// we might be on 64-bit php, so sign extend from 32-bit
		return (x << extraBits) >> extraBits;
		#elseif python
		return (x + python.Syntax.opPow(2, 7)) % python.Syntax.opPow(2, 8) - python.Syntax.opPow(2, 7);
		#else
		return (x << 24) >> 24;
		#end
	}

}
