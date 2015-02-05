package jaxe.lang;
import jaxe.io.ConsoleOutputStream;
import jaxe.io.PrintStream;

/**
 * ...
 * @author G.Legris
 */
class System
{
	
	private static var consoleOutputStream: ConsoleOutputStream = new ConsoleOutputStream();
	public static var out : PrintStream = new PrintStream().__create_PrintStream0(consoleOutputStream, true);

	private function new() 
	{
		
	}
	
	public static function currentTimeMillis(): JLong {
		
	#if (cpp || cs || java || macro || neko || php || python)
		return JLong.fromFloat(Sys.time() * 1000);
	#else 
		return JLong.fromFloat(Date.now().getTime());
	#end
	
	}
	
	
	

	
}