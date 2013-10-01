package src 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author mike
	 */
	public class House extends MovieClip
	{
		public var _house1:artHouse1 = new artHouse1
		public var _house2:artHouse2 = new artHouse2
		public var _house3:artHouse3 = new artHouse3
		
		public function House() 
		{
			addChild(_house1);
			_house1.y = 500;
			_house1.x = 300;
		}
		public function transformHouse1 ()
		{
			if (contains(_house1))
				{
					removeChild(_house1);
				}
			addChild(_house2);
			_house2.y = 500;
			_house2.x = 300;
		}
		
		public function transformHouse2 ()
		{
			if (contains(_house2))
			{
				removeChild(_house2);
			}
			addChild(_house3);
			_house3.y = 500;
			_house3.x = 300;
		}
		
	}

}