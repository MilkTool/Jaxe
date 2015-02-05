package jaxe.lang;

//import jaxe.io.PrintStream;


class Throwable extends JObject
{
	public function new()
	{
		super();
	}

	private var message : String;

	//private var trace : Array<StackTraceElement>;

	private var cause : jaxe.lang.Throwable;

	public function __ctor_String_Throwable(message : String, cause : jaxe.lang.Throwable)
	{
		this.message = message;
		this.cause = cause;
		fillInStackTrace();
		return this;
	}

	public function __ctor_String(message : String)
	{
		this.__ctor_String_Throwable(message, null);
		return this;
	}

	public function __ctor_Throwable(cause : jaxe.lang.Throwable)
	{
		this.__ctor_String_Throwable(null, cause);
		return this;
	}

	public override function __ctor()
	{
		this.__ctor_String_Throwable(null, null);
		return this;
	}

	/// <summary>Constructor that allows subclasses disabling exception suppression and stack traces.
	/// 	</summary>
	/// <remarks>
	/// Constructor that allows subclasses disabling exception suppression and stack traces.
	/// Those features should only be disabled in very specific cases.
	/// </remarks>
	 function __ctor_String_Throwable_boolean_boolean(message : String, cause : jaxe.lang.Throwable, enableSuppression
		 : Bool, writetableStackTrace : Bool)
	{
		this.cause = cause;
		this.message = message;
		//this.disableSuppression = !enableSuppression;
		if (writetableStackTrace)
		{
			fillInStackTrace();
		}
		return this;
	}

	public function getCause() : jaxe.lang.Throwable
	{
		return cause;
	}

	public function initCause(e : jaxe.lang.Throwable) : jaxe.lang.Throwable
	{
		if (cause == null)
		{
			cause = e;
			return this;
		}
		else
		{
			//throw new IllegalStateException().__ctor0();
			return null;
		}
	}

	public function getMessage() : String
	{
		return message;
	}

	public function getLocalizedMessage() : String
	{
		return getMessage();
	}

	public override function toString() : String
	{
		/*var sb : StringBuilder = new StringBuilder().__ctor0();
		sb.append(haxen.Runtime.getClassForObject(this).getName());
		if (message != null)
		{
			sb.append(": ").append(message);
		}
		return sb.toString();*/
		
		return this.getClass().getName() + ": " + message;
	}

	/*public static function resolveTrace(id : Long) : Array<StackTraceElement>
	{
	}

	public function getStackTrace() : Array<StackTraceElement>
	{
		return trace;
	}*/

	/// <param name="trace"></param>
	/// <exception cref="NullPointerException">if stackTrace is null, or if any of the elements of stackTrace are null
	/// 	</exception>
	/*	
	public function setStackTrace(trace : Array<StackTraceElement>) : Void
	{
		// Test if some elements are null
	{
var i : Int = 0;
			if (i < @trace.length)
			do
			{
				@trace[i].hashCode();
			}
			while ( {i++;i < @trace.length} );
		}
		this.@trace = @trace;
	}
*/

/*	public function printStackTrace(out : PrintStream) : Void
	{
		var sb : StringBuilder = new StringBuilder().__ctor0();
		haxen.Runtime.printStackTrace(this, sb, Runtime.getProperty("line.separator"));
		out.print(sb.toString());
		out.flush();
	}
	*/

	//FIXME
	//  public void printStackTrace(PrintWriter out) {
	//    StringBuilder sb = new StringBuilder();
	//    printStackTrace(sb, System.getProperty("line.separator"));
	//    out.print(sb.toString());
	//    out.flush();
	//  }
	public function printStackTrace1() : Void
	{
		//haxen.Runtime.printStackTrace(this, Runtime.err);
	}

	/*
	private function printStackTrace2(sb : StringBuilder, nl : String) : Void
	{
		sb.append(toString()).append(nl);
		{
var i : Int = 0;
			if (i < trace.length)
			do
			{
				sb.append("  at ").append(@trace[i].toString()).append(nl);
			}
			while ( {++i; i < trace.length; } );
		}
		if (cause != null)
		{
			sb.append("caused by: ");
			haxen.Runtime.printStackTrace(cause, sb, nl);
		}
	}*/

	public function fillInStackTrace() : jaxe.lang.Throwable
	{
		// FIXME
		//trace = resolveTrace(Thread.currentThread().getId());
		return this;
	}
}
