package src 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author mike
	 */
	public class Turret extends MovieClip
	{
		private var _turret:artTurret = new artTurret;
		
		public function Turret() 
		{
			addChild(_turret);
			trace("spawnTurret");
			_turret.x = 640;
			_turret.y = 650;
		}
		public function followMouse() {
			var angleRadian = Math.atan2(mouseY - _turret.y, mouseX - _turret.x);
			var angleDegree = angleRadian * (180 / Math.PI);
			_turret.rotation = angleDegree;
		}
		
	}

}