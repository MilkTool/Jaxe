package jaxe.io;

class FilterOutputStream extends OutputStream
{
	public function new()
	{
	}

	 var out : OutputStream;

	public function __ctor0(out : OutputStream)
	{
		this.out = out;
		return this;
	}

	/// <exception cref="jaxe.io.IOException"></exception>
	public override function close() : Void
	{
		out.close();
	}

	/// <exception cref="jaxe.io.IOException"></exception>
	public override function flush() : Void
	{
		out.flush();
	}

	/// <exception cref="jaxe.io.IOException"></exception>
	public override function write(b : Array<Byte>) : Void
	{
		out.write(b);
	}

	/// <exception cref="jaxe.io.IOException"></exception>
	public override function write1(b : Array<Byte>, off : Int, len : Int) : Void
	{
		out.write1(b, off, len);
	}

	/// <exception cref="jaxe.io.IOException"></exception>
	public override function write2(b : Int) : Void
	{
		out.write2(b);
	}
}
