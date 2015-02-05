package jaxe.lang;

class InterruptedException extends Exception
{
	public function new()
	{
	}

	public function __ctor0(message : String, cause : Throwable)
	{
		super.__ctor0(message, cause);
		return this;
	}

	public function __ctor1(message : String)
	{
		this.__ctor0(message, null);
		return this;
	}

	public function __ctor2(cause : Throwable)
	{
		this.__ctor0(null, cause);
		return this;
	}

	public function __ctor3()
	{
		this.__ctor0(null, null);
		return this;
	}
}
