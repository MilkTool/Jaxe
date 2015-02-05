package jaxe.lang;

import haxe.Int32;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;

/**
 * @author G.Legris
 */
class JDoubleObject extends Number {
	
	public static var MAX_VALUE : JDouble = 1.7976931348623157e+308;
	public static var MIN_VALUE : JDouble = 4.9e-324;
	public static var MIN_NORMAL : JDouble = 2.2250738585072014e-308;
	public static var MAX_EXPONENT : JInt = 1023;
	public static var MIN_EXPONENT : JInt = -1022;
	public static var NaN : JDouble = Math.NaN;
	public static var NEGATIVE_INFINITY : JDouble = Math.NEGATIVE_INFINITY;
	public static var POSITIVE_INFINITY : JDouble = Math.POSITIVE_INFINITY;
	public static var SIZE : JInt = 64;
	public static var TYPE : JClass = JDoubleObject;
	private var value : JDouble;
	
	public function new() 
	{
		super();
	}
	
	public function __ctor_double(x : JDouble) {
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
		if (Std.instance(o, JDouble) != null) {
			cast(o, JDouble);
			return o == this;
		} else {
			return false;
		}
	}
	
	public function compareTo_Double(o : JDoubleObject) : JInt
	{
		return compare_double_double(this.value, o.value);
	}
	
	public static function compare_double_double(x : JDouble, y : JDouble) : JInt
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
	
	public override function hashCode() : JInt
	{
		return intValue();
	}
	
	public function isInfinite() : JBoolean
	{
		return isInfinite_double(this.value);
	}
	
	public static function isInfinite_double(f: JDouble) : JBoolean
	{
		return !Math.isFinite(f);
	}
	
	public function isNaN() : JBoolean
	{
		return isNaN_double(this.value);
	}
	
	public static function isNaN_double(f: JDouble) : JBoolean
	{
		return Math.isNaN(f);
	}
	

	public static function doubleToLongBits_double(value : JDouble) : JLong {
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
	
	public static function longBitsToDouble_long(bits : JLong) : JDouble {
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
	
	public static function parseDouble_String(s : String) : JDouble
	{
		return Std.parseFloat(s);
	}

	public static function toString_double(b : JDouble) : JString
	{
		return Std.string(b);
	}
	
	public static function valueOf_double(value : JDouble) : JDoubleObject
	{
		return new JDoubleObject().__ctor_double(value);
	}
	
	public static function valueOf_String(s : JString) : JDoubleObject
	{
		return valueOf_double(parseDouble_String(s));
	}
	
	public static function valueOf_String_int(s : JString, radix: JInt) : JDoubleObject
	{
		return valueOf_double(parseDouble_String(s)); // FIXME
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
	
	public override function toString() : JString
	{
		return toString_double(this.value);
	}
	
	
}


