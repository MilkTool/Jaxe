package jaxe.lang;

/**
 * ...
 * @author G.Legris
 */
class JMath
{
	public static var E : JDouble = 2.718281828459045;
	public static var PI : JDouble = 3.141592653589793;
	private static var PI_OVER_180 : JDouble = PI / 180.0;
	private static var PI_UNDER_180 : JDouble = 180.0 / PI;

	public static function abs(v: JDouble) : JDouble 
	{
		return Math.abs(v);
	}
	
	public static function ceil(v: JDouble) : JDouble 
	{
		return Math.ceil(v);
	}
	
	public static function cos(v: JDouble) : JDouble 
	{
		return Math.cos(v);
	}
	
	public static function floor(v: JDouble) : JDouble 
	{
		return Math.floor(v);
	}
	
	public static function max(v1: JDouble, v2: JDouble) : JDouble 
	{
		return Math.max(v1, v2);
	}
	
	public static function min(v1: JDouble, v2: JDouble) : JDouble 
	{
		return Math.min(v1, v2);
	}
	
	public static function sin(v: JDouble) : JDouble 
	{
		return Math.sin(v);
	}
	
	public static function sqrt(v: JDouble) : JDouble 
	{
		return Math.sqrt(v);
	}
	
	public static function tan(v: JDouble) : JDouble 
	{
		return Math.tan(v);
	}
	
	public static function toDegrees(x : JDouble) : JDouble
	{
		return x * PI_UNDER_180;
	}

	public static function toRadians(x : JDouble) : JDouble
	{
		return x * PI_OVER_180;
	}
	
	
}