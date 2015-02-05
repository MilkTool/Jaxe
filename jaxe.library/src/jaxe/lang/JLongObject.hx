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

class JLongObject extends Number
{

	public static var MAX_VALUE:JLong = new JLong(JLongData.make(0x7fffffff, -1));
	public static var MIN_VALUE:JLong = new JLong(JLongData.make(0x80000000, 0));
	public static var TYPE : JClass = JLong;
	public static var SIZE : JInt = 64;
	static inline var TWO_32:Float =  4294967296.0;
	private var value : JLong;
	
	public function new() {
		super();
	}
	
	public function __ctor_long(x : JLong) {
		value = x;
		return this;
	}
	
	public function __ctor_String(x : JString) {
		// TODO
		//value = x;
		return this;
	}

	public static function decodeLongString(s: JString) : JLong {
		
		if ((s.equals_Object("0x8000000000000000L")) || (s.equals_Object("-9223372036854775808L"))) {
			return JLong.MIN_VALUE;
		}
		
		if ((s.equals_Object("7FFFFFFFFFFFFFFFL")) || (s.equals_Object("9223372036854775807L"))) {
			return JLong.MAX_VALUE;
		}
		
		//trace("decodeLongString: " + s);
		if (s.endsWith_String("L")) {
			s = s.substring(0, s.length() - 1);
		}
		//trace("decodeLongString 2: " + s);
		return decode_String(s);
	}
	
	/**
   * Parses the specified string and returns a {@code Long} instance if the
   * string can be decoded into a long value. The string may be an optional
   * minus sign "-" followed by a hexadecimal ("0x..." or "#..."), octal
   * ("0..."), or decimal ("...") representation of a long.
   * 
   * @param string
   *            a string representation of a long value.
   * @return a {@code Long} containing the value represented by {@code string}.
   * @throws NumberFormatException
   *             if {@code string} can not be parsed as a long value.
   */
	public static function decode_String(s: JString): JLong { //throws NumberFormatException {
      var length : Int = s.length();
	  var i : Int = 0;
      if (length == 0) {
          throw new NumberFormatException();
      }
      var firstDigit = s.charAt(i);
      var negative: JBoolean = firstDigit == '-';
      if (negative) {
          if (length == 1) {
              throw NumberFormatException.create(s);
          }
          firstDigit = s.charAt(++i);
      }

      var base = 10;
      if (firstDigit == '0') {
          if (++i == length) {
              return 0;
          }
          if ((firstDigit = s.charAt(i)) == 'x' || firstDigit == 'X') {
              if (i == length) {
                  throw NumberFormatException.create(s);
              }
              i++;
              base = 16;
          } else {
              base = 8;
          }
      } else if (firstDigit == '#') {
          if (i == length) {
              throw NumberFormatException.create(s);
          }
          i++;
          base = 16;
      }
	  
	  //trace("base=" + base + " i=" + i + " negative=" + negative);
	  
      var result : JLong = parse(s, i, base, negative);
      return result;

  }
  
  
  private static function parse(string: JString, offset: JInt , radix : JInt, negative: JBoolean): JLong {
		var max : JLong = JLong.MIN_VALUE / radix;
		var result : JLong = 0;
		var length : Int = string.length();
		while (offset < length) {
			var digit : Int = JChar.digit(string.charAt(offset++), radix);
			if (digit == -1) {
				throw NumberFormatException.create(string);
			}
			if (max > result) {
				throw NumberFormatException.create(string);
			}
			var next : JLong = result * radix - digit;
			if (next > result) {
				throw NumberFormatException.create(string);
			}
			result = next;
		}
		if (!negative) {
			result = -result;
			if (result < 0) {
				throw NumberFormatException.create(string);
			}
		}
     return result;
	}
	
	public override function longValue() : JLong {
		return this.value;
	}
	
	public static function valueOf_long(val: JLong) : JLongObject {
		return new JLongObject().__ctor_long(val);
	}
	
	public static function compare_long_long(x : JLong, y : JLong) : Int
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
	
	
	public function compareTo_Long(o : JLongObject) : JInt
	{
		return cast(this.value - o.value, JInt);
	}

	public function equals_Object(o : Dynamic) : JBoolean
	{
		if (Std.instance(o, JLongObject) != null) {
			cast(o, JLongObject);
			return o.value == this.value;
		} else {
			return false;
		}
	}

	public override function hashCode() : JInt
	{
		//return (int)(this.longValue()^(this.longValue()>>>32))
		var v = JLongData.ushr(this.value, 32);
		v = JLongData.xor(this.value, v);
		return JLongData.toInt(v);
	}
	
	public static function toString_long(i: JLong) : JString {
		// FIXME
		return toString_long_int(i, 10);
	}
	
	public static function toString_long_int(i: JLong, radix: JInt) : JString {
		// FIXME
		return Std.string(i);
	}
	
	public static function parseLong_String(s: JString) : JLong {
		// FIXME
		return parseLong_String_int(s, 10);
	}
	
	public static function parseLong_String_int(s: JString, radix: JInt) : JLong {
		// FIXME
		return JLongObject.decode_String(s);
	}
	
	
	
  
}
