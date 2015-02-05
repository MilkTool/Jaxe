package jaxe.lang;

/**
 * ...
 * @author G.Legris
 */
/*abstract*/ class Number extends JObject
{
	public function new()
	{
		super();
	}

	//private inline var serialVersionUID : JLong = -8742448824652078965L;

	/// <summary>Returns this object's value as a byte.</summary>
	/// <remarks>
	/// Returns this object's value as a byte. Might involve rounding and/or
	/// truncating the value, so it fits into a byte.
	/// </remarks>
	/// <returns>the primitive byte value of this object.</returns>
	public function byteValue() : JByte
	{
		//return (Byte)intValue();
		// TODO
		return cast(intValue(), JByte);
	}

	/// <summary>Returns this object's value as a double.</summary>
	/// <remarks>Returns this object's value as a double. Might involve rounding.</remarks>
	/// <returns>the primitive double value of this object.</returns>
	public /*abstract*/ function doubleValue() : JDouble{ throw "abstract"; }

	/// <summary>Returns this object's value as a float.</summary>
	/// <remarks>Returns this object's value as a float. Might involve rounding.</remarks>
	/// <returns>the primitive float value of this object.</returns>
	public /*abstract*/ function floatValue() : JFloat{ throw "abstract"; }

	/// <summary>Returns this object's value as an int.</summary>
	/// <remarks>
	/// Returns this object's value as an int. Might involve rounding and/or
	/// truncating the value, so it fits into an int.
	/// </remarks>
	/// <returns>the primitive int value of this object.</returns>
	public /*abstract*/ function intValue() : JInt{ throw "abstract"; }

	/// <summary>Returns this object's value as a long.</summary>
	/// <remarks>
	/// Returns this object's value as a long. Might involve rounding and/or
	/// truncating the value, so it fits into a long.
	/// </remarks>
	/// <returns>the primitive long value of this object.</returns>
	public /*abstract*/ function longValue() : JLong{ throw "abstract"; }

	/// <summary>Returns this object's value as a short.</summary>
	/// <remarks>
	/// Returns this object's value as a short. Might involve rounding and/or
	/// truncating the value, so it fits into a short.
	/// </remarks>
	/// <returns>the primitive short value of this object.</returns>
	public function shortValue() : JShort
	{
		//return (Short)intValue();
		// TODO
		return cast(intValue(), JShort);
	}
}
