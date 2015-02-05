package jaxe.lang;

/**
 * ...
 * @author G.Legris
 */
abstract JBoolean(Bool) from Bool to Bool
{
	public static var FALSE : JBoolean = false;
	public static var TRUE : JBoolean = true;
	public static var TYPE : JClass = JBoolean;

	inline function new(s: Bool) 
	{
		this = s;
	}
	
	/*@:to
	public inline function toBool(): Bool {
    return this;
	}*/
	
	@:op(!A) private function not():JBoolean;
	
	
}
