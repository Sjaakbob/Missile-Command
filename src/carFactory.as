package src 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author mike
	 */
	public class carFactory extends MovieClip
	{
		public function makeCar(type: int): Vehicle
		{
			var car: Vehicle;
			if (type < 10)
			{
				car = new Car();
			}
			if (type > 10)
			{
				//car = new 
			}
			
		return car;	
		}
		
	}

}