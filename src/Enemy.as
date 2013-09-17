package src 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author mike
	 */
	public class Enemy extends MovieClip
	{
		private var _enemy:artEnemy = new artEnemy;
		private var _enemy2:artEnemy2 = new artEnemy2;
		private var _enemy3:artEnemy3 = new artEnemy3;
		
		public function Enemy() 
		{ 
			_enemy.x = Math.random() * 1100 + 100;
			_enemy.y = 0
			addChild(_enemy);
		}
		
	}

}