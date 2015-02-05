package jaxe.io;

/// <summary>
/// A character encoding is not supported - &lt;a
/// href="http://java.sun.com/javase/6/docs/api/java/io/UnsupportedEncodingException.html"&gt;[Sun's
/// docs]</a>.
/// </summary>
/// <remarks>
/// A character encoding is not supported - &lt;a
/// href="http://java.sun.com/javase/6/docs/api/java/io/UnsupportedEncodingException.html"&gt;[Sun's
/// docs]</a>.
/// </remarks>
@:System.Serializable
class UnsupportedEncodingException extends IOException
{
	public function new()
	{
	}

	public function __ctor0()
	{
		return this;
	}

	public function __ctor1(msg : String)
	{
		super.__ctor0(msg);
		return this;
	}
}
