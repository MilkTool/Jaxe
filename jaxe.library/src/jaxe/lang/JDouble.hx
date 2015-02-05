package jaxe.lang;

import haxe.Int32;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;

/**
 * @author G.Legris
 */

abstract JDouble(Float) from JDouble to JDouble {
	
	public static var MAX_VALUE : JDouble = 1.7976931348623157e+308;
	public static var MIN_VALUE : JDouble = 4.9e-324;
	public static var MIN_NORMAL : JDouble = 2.2250738585072014e-308;
	public static var MAX_EXPONENT : JInt = 1023;
	public static var MIN_EXPONENT : JInt = -1022;
	public static var NaN : JDouble = Math.NaN;
	public static var NEGATIVE_INFINITY : JDouble = Math.NEGATIVE_INFINITY;
	public static var POSITIVE_INFINITY : JDouble = Math.POSITIVE_INFINITY;
	public static var SIZE : JInt = 64;
	public static var TYPE : JClass = JDouble;
	
	inline function new(f: Float) {
		this = f;
	}
 
	@:from
	public static inline function fromFloat(f:Float) : JDouble {
		return new JDouble(f);
	}
	
	@:to
	public inline function toFloat(): Float {
		return this;
	}
	
	@:to
	public inline function toInt(): Int {
		return Std.int(this);
	}
	
	@:op(-A) private function negate():JDouble;
	
	@:op(A + B) private static function add(a:JDouble, b:JDouble):JDouble;
	@:op(A + B) @:commutative private static function addInt(a:JDouble, b:Int):JDouble;
	@:op(A + B) @:commutative private static function addFloat(a:JDouble, b:Float):Float;
	@:op(A - B) private static function sub(a:JDouble, b:JDouble):JDouble;
	@:op(A - B) private static function subInt(a:JDouble, b:Int):JDouble;
	@:op(A - B) private static function intSub(a:Int, b:JDouble):JDouble;
	@:op(A - B) private static function subFloat(a:JDouble, b:Float):Float;
	@:op(A - B) public static function floatSub(a:Float, b:JDouble):Float;
	@:op(A * B) private static function mul(a:JDouble, b:JDouble):JDouble;
	@:op(A * B) @:commutative private static function mulInt(a:JDouble, b:Int):JDouble;
	@:op(A * B) @:commutative private static function mulFloat(a:JDouble, b:Float):Float;

	@:op(A / B) private static function div(a:JDouble, b:JDouble):Float;
	@:op(A / B) private static function divInt(a:JDouble, b:Int):Float;
	@:op(A / B) private static function intDiv(a:Int, b:JDouble):Float;
	@:op(A / B) private static function divFloat(a:JDouble, b:Float):Float;
	@:op(A / B) private static function floatDiv(a:Float, b:JDouble):Float;

	@:op(A % B) private static function mod(a:JDouble, b:JDouble):JDouble;
	@:op(A % B) private static function modInt(a:JDouble, b:Int):Int;
	@:op(A % B) private static function intMod(a:Int, b:JDouble):Int;
	@:op(A % B) private static function modFloat(a:JDouble, b:Float):Float;
	@:op(A % B) private static function floatMod(a:Float, b:JDouble):Float;

	@:op(A == B) private static function eq(a:JDouble, b:JDouble):JBoolean;
	@:op(A == B) @:commutative private static function eqInt(a:JDouble, b:Int):JBoolean;
	@:op(A == B) @:commutative private static function eqFloat(a:JDouble, b:Float):JBoolean;

	@:op(A != B) private static function neq(a:JDouble, b:JDouble):JBoolean;
	@:op(A != B) @:commutative private static function neqInt(a:JDouble, b:Int):JBoolean;
	@:op(A != B) @:commutative private static function neqFloat(a:JDouble, b:Float):JBoolean;

	@:op(A < B) private static function lt(a:JDouble, b:JDouble):JBoolean;
	@:op(A < B) private static function ltInt(a:JDouble, b:Int):JBoolean;
	@:op(A < B) private static function intLt(a:Int, b:JDouble):JBoolean;
	@:op(A < B) private static function ltFloat(a:JDouble, b:Float):JBoolean;
	@:op(A < B) private static function floatLt(a:Float, b:JDouble):JBoolean;

	@:op(A <= B) private static function lte(a:JDouble, b:JDouble):JBoolean;
	@:op(A <= B) private static function lteInt(a:JDouble, b:Int):JBoolean;
	@:op(A <= B) private static function intLte(a:Int, b:JDouble):JBoolean;
	@:op(A <= B) private static function lteFloat(a:JDouble, b:Float):JBoolean;
	@:op(A <= B) private static function floatLte(a:Float, b:JDouble):JBoolean;

	@:op(A > B) private static function gt(a:JDouble, b:JDouble):JBoolean;
	@:op(A > B) private static function gtInt(a:JDouble, b:Int):JBoolean;
	@:op(A > B) private static function intGt(a:Int, b:JDouble):JBoolean;
	@:op(A > B) private static function gtFloat(a:JDouble, b:Float):JBoolean;
	@:op(A > B) private static function floatGt(a:Float, b:JDouble):JBoolean;

	@:op(A >= B) private static function gte(a:JDouble, b:JDouble):JBoolean;
	@:op(A >= B) private static function gteInt(a:JDouble, b:Int):JBoolean;
	@:op(A >= B) private static function intGte(a:Int, b:JDouble):JBoolean;
	@:op(A >= B) private static function gteFloat(a:JDouble, b:Float):JBoolean;
	@:op(A >= B) private static function floatGte(a:Float, b:JDouble):JBoolean;
	
	public function equals(o : Dynamic) : JBoolean
	{
		if (Std.instance(o, JDouble) != null) {
			cast(o, JDouble);
			return o == this;
		} else {
			return false;
		}
	}
	
	public function compareTo(o : JDouble) : JInt
	{
		return compare(this, o);
	}
	
	public static function compare(x : JDouble, y : JDouble) : JInt
	{
		if (x < y)
		{
			return -1;
		}
		if (x > y)
		{
			return 1;
		}
		if (x == y)
		{
			return 0;
		}
		if (Math.isNaN(x))
		{
			if (Math.isNaN(y))
			{
				return 0;
			}
			else
			{
				return 1;
			}
		}
		else
		{
			return -1;
		}
	}
	
	public function hashCode() : JInt
	{
		return toInt();
	}
	

	public function isInfinite() : JBoolean
	{
		return !Math.isFinite(this);
	}

	public function isNaN() : JBoolean
	{
		return Math.isNaN(this);
	}
	

	public static function doubleToLongBits(value : JDouble) : JLong {
		var out : BytesBuffer = new BytesBuffer();
		out.addDouble(value);
		var bytes = out.getBytes();
		//trace(bytes);
		//trace(bytes.length);
		var high : Int = bytes.get(0) << 24 | bytes.get(1) << 16 | bytes.get(2) << 8 | bytes.get(3);
		var low : Int = bytes.get(4) << 24 | bytes.get(5) << 16 | bytes.get(6) << 8 | bytes.get(7);
		var longValue : JLong = JLong.make(high, low);
		return longValue;
	}
	
	public static function longBitsToDouble(bits : JLong) : JDouble {
		//return bits.toFloat();
		var high : Int32 = JLongData.getHigh(bits);
		var low : Int32 = JLongData.getLow(bits);
		var out : BytesBuffer = new BytesBuffer();
		
		var b : Int = (high >> 24) & 0xFF;
		out.addByte(b);
		b = (high >> 16) & 0xFF;
		out.addByte(b);
		b = (high >> 8) & 0xFF;
		out.addByte(b);
		b = high & 0xFF;
		out.addByte(b);
		b = (low >> 24) & 0xFF;
		out.addByte(b);
		b = (low >> 16) & 0xFF;
		out.addByte(b);
		b = (low >> 8) & 0xFF;
		out.addByte(b);
		b = low & 0xFF;
		out.addByte(b);
		
		var bytes = out.getBytes();
		var floatValue : Float = bytes.getDouble(0);
		return floatValue;
	}
	
	public static function parseDouble(s : String) : JDouble
	{
		return Std.parseFloat(s);
	}

	public static function toString(b : Float) : JString
	{
		return Std.string(b);
	}
	
	public static function valueOf(value : JDouble) : JDouble
	{
		return value;
	}
	
	public function byteValue() : JByte {
		return cast(intValue(), JByte);
	}
	
	public function shortValue() : JShort {
		return cast(intValue(), JShort);
	}
	
	public function intValue() : JInt {
		return Std.int(this);
	}
	
	
}


