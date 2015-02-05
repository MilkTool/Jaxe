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
 
class JIntObject extends Number {
	
	public static var MAX_VALUE : JInt = 0x7fffffff;
	public static var MIN_VALUE : JInt = 0x80000000;
	public static var SIZE : JInt = 32;
	public static var TYPE : JClass = JIntObject;
	private var value : JInt;
	
	public function new() {
		super();
	}
	
	public function __ctor_int(x : JInt) {
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
		if (Std.instance(o, JIntObject) != null) {
			cast(o, JIntObject);
			return o.value == this.value;
		} else {
			return false;
		}
	}
	
	public function compareTo_Integer(o : JIntObject) : JInt
	{
		return cast(this.value - o.value, JInt);
	}

	public static function compare_int_int(x : JInt, y : JInt) : JInt
	{
		if (x < y)
		{
			return -1;
		}
		else
		{
			if (x > y)
			{
				return 1;
			}
			else
			{
				return 0;
			}
		}
	}
	
	public override function hashCode() : JInt
	{
		return this.value;
	}
	
	public static function valueOf_int(value : JInt) : JIntObject
	{
		return new JIntObject().__ctor_int(value);
	}
	
	public static function valueOf_String(s : JString) : JIntObject
	{
		return valueOf_int(parseInt_String(s));
	}
	
	public static function valueOf_String_int(s : JString, radix: JInt) : JIntObject
	{
		return valueOf_int(parseInt_String_int(s, radix));
	}
	
	public override function intValue() : JInt {
		return this.value;
	}
	
	public override function longValue() : JLong {
		return JLong.fromInt(this.value);
	}
	
	// TODO
	//public override function floatValue() : JLong {
		////return JLong.fromInt(this);
	//}
	//
	//public override function doubleValue() : JLong {
		////return JLong.fromInt(this);
	//}
	
	public override function toString() : JString {
		return Std.string(this.value);
	}
	
	public static function toString_int(i: JInt) : JString {
		// FIXME
		return toString_int_int(i, 10);
	}
	
	public static function toString_int_int(i: JInt, radix: JInt) : JString {
		// FIXME
		return Std.string(i);
	}
	
	public static function toHexString_int(i: JInt) : JString {
		// FIXME
		return Std.string(i);
	}
	
	public static function toOctalString_int(i: JInt) : JString {
		// FIXME
		return Std.string(i);
	}
	
	public static function toBinaryString_int(i: JInt) : JString {
		// FIXME
		return Std.string(i);
	}
	
	public static function parseInt_String(s: JString) : JInt {
		// FIXME
		return parseInt_String_int(s, 10);
	}
	
	public static function parseInt_String_int(s: JString, radix: JInt) : JInt {
		// FIXME
		return cast(JLongObject.decode_String(s), JInt);
	}
	
	
	
	
	
	
	
	
}
