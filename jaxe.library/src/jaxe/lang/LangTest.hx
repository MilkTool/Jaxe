package jaxe.lang;

import neko.Lib;

/**
 * ...
 * @author G.Legris
 */

class LangTest 
{
	
	static var testMessage : String = "";
	static var testIndex : Int = 1;
	
	public function new() {
		
	}
	
	public function test_Class() 
	{
		var object1 = new Object1();
		setCheckPoint("getClass");
		var clazz:JClass = object1.getClass();
		checkValue(clazz.getName(), "jaxe.lang.Object1");
		//trace("[TEST] getClass: " + clazz.getName());
		setCheckPoint("newInstance");
		var object2 = clazz.newInstance(); 
		var n = object2.getNumber();
		checkValue(n, 3);
		setCheckPoint("forName");
		clazz = JClass.forName("jaxe.lang.Object1");
		checkValue(clazz.getName(), "jaxe.lang.Object1");
		setCheckPoint("isInstance");
		var success = clazz.isInstance(object2);
		check(success);
		success = clazz.isInstance(n);
		check(!success);
		setCheckPoint("isAssignableFrom");
		success = new JObject().getClass().isAssignableFrom(clazz);
		check(success);
		setCheckPoint("hashCode");
		check(object1.hashCode() != object2.hashCode());
		
		//var anArray = [ 1, 2 ];
		//success = Type.getClass  anArray
		
		
		/*var s:JString = "One";
		s = s + "Two";
		s.test();
		trace(s);*/
		
		
		
		
	}
	
	// Note for Java2Haxe: substitute long value and "new Long" by JLong.decodeLongString() or string literal (i.e " ")
	public function test_Long_Basics() {
		setCheckPoint("Long");
        var min1 = JLong.MIN_VALUE;
        var min2 = JLong.decodeLongString("0x8000000000000000L");
        var max1 = JLong.MAX_VALUE;
        var max2 = JLong.decodeLongString("0x7fffffffffffffffL");
        check(!(min1 != min2 || max1 != max2));
		
		var minLong1: JLong = JLong.MIN_VALUE;
		var minLong2: JLong = "0x8000000000000000L";
        var maxLong1: JLong = JLong.MAX_VALUE;
        var maxLong2: JLong = "0x7fffffffffffffffL";
        check(!(minLong1 != minLong2 || maxLong1 != maxLong2));

        var i1 : JLong = "0x100";
		//trace(i1);
        check(i1.longValue() == 256);
		var i1 : JLong = "0x1000000000";
		//trace(i1);
        check(i1.longValue() == 68719476736);
		var i1 : JLong = "0x8000000000000000L";
		//trace(i1);
		check(i1 == JLong.MIN_VALUE);

    }
	
	public function test_Short_Basics() {
		setCheckPoint("Short");
        /*var min1 = JLong.MIN_VALUE;
        var min2 = JLong.decodeLongString("0x8000000000000000L");
        var max1 = JLong.MAX_VALUE;
        var max2 = JLong.decodeLongString("0x7fffffffffffffffL");
        check(!(min1 != min2 || max1 != max2));*/

        var i1 : JShort = -128;
		trace(i1);
		i1 = i1 * i1;
		trace (i1);
        /*check(i1.longValue() == 256);
		var i1 = JLong.decodeLongString("0x1000000000");
		trace(i1);
        check(i1.longValue() == 68719476736);
		var i1 = JLong.decodeLongString("0x8000000000000000L");
		trace(i1);*/


    }
	
	public function test_Byte_Basics() {
		setCheckPoint("Byte");
        /*var min1 = JLong.MIN_VALUE;
        var min2 = JLong.decodeLongString("0x8000000000000000L");
        var max1 = JLong.MAX_VALUE;
        var max2 = JLong.decodeLongString("0x7fffffffffffffffL");
        check(!(min1 != min2 || max1 != max2));*/

        var i1 : JByte = 120;
		trace(i1);
		i1 = i1 + 8;
		trace (i1);
		check(i1 == -128);
		i1 = i1 * i1;
		trace (i1);
		check(i1 == 0);
        /*check(i1.longValue() == 256);
		var i1 = JLong.decodeLongString("0x1000000000");
		trace(i1);
        check(i1.longValue() == 68719476736);
		var i1 = JLong.decodeLongString("0x8000000000000000L");
		trace(i1);*/


    }
	
	
	public function test_Double() {
		setCheckPoint("Double");
		var d : JDouble = 234.56;
		var longValue : JLong = JDouble.doubleToLongBits(d);
		//trace(longValue);
		var doubleValue : JDouble = JDouble.longBitsToDouble(longValue);
		//trace("v == 234.56 ? " + doubleValue);
		check(doubleValue == d);
		
		
	}
	
	public function test_Math() {
		
		setCheckPoint("Math");
		var val = JMath.abs(-5);
		check(val == 5);
		
	}
	
	public function test_Char() {
		setCheckPoint("Char");
		var c : JChar = 'c';
		var i : Int = 3;
		check(c == 99);
		i = c + i; // Test if + operation is commutative
		i = i + c;
		check(i == 201);
		c = 'c';
		i = 3;
		i = c - i;
		i = i - c;
		trace(i);
		check(i == -3);
		i = JChar.fromString('c') + JChar.fromString('a');
		check(i == 196);
		i = ('c' : JChar) + ('a' : JChar); // Type check
		check(i == 196);
		
		
	}
	
	public function test_String() {
		setCheckPoint("String");
		var aString : JString = "Hello Haxe !";
		var newString : JString = aString.replace('e', '$');
		check(newString.equals("H$llo Hax$ !"));
	}
	
	static function main() 
	{
		
		var testSuite:LangTest = new LangTest();
		testSuite.test_Class();
		testSuite.test_Long_Basics();
		testSuite.test_Short_Basics();
		testSuite.test_Byte_Basics();
		testSuite.test_Double();
		testSuite.test_Math();
		testSuite.test_Char();
		testSuite.test_String();
		
		var time: JLong = System.currentTimeMillis();
		trace("time = " + time.toString());
		Sys.sleep(0.1);
		time = System.currentTimeMillis();
		trace("time = " + time.toString());
		
		
		
	}
	
	public function setCheckPoint(msg: String) {
		testMessage = msg;
		testIndex = 1;
	}
	
	public function check(b : JBoolean): JBoolean {
		var successMessage : String = (b == true) ? "OK" : "FAIL";
		trace("[TEST] " + testMessage +  " (" + testIndex + "): " +  successMessage);
		testIndex++;
		return b;
	}
	
	public function checkValue(a: Dynamic, b : Dynamic): Void {
		check(a == b);
	}
	
	
	
}