package jaxe.lang;

/**
 * ...
 * @author ...
 */
class JObject
{
	private var hash_code: Int = 0;

	public function new() 
	{
		
	}
	
	public function __ctor()
	{
		return this;
	}
	
	public function getClass() : JClass {
		return Type.getClass(this);
		//return null;
	}
	
	public function hashCode() : JInt {
		if (hash_code == 0) {
			hash_code = HashCodeGenerator.getNextHashCode();
		}
		return hash_code;
	}
	
	public function toString() : JString {
		return Std.string(this);
	}
	
	public function equals(o : Dynamic) : JBoolean
	{
		return this == o;
	}
	
}