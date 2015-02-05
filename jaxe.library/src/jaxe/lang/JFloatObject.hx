package jaxe.lang;

import haxe.Int32;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;

/**
 * @author G.Legris
 */
class JFloatObject extends Number {
	
	public static var MAX_VALUE : JFloat = 3.4028234663852886e38;
	public static var MIN_VALUE : JFloat = 1.401298464324817e-45;
	public static var MIN_NORMAL : JFloat = 1.1754943508222875e-38;
	public static var MAX_EXPONENT : JInt = 127;
	public static var MIN_EXPONENT : JInt = -126;
	public static var NaN : JFloat = 0.0/0.0; // FIXME
	public static var NEGATIVE_INFINITY : JFloat = -1.0/0.0; // FIXME
	public static var POSITIVE_INFINITY : JFloat = 1.0/0.0; // FIXME
	public static var SIZE : JInt = 32;
	public static var TYPE : JClass = JFloatObject;
	private var value : JFloat;
	
	public function new() 
	{
		super();
	}
	
	public function __ctor_float(x : JFloat) {
		value = x;
		return this;
	}
	
	public function __ctor_String(x : JString) {
		// TODO
		//value = x;
		return this;
	}
	
	public function equals_Object(o : Dynamic) : JBoolean
	{
		if (Std.instance(o, JFloat) != null) {
			cast(o, JFloat);
			return o == this;
		} else {
			return false;
		}
	}
	
	public function compareTo_Float(o : JFloatObject) : JInt
	{
		return compare_float_float(this.value, o.value);
	}
	
	public static function compare_float_float(x : JFloat, y : JFloat) : JInt
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
	
	public static function floatToIntBits_float(value : JFloat) : JInt {
		var out : BytesBuffer = new BytesBuffer();
		out.addFloat(value);
		var bytes = out.getBytes();
		var intValue : Int = bytes.get(0) << 24 | bytes.get(1) << 16 | bytes.get(2) << 8 | bytes.get(3);
		return intValue;
	}
	
	public static function intBitsToFloat_int(bits : JInt) : JFloat {
		var out : BytesBuffer = new BytesBuffer();
		var b : Int = (bits >> 24) & 0xFF;
		out.addByte(b);
		b = (bits >> 16) & 0xFF;
		out.addByte(b);
		b = (bits >> 8) & 0xFF;
		out.addByte(b);
		b = bits & 0xFF;
		out.addByte(b);
		
		var bytes = out.getBytes();
		var floatValue : Float = bytes.getDouble(0);
		return floatValue;
	}
	
	public override function hashCode() : JInt
	{
		return intValue();
	}
	

	public function isInfinite() : JBoolean
	{
		return isInfinite_float(this.value);
	}
	
	public static function isInfinite_float(f: JFloat) : JBoolean
	{
		return !Math.isFinite(f);
	}

	public function isNaN() : JBoolean
	{
		return isNaN_float(this.value);
	}
	
	public static function isNaN_float(f: JFloat) : JBoolean
	{
		return Math.isNaN(f);
	}
	
	
	public static function parseFloat_String(s : String) : JDouble
	{
		return Std.parseFloat(s);
	}

	public static function toString_float(b : Float) : JString
	{
		return Std.string(b);
	}
	
	public static function valueOf_float(value : JFloat) : JFloatObject
	{
		return new JFloatObject().__ctor_float(value);
	}
	
	public static function valueOf_String(s : JString) : JFloatObject
	{
		return valueOf_float(parseFloat_String(s));
	}
	
	public static function valueOf_String_int(s : JString, radix: JInt) : JFloatObject
	{
		return valueOf_float(parseFloat_String(s)); // FIXME
	}
	
	public override function byteValue() : JByte {
		return cast(intValue(), JByte);
	}
	
	public override function shortValue() : JShort {
		return cast(intValue(), JShort);
	}
	
	public override function intValue() : JInt {
		return Std.int(this.value);
	}
	
	
}


