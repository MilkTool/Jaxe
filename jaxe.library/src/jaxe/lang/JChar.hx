package jaxe.lang;

import haxe.Utf8;

abstract JChar(Int) from Int to Int {
	
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
	public static var TYPE : JClass = JChar;

  inline function new(i:Int) {
    this = i;
  }
	
  @:from
  public static inline function fromString(s:String): JChar {
    return Utf8.charCodeAt(s, 0);
  }
  
  @:from
  public static inline function fromInt(i:Int) : JChar {
    return new JChar(i);
  }
  
  @:to
  public inline function toInt(): Int {
    return this;
  }
  
  @:to
  public inline function toJInt(): JInt {
    return this;
  }
  
  @:to
  public inline function toString(): JString {
    return String.fromCharCode(this);
  }
  
  /*@:op(A + B) public static inline function add(a:JChar, b:JChar):JChar {
		return a + b;
  }*/
 
  @:commutative @:op(A + B) public static inline function addInt(a:JChar, b:Int):JInt {
		return a + b;
  }
  
  @:op(A - B) public static inline function sub(a:JChar, b:JChar):JInt {
		return a - b;
  }
  
  @:op(A - B) public static inline function subInt(a:JChar, b:Int):JInt {
		return a - b;
  }
  
  @:op(A - B) public static inline function intSub(a:Int, b:JChar):JInt {
		return a - b;
  }
  
  @:commutative @:op(A * B) public static inline function mulInt(a:JChar, b:Int):JInt {
		return a * b;
  }
  
	@:op(A == B) private static function eq(a:JChar, b:JChar):JBoolean;
	@:op(A == B) @:commutative private static function eqInt(a:JChar, b:Int):JBoolean;
	@:op(A == B) @:commutative private static function eqFloat(a:JChar, b:Float):JBoolean;

	@:op(A != B) private static function neq(a:JChar, b:JChar):JBoolean;
	@:op(A != B) @:commutative private static function neqInt(a:JChar, b:Int):JBoolean;
	@:op(A != B) @:commutative private static function neqFloat(a:JChar, b:Float):JBoolean;

	@:op(A < B) private static function lt(a:JChar, b:JChar):JBoolean;
	@:op(A < B) private static function ltInt(a:JChar, b:Int):JBoolean;
	@:op(A < B) private static function intLt(a:Int, b:JChar):JBoolean;
	@:op(A < B) private static function ltFloat(a:JChar, b:Float):JBoolean;
	@:op(A < B) private static function floatLt(a:Float, b:JChar):JBoolean;

	@:op(A <= B) private static function lte(a:JChar, b:JChar):JBoolean;
	@:op(A <= B) private static function lteInt(a:JChar, b:Int):JBoolean;
	@:op(A <= B) private static function intLte(a:Int, b:JChar):JBoolean;
	@:op(A <= B) private static function lteFloat(a:JChar, b:Float):JBoolean;
	@:op(A <= B) private static function floatLte(a:Float, b:JChar):JBoolean;

	@:op(A > B) private static function gt(a:JChar, b:JChar):JBoolean;
	@:op(A > B) private static function gtInt(a:JChar, b:Int):JBoolean;
	@:op(A > B) private static function intGt(a:Int, b:JChar):JBoolean;
	@:op(A > B) private static function gtFloat(a:JChar, b:Float):JBoolean;
	@:op(A > B) private static function floatGt(a:Float, b:JChar):JBoolean;

	@:op(A >= B) private static function gte(a:JChar, b:JChar):JBoolean;
	@:op(A >= B) private static function gteInt(a:JChar, b:Int):JBoolean;
	@:op(A >= B) private static function intGte(a:Int, b:JChar):JBoolean;
	@:op(A >= B) private static function gteFloat(a:JChar, b:Float):JBoolean;
	@:op(A >= B) private static function floatGte(a:Float, b:JChar):JBoolean;
	
	public static function charCount(codePoint : Int) : Int
	{
		return codePoint >= MIN_SUPPLEMENTARY_CODE_POINT ? 2 : 1;
	}
	
	public static function valueOf(value : JChar) : JChar
	{
		return value;
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
	
	public function compareTo(o : JChar) : Int
	{
		return this - o;
	}

	public function equals(o : Dynamic) : JBoolean
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
	
	public static function toLowerCase(c : JChar) : JChar
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
	
	public static function toUpperCase(c : JChar) : JChar
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
	
	public static function isDigit(c : JChar) : JBoolean
	{
		return c >= '0' && c <= '9';
	}
	
	public static function digit(c : JChar, radix : JInt) : JInt
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
	
	public static function forDigit(digit : JInt, radix : JInt) : JChar
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

	public static function isLetter(c : JChar) : JBoolean
	{
		return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
	}

	public static function isLetterOrDigit(c : JChar) : JBoolean
	{
		return isDigit(c) || isLetter(c);
	}

	public static function isLowerCase(c : JChar) : JBoolean
	{
		return (c >= 'a' && c <= 'z');
	}

	public static function isUpperCase(c : JChar) : JBoolean
	{
		return (c >= 'A' && c <= 'Z');
	}
	
	public static function isSpace(c : JChar) : JBoolean
	{
		//@Deprecated
		return isWhitespace(c);
	}

	public static function isWhitespace(c : JChar) : JBoolean
	{
		//return c == ' ' || c == '\t' || c == '\n' || c == '\r';
		return StringTools.isSpace(c, 0);
	}

	public static function isSpaceChar(c : JChar) : JBoolean
	{
		return isWhitespace(c);
	}

	public static function isHighSurrogate(ch : JChar) : JBoolean
	{
		return ch >= '\uD800' && ch <= '\uDBFF';
	}

	public static function isLowSurrogate(ch : JChar) : JBoolean
	{
		return ch >= '\uDC00' && ch <= '\uDFFF';
	}
	
	public static function isISOControl(c : JInt) : JBoolean
	{
		return (c >= 0 && c <= 0x1f) || (c >= 0x7f && c <= 0x9f);
	}

	
}