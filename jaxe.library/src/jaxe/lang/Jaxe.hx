package jaxe.lang;

/**
 * ...
 * @author G.Legris
 */
class Jaxe
{

	function new() 
	{
		
	}
	
	public static function instanceof(v: Dynamic, t: Dynamic): Bool  {
		return Std.is(v, t);
	}
	
}