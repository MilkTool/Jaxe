package jaxe.lang;

/**
 * ...
 * @author G.Legris
 */
abstract JClass(Class<Dynamic>) from Class<Dynamic> to Class<Dynamic>
{

	inline function new(c: Class<Dynamic>) 
	{
		this = c;
	}
	
	public function test(): Void {
		trace("JString.test()");
	}
	
	public function getName():String {
		return Type.getClassName(this);
	}
	
	public function newInstance(): Dynamic {
		return Type.createInstance(this, []);
	}
	
	public static function forName_String(className:String): Class<Dynamic> {
		return Type.resolveClass(className);
	}
	
	public function isInstance_Object(obj: Dynamic): JBoolean {
		if (Std.instance(obj, this) != null) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * Required because JClass doesn't inherit from JObject
	 * @return JClass
	 */ 
	public function getClass(): JClass {
		return JClass;
	}
	
	// FIXME Make it work with interfaces. Use haxe.rtti ?
	public function isAssignableFrom_Class(cls: JClass): JBoolean {
		var superClass : Class<Dynamic> = cls;
		do {
			//trace("superClass=" + Type.getClassName(superClass) + " == " + Type.getClassName(this) + " ?"); 
			if (superClass == this) {
				return true;
			}
		} while ((superClass = Type.getSuperClass(superClass)) != null);
		return false;
	}
	
	public function isArray(): JBoolean {
		return (this == Array);
	}
	
	public function hashCode() : Int {
		return HashCodeGenerator.getNextHashCode();
	}
	
}
