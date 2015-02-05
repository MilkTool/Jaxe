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
 
 
class JShortObject extends Number {
	
	public static var MIN_VALUE : JShort = 0x8000;
	public static var MAX_VALUE : JShort = 0x7fff;
	public static var SIZE : JInt = 16;
	public static var TYPE : JClass = JShortObject;
	private var value : JShort;
	
	public function new() {
	}
	
	public function __ctor_short(x : JShort) {
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
		if (Std.instance(o, JShort) != null) {
			cast(o, JShort);
			return o == this;
		} else {
			return false;
		}
	}
	
	public function compareTo_Short(o : JShortObject) : JInt
	{
		return cast(this.value - o.value, JInt);
	}

	public static function compare_short_short(x : JShort, y : JShort) : Int
	{
		return x - y;
	}
	
	public function hashCode() : JInt
	{
		return this;
	}
	
	public static function valueOf_short(value : JShort) : JShort
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
