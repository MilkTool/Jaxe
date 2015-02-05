package jaxe.io;

import jaxe.lang.*;

//import jaxe.util.Arrays;

/// <summary>A writable sink for bytes.</summary>
/// <remarks>
/// A writable sink for bytes.
/// <p>Most clients will use output streams that write data to the file system
/// (
/// <see cref="FileOutputStream">FileOutputStream</see>
/// ), the network (
/// <see cref="jaxe.net.Socket.getOutputStream()">jaxe.net.Socket.getOutputStream()</see>
/// /
/// <see cref="jaxe.net.URLConnection.getOutputStream()">jaxe.net.URLConnection.getOutputStream()
/// 	</see>
/// ), or to an in-memory byte array
/// (
/// <see cref="ByteArrayOutputStream">ByteArrayOutputStream</see>
/// ).
/// <p>Use
/// <see cref="OutputStreamWriter">OutputStreamWriter</see>
/// to adapt a byte stream like this one into a
/// character stream.
/// <p>Most clients should wrap their output stream with
/// <see cref="BufferedOutputStream">BufferedOutputStream</see>
/// . Callers that do only bulk writes may omit buffering.
/// <h3>Subclassing OutputStream</h3>
/// Subclasses that decorate another output stream should consider subclassing
/// <see cref="FilterOutputStream">FilterOutputStream</see>
/// , which delegates all calls to the target output
/// stream.
/// <p>All output stream subclasses should override <strong>both</strong>
/// <see cref="write(Int)">write(Int)</see>
/// and
/// <see cref="write(Byte[], Int, Int)">write(byte[],int,int)</see>
/// . The
/// three argument overload is necessary for bulk access to the data. This is
/// much more efficient than byte-by-byte access.
/// </remarks>
/// <seealso cref="InputStream">InputStream</seealso>
/*abstract*/ class OutputStream
{
	public function new()
	{
	}

	/// <summary>Default constructor.</summary>
	/// <remarks>Default constructor.</remarks>
	public function __ctor0()
	{
		return this;
	}

	//implements Closeable, Flushable {
	/// <summary>Closes this stream.</summary>
	/// <remarks>
	/// Closes this stream. Implementations of this method should free any
	/// resources used by the stream. This implementation does nothing.
	/// </remarks>
	/// <exception cref="IOException">if an error occurs while closing this stream.</exception>
	/// <exception cref="jaxe.io.IOException"></exception>
	public function close() : Void
	{
	}

	/// <summary>Flushes this stream.</summary>
	/// <remarks>
	/// Flushes this stream. Implementations of this method should ensure that
	/// any buffered data is written out. This implementation does nothing.
	/// </remarks>
	/// <exception cref="IOException">if an error occurs while flushing this stream.</exception>
	/// <exception cref="jaxe.io.IOException"></exception>
	public function flush() : Void
	{
	}

	/// <summary>
	/// Equivalent to
	/// <code>write(buffer, 0, buffer.length)</code>
	/// .
	/// </summary>
	/// <exception cref="jaxe.io.IOException"></exception>
	public function write(buffer : Array<JByte>) : Void
	{
		write1(buffer, 0, buffer.length);
	}

	/// <summary>
	/// Writes
	/// <code>count</code>
	/// bytes from the byte array
	/// <code>buffer</code>
	/// starting at
	/// position
	/// <code>offset</code>
	/// to this stream.
	/// </summary>
	/// <param name="buffer">the buffer to be written.</param>
	/// <param name="offset">
	/// the start position in
	/// <code>buffer</code>
	/// from where to get bytes.
	/// </param>
	/// <param name="count">
	/// the number of bytes from
	/// <code>buffer</code>
	/// to write to this
	/// stream.
	/// </param>
	/// <exception cref="IOException">if an error occurs while writing to this stream.</exception>
	/// <exception cref="jaxe.lang.IndexOutOfBoundsException">
	/// if
	/// <code>offset &lt; 0</code>
	/// or
	/// <code>count &lt; 0</code>
	/// , or if
	/// <code>offset + count</code>
	/// is bigger than the length of
	/// <code>buffer</code>
	/// .
	/// </exception>
	/// <exception cref="jaxe.io.IOException"></exception>
	public function write1(buffer : Array<JByte>, offset : Int, count : Int) : Void
	{
		//Arrays.checkOffsetAndCount(buffer.length, offset, count);
		{
			var i : Int = offset;
			if (i < offset + count)
			do
			{
				write2(buffer[i]);
			}
			while ( { i++; i < offset + count; } );
		}
	}

	/// <summary>Writes a single byte to this stream.</summary>
	/// <remarks>
	/// Writes a single byte to this stream. Only the least significant byte of
	/// the integer
	/// <code>oneByte</code>
	/// is written to the stream.
	/// </remarks>
	/// <param name="oneByte">the byte to be written.</param>
	/// <exception cref="IOException">if an error occurs while writing to this stream.</exception>
	/// <exception cref="jaxe.io.IOException"></exception>
	public /*abstract*/ function write2(oneByte : Int) : Void{ throw "abstract"; }

	/// <summary>Returns true if this writer has encountered and suppressed an error.</summary>
	/// <remarks>
	/// Returns true if this writer has encountered and suppressed an error. Used
	/// by PrintStreams as an alternative to checked exceptions.
	/// </remarks>
	public function checkError() : Bool
	{
		return false;
	}
}
