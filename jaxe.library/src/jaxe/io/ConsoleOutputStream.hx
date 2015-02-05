package jaxe.io;

class ConsoleOutputStream extends OutputStream
{
	public function new()
	{
		super();
	}

	/// <summary>Internal use only</summary>
	/// <param name="fd"></param>
	public function __create_ConsoleOutputStream0()
	{
		return this;
	}

	/// <exception cref="jaxe.io.IOException"></exception>
	public function __create_ConsoleOutputStream1(path : String)
	{
		this.__create_ConsoleOutputStream2(path, false);
		return this;
	}

	/// <exception cref="jaxe.io.IOException"></exception>
	public function __create_ConsoleOutputStream2(path : String, append : Bool)
	{
		return this;
	}

	/// <exception cref="jaxe.io.IOException"></exception>
	public override function write2(c : Int) : Void
	{
		Sys.stdout().writeByte(c);
	}

	// TODO
	//write(fd, b, offset, length);
	/// <exception cref="jaxe.io.IOException"></exception>
	public override function close() : Void
	{
	}
	// TODO
}
