package jaxe.lang;

/**
 * ...
 * @author G.Legris
 */
class JBooleanObject extends Number
{
	public static var FALSE : JBooleanObject = new JBooleanObject().__ctor_boolean(false);
	public static var TRUE : JBooleanObject = new JBooleanObject().__ctor_boolean(true);
	public static var TYPE : JClass = JBooleanObject;
	private var value : JBoolean;
	
	public function new() 
	{
		super();
	}
	
	public function __ctor_boolean(x : JBoolean) {
		value = x;
		return this;
	}
	
	public function __ctor_String(x : JString) {
		// TODO
		//value = x;
		return this;
	}
	
	public static function compare_boolean_boolean(x : JBoolean, y : JBoolean) : JInt
	{
		return (x == y) ? 0 : (x ? 1 : -1);
	}
	
	public function compareTo_Boolean(b : JBooleanObject) : JInt
	{
		return compare_boolean_boolean(this.value, b.value);
	}
	
	public function equals_Object(o : Dynamic) : JBoolean
	{
		if (Std.instance(o, JBooleanObject) != null) {
			cast(o, JBooleanObject);
			return o.value == this.value;
		} else {
			return false;
		}
	}

	public function hashCode() : JInt
	{
		// The Java API doc defines these magic numbers.
		return (this.value == true) ? 1231 : 1237;
	}
	
	public function booleanValue() : JBoolean
	{
		return this.value;
	}
	
	public static function valueOf_boolean(b : JBoolean) : JBooleanObject
	{
		return b ? TRUE : FALSE;
	}
	
	
}
