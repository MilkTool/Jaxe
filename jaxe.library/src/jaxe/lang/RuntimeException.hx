package jaxe.lang;


class RuntimeException extends Exception
{
	public function new()
	{
		super();
	}

	public override function __ctor_String_Throwable(message : String, cause : Throwable)
	{
		super.__ctor_String_Throwable(message, cause);
		return this;
	}

	public override function __ctor_String(message : String)
	{
		this.__ctor_String_Throwable(message, null);
		return this;
	}

	public override function __ctor_Throwable(cause : Throwable)
	{
		this.__ctor_String_Throwable(null, cause);
		return this;
	}

	public override function __ctor()
	{
		this.__ctor_String_Throwable(null, null);
		return this;
	}
}
