package jaxe.lang;

/**
 * ...
 * @author G.Legris
 */
class NumberFormatException
{

	public function new() 
	{
		
	}
	
	
	public static function create(msg: String): NumberFormatException 
	{
		return new NumberFormatException();
	}
	
}