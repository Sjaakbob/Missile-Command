package src 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author mike
	 */
	public class Car extends Vehicle
	{
		public var _car:artCar = new artCar();
		
		public function Car() 
		{
			addChild(_car);
		}
		
	}

}