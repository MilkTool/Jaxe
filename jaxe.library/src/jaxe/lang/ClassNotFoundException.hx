package jaxe.lang;

class ClassNotFoundException extends Exception
{
	public function new()
	{
		super();
	}

	private var cause2 : Throwable;

	public override function __ctor_String_Throwable(message : String, cause : Throwable)
	{
		super.__ctor_String_Throwable(message, cause);
		cause2 = cause;
		return this;
	}

	public override function __ctor1(message : String)
	{
		this.__ctor_String_Throwable(message, null);
		return this;
	}

	public override function __ctor2()
	{
		this.__ctor_String_Throwable(null, null);
		return this;
	}
}
