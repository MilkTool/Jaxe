package jaxe.lang;

import haxe.io.StringInput;
import haxe.io.Bytes;

/**
 * ...
 * @author G.Legris
 */
@:forward(charAt, charCodeAt, toLowerCase, toUpperCase, substring, lastIndexOf, indexOf)
abstract JString(String) from String to String
{

	inline function new(s: String) 
	{
		this = s;
	}
	
	public function test(): Void {
		trace("JString.test()");
	}
	
	/*public function hashCode() : Int {
		return HashCodeGenerator.getNextHashCode();
	}*/
	
	public function hashCode() : JInt
	{
		var hashCode : Int = 0; // FIXME should be a class field for caching the hash code value
		if (hashCode == 0)
		{
			/*var h : Int = 0;
			{
				var i : Int = 0;
				while(i < this.length) {
					h = (h * 31) + this.charCodeAt(i);
					i++; 
				}
			}
			hashCode = h;*/
			
			var h : Int = 0;
			{
				var i : Int = 0;
				if (i < this.length)
				do
				{
					h = (h * 31) + this.charCodeAt(i);
				}
				while ( {++i; i < this.length; } );
			}
			hashCode = h;
			
		}
		return hashCode;
	}
	
	
	public function length() : JInt {
		return this.length;
	}
	
	public function compareTo_String(s : JString) : JInt
	{
		if (this == s)
		{
			return 0;
		}
		var idx : Int = 0;
		var result : Int;
		var end : Int = (length() < s.length() ? length() : s.length());
		while (idx < end)
		{
			if ((result = this.charCodeAt(idx) - s.charCodeAt(idx)) != 0)
			{
				return result;
			}
			idx++;
		}
		return this.length - s.length();
	}
	
	public function compareToIgnoreCase_String(s : JString) : JInt
	{
		if (this == s)
		{
			return 0;
		}
		var idx : Int = 0;
		var result : Int;
		var end : Int = (this.length < s.length() ? this.length : s.length());
		while (idx < end)
		{
			if ((result = (this.charAt(idx).toLowerCase().charCodeAt(0)) - s.charAt(idx).toLowerCase().charCodeAt(0)) != 0)
			{
				return result;
			}
			idx++;
		}
		return this.length - s.length();
	}
	
	public function equals_Object(o : Dynamic) : JBoolean
	{
		if (this == o)
		{
			return true;
		}
		else
		{
			if (Std.instance(o, String) != null)
			{
				return ((o.length == length) && (compareTo_String(o) == 0));
			}
			else
			{
				return false;
			}
		}
	}
	
	public function equalsIgnoreCase_String(o : JString) : JBoolean
	{
		if (this == o)
		{
			return true;
		}
		else
		{
			return ((o.length == length) && (compareToIgnoreCase_String(o) == 0));
		}
	}
	
	public function startsWith_String(s : JString) : JBoolean
	{
		if (length() >= s.length())
		{
			return s.compareTo_String(this.substring(s.length())) == 0;
		}
		else
		{
			return false;
		}
	}

	public function startsWith_String_int(s : JString, start : JInt) : JBoolean
	{
		if (length() >= s.length() + start)
		{
			return s.compareTo_String(this.substring(s.length())) == 0;
		}
		else
		{
			return false;
		}
	}
	
	public function endsWith_String(s : JString) : JBoolean
	{	
		if (length() >= s.length()) 		
		{
			return s.compareTo_String(this.substring(length() - s.length(), length())) == 0;
		}
		else
		{
			return false;
		}
		
	}
	
	public function replace_char_char(oldChar : JChar, newChar : JChar) : JString
	{
		return cast(StringTools.replace(this, oldChar, newChar), JString);
	}
	
	public function getBytes() : Array<JByte>
	{
		//var input: StringInput = new StringInput(this);
		//var bytes : Bytes = input.readAll();
		var bytes : Bytes = Bytes.ofString(this);
		var byteArray = new Array<JByte>();
		for (i in 0 ... bytes.length) {
			byteArray[i] = bytes.get(i);
		}
		return byteArray;
		
	}
	
	
	/**
	 * Required because JClass doesn't inherit from JObject
	 * @return JClass
	 */ 
	public function getClass(): JClass {
		return Type.getClass(JString);
	}
	
	
	public static function valueOf_float(f: JFloat): JString {
		return JFloatObject.toString_float(f);
	}
	
	public static function valueOf_double(f: JDouble): JString {
		return JDoubleObject.toString_double(f);
	}
	
}