package jaxe.io;

import jaxe.lang.*;

class PrintStream extends OutputStream
{
	
	public function new()
	{
		super();
	}

	private var out : OutputStream;
	private var autoFlush : Bool;
	
	private static var newline : Array<JByte> = cast("\n", JString).getBytes(); 

	public function __create_PrintStream0(out : OutputStream, autoFlush : Bool)
	{
		this.out = out;
		this.autoFlush = autoFlush;
		return this;
	}

	public function __create_PrintStream1(out : OutputStream)
	{
		this.__create_PrintStream0(out, false);
		return this;
	}

	public function print(s : JString) : Void
	{
		{
			try
			{
				out.write(s.getBytes());
				if (autoFlush)
				{
					flush();
				}
			}
			catch (e : IOException)
			{
			}
		}
	}

	/*public function print1(o : Dynamic) : Void
	{
		print(haxen.Runtime.getStringValueOf(o));
	}

	public function print2(v : Bool) : Void
	{
		print(haxen.Runtime.getStringValueOf(v));
	}

	public function print3(c : Char) : Void
	{
		print(haxen.Runtime.getStringValueOf(c));
	}

	public function print4(v : Int) : Void
	{
		print(haxen.Runtime.getStringValueOf(v));
	}

	public function print5(v : Long) : Void
	{
		print(haxen.Runtime.getStringValueOf(v));
	}

	public function print6(v : Float) : Void
	{
		print(haxen.Runtime.getStringValueOf(v));
	}

	public function print7(v : Float) : Void
	{
		print(haxen.Runtime.getStringValueOf(v));
	}

	public function print8(s : Array<Char>) : Void
	{
		print(haxen.Runtime.getStringValueOf(s));
	}*/

	public function println_String(s : JString) : Void
	{
		{
			try
			{
				out.write(s.getBytes());
				out.write(newline);
				if (autoFlush)
				{
					flush();
				}
			}
			catch (e : IOException)
			{
			}
		}
	}

	public function println() : Void
	{
		{
			try
			{
				out.write(newline);
				if (autoFlush)
				{
					flush();
				}
			}
			catch (e : IOException)
			{
			}
		}
	}
	
	public function println_int(v : JInt) : Void
	{
		println_String(JIntObject.toString_int(v));
	}

	/*public function println2(o : Dynamic) : Void
	{
		println(haxen.Runtime.getStringValueOf(o));
	}

	public function println3(v : Bool) : Void
	{
		println(haxen.Runtime.getStringValueOf(v));
	}

	public function println4(c : Char) : Void
	{
		println(haxen.Runtime.getStringValueOf(c));
	}

	public function println6(v : Long) : Void
	{
		println(haxen.Runtime.getStringValueOf(v));
	}

	public function println7(v : Float) : Void
	{
		println(haxen.Runtime.getStringValueOf(v));
	}

	public function println8(v : Float) : Void
	{
		println(haxen.Runtime.getStringValueOf(v));
	}

	public function println9(s : Array<Char>) : Void
	{
		println(haxen.Runtime.getStringValueOf(s));
	}*/

	/// <exception cref="jaxe.io.IOException"></exception>
	public override function write2(c : JInt) : Void
	{
		out.write2(c);
		if (autoFlush && (c ==  JChar.fromString('\n')))
		{
			flush();
		}
	}

	/// <exception cref="jaxe.io.IOException"></exception>
	public override function write1(buffer : Array<JByte>, offset : JInt, length : JInt)
		 : Void
	{
		out.write1(buffer, offset, length);
		if (autoFlush)
		{
			flush();
		}
	}

	public override function flush() : Void
	{
		try
		{
			out.flush();
		}
		catch (e : IOException)
		{
		}
	}

	public override function close() : Void
	{
		try
		{
			out.close();
		}
		catch (e : IOException)
		{
		}
	}
}

/*class Static
{
	public function new()
	{
	}

	private static var newline : Array<Byte> = haxen.Runtime.getBytesForString(Runtime.getProperty("line.separator"));
}*/
