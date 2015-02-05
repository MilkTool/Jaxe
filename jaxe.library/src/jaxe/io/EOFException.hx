package jaxe.io;

@:System.Serializable
class EOFException extends IOException
{
	public function new()
	{
	}

	public function __ctor0(message : String)
	{
		super.__ctor0(message);
		return this;
	}

	public function __ctor1()
	{
		this.__ctor0(null);
		return this;
	}
}
