package jaxe.lang;

import haxe.Utf8;

class JCharObject extends Number {
	
	public static var MIN_RADIX : Int = 2;
	public static var MAX_RADIX : Int = 36;
	public static var MIN_VALUE : JChar = '\u0000';
	public static var MAX_VALUE : JChar = '\uFFFF';
	public static var MIN_SURROGATE : JChar = '\uD800';
	public static var MAX_SURROGATE : JChar = '\uDFFF';
	public static var MIN_LOW_SURROGATE : JChar = '\uDC00';
	public static var MAX_LOW_SURROGATE : JChar = '\uDFFF';
	public static var MIN_HIGH_SURROGATE : JChar = '\uD800';
	public static var MAX_HIGH_SURROGATE : JChar = '\uDBFF';
	public static var MIN_SUPPLEMENTARY_CODE_POINT : JInt = 0x10000;
	public static var MIN_CODE_POINT : JInt = 0x0000;
	public static var MAX_CODE_POINT : JInt = 0x10FFFF;
	public static var TYPE : JClass = JCharObject;
	private var value : JChar;

	public function new() 
	{
		super();
	}
	
	public function __ctor_char(x : JChar) {
		value = x;
		return this;
	}
	
	public function __ctor_String(x : JString) {
		// TODO
		//value = x;
		return this;
	}
	
	public static function charCount(codePoint : Int) : Int
	{
		return codePoint >= MIN_SUPPLEMENTARY_CODE_POINT ? 2 : 1;
	}
	
	public static function valueOf(value : JChar) : JCharObject
	{
		return new JCharObject().__ctor_char(value);
	}
	
	public static function compare(x : JChar, y : JChar) : JInt
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
	
	public function compareTo_char(o : JChar) : JInt
	{
		return cast(this.value - o.value, JInt);
	}

	public function equals_Object(o : Dynamic) : JBoolean
	{
		if (Std.instance(o, JChar) != null) {
			cast(o, JChar);
			return o == this;
		} else {
			return false;
		}
	}

	public function hashCode() : Int
	{
		return this;
	}
	
	public function charValue() : JChar
	{
		return this;
	}
	
	public static function toLowerCase_char(c : JChar) : JChar
	{
		if (c >= 'A' && c <= 'Z')
		{
			return (c - 'A') + 'a';
		}
		else
		{
			return c;
		}
	}
	
	public static function toUpperCase_char(c : JChar) : JChar
	{
		if (c >= 'a' && c <= 'z')
		{
			return (c - 'a') + 'A';
		}
		else
		{
			return c;
		}
	}
	
	public static function isDigit_char(c : JChar) : JBoolean
	{
		return c >= '0' && c <= '9';
	}
	
	public static function digit_char_int(c : JChar, radix : JInt) : JInt
	{
		var digit : JInt = 0;
		if ((c >= '0') && (c <= '9'))
		{
			digit = c - '0';
		}
		else
		{
			if ((c >= 'a') && (c <= 'z'))
			{
				digit = c - 'a' + 10;
			}
			else
			{
				if ((c >= 'A') && (c <= 'Z'))
				{
					digit = c - 'A' + 10;
				}
				else
				{
					return -1;
				}
			}
		}
		if (digit < radix)
		{
			return digit;
		}
		else
		{
			return -1;
		}
	}
	
	public static function forDigit_int_int(digit : JInt, radix : JInt) : JChar
	{
		if (MIN_RADIX <= radix && radix <= MAX_RADIX)
		{
			if (0 <= digit && digit < radix)
			{
				if (digit < 10) {
					var value = digit + JChar.fromString('0');
					return JChar.fromInt(value);
				} else {
					var value = digit + JChar.fromString('a') - 10;
					return JChar.fromInt(value);
				}
			}
		}
		return 0;
	}

	public static function isLetter_char(c : JChar) : JBoolean
	{
		return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
	}

	public static function isLetterOrDigit_char(c : JChar) : JBoolean
	{
		return isDigit(c) || isLetter(c);
	}

	public static function isLowerCase_char(c : JChar) : JBoolean
	{
		return (c >= 'a' && c <= 'z');
	}

	public static function isUpperCase_char(c : JChar) : JBoolean
	{
		return (c >= 'A' && c <= 'Z');
	}
	
	public static function isSpace_char(c : JChar) : JBoolean
	{
		//@Deprecated
		return isWhitespace(c);
	}

	public static function isWhitespace_char(c : JChar) : JBoolean
	{
		//return c == ' ' || c == '\t' || c == '\n' || c == '\r';
		return StringTools.isSpace(c, 0);
	}

	public static function isSpaceChar_char(c : JChar) : JBoolean
	{
		return isWhitespace(c);
	}

	public static function isHighSurrogate_char(ch : JChar) : JBoolean
	{
		return ch >= '\uD800' && ch <= '\uDBFF';
	}

	public static function isLowSurrogate_char(ch : JChar) : JBoolean
	{
		return ch >= '\uDC00' && ch <= '\uDFFF';
	}
	
	public static function isISOControl_int(c : JInt) : JBoolean
	{
		return (c >= 0 && c <= 0x1f) || (c >= 0x7f && c <= 0x9f);
	}

	
}