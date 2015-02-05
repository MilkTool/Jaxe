package jaxe.lang;

/**
 * ...
 * @author G.Legris
 */
class HashCodeGenerator
{
	private static var hashCode: Int = 1;

	private function new() 
	{
		
	}
	
	public static function getNextHashCode() : Int {
		return hashCode++;
	}
	
}