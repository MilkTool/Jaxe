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
 
class JByteObject extends Number {
	
	public static var MAX_VALUE : JByte = 0x7F;
	public static var MIN_VALUE : JByte = 0x80;
	public static var SIZE : JInt = 8;
	public static var TYPE : JClass = JByteObject;
	private var value : JByte;
	
	public function new() 
	{
		super();
	}
	
	public function __ctor_byte(x : JByte) {
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
		if (Std.instance(o, JByte) != null) {
			cast(o, JByte);
			return o == this;
		} else {
			return false;
		}
	}
	
	public function compareTo_Byte(o : JByteObject) : JInt
	{
		return cast(this.value - o.value, JInt);
	}

	public static function compare_byte_byte(x : JByte, y : JByte) : JInt
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
	
	public function hashCode() : JInt
	{
		return cast(this.value, JInt);
	}
	
	public static function valueOf_byte(value : JByte) : JByteObject
	{
		return new JByteObject().__ctor_byte(value);
	}
	
	public function byteValue() : JByte {
		return this.value;
	}
	
	public function shortValue() : JShort {
		return cast(this.value, JShort);
	}
	
	public function intValue() : JInt {
		return cast(this.value, JInt);
	}
	
	public function longValue() : JLong {
		return JLong.fromInt(this.value);
	}
	
	public function toString() : JString {
		return Std.string(this);
	}
}
