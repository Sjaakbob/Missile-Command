package src 
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author mike
	 */
	public class Bullet extends MovieClip
	{
		public var _bullet:artBullet = new artBullet;
		public var mosY:int;
		
		private var _bulletspeed = 10;
				
		public function Bullet() 
		{
			addChild(_bullet);	
		}
	
		public function bulletFollowTarget ($target:Point):void
			{
				   var xdiff:Number = ($target.x - this.x);
				   var ydiff:Number = ($target.y - this.y);
				   var radians:Number = Math.atan2(ydiff, xdiff);
				   var degrees:Number = radians * 180 / Math.PI; 
				   
				   this.rotation = degrees;
			}		
		
		public function movement(speed:Number):void
			{
			   var movementSpeed:Point = new Point();
			   movementSpeed.x = Math.cos(this.rotation / 180 * Math.PI) * speed;
			   movementSpeed.y = Math.sin(this.rotation / 180 * Math.PI) * speed;
			   
			   this.x += movementSpeed.x;
			   this.y += movementSpeed.y;
		    }
		
	}
		
}

