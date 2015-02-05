package jaxe.lang;


class Exception extends Throwable
{
	public function new()
	{
		super();
	}

	public override function __ctor()
	{
		return this;
	}

	public override function __ctor_String(message : String)
	{
		super.__ctor_String(message);
		return this;
	}

	public override function __ctor_String_Throwable(message : String, cause : Throwable)
	{
		super.__ctor_String_Throwable(message, cause);
		return this;
	}

	public override function __ctor_Throwable(cause : Throwable)
	{
		super.__ctor_Throwable(cause);
		return this;
	}

	override function __ctor_String_Throwable_boolean_boolean(message : String, cause : Throwable, enableSuppression : Bool, 
		writableStackTrace : Bool)
	{
		super.__ctor_String_Throwable_boolean_boolean(message, cause, enableSuppression, writableStackTrace);
		return this;
	}
}


