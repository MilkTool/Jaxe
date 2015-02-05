package jaxe.io;

import jaxe.lang.Exception;
import jaxe.lang.Throwable;

class IOException extends Exception
{
	public function new()
	{
		super();
	}

	public override function __ctor()
	{
		super.__ctor();
		return this;
	}

	public override function __ctor_String(message : String)
	{
		super.__ctor_String(message);
		return this;
	}

	public override function __ctor_String_Throwable(message : String, throwable : Throwable)
	{
		super.__ctor_String_Throwable(message, throwable);
		return this;
	}

	public override function __ctor_Throwable(throwable : Throwable)
	{
		super.__ctor_Throwable(throwable);
		return this;
	}
}
