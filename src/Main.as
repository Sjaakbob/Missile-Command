package src 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.Timer
	/**
	 * ...
	 * @author mike
	 */
	public class Main extends MovieClip
	{
		public var _bullet:Array;
		public var _enemy:Array;
		
		private var enemyFall:Boolean = false;
		private var _bul:Bullet;
		private var windSpeed:int;
		
		private var _turret:Turret = new Turret();
	    private var myTimer:Timer = new Timer(Math.random() * 2500 + 1500, 1);
		private var windTimer:Timer = new Timer(Math.random() * 3000 + 2000, 1);
		
		
		public function Main() 
		{
			_enemy = [];
			_bullet = [];
			addChild(_turret);	
		
			stage.addEventListener(Event.ENTER_FRAME, gameLoop);
			stage.addEventListener(MouseEvent.CLICK, shootBullet);
			myTimer.addEventListener(TimerEvent.TIMER, spawnTimer);
			windTimer.addEventListener(TimerEvent.TIMER, wind);
		}
		private function gameLoop(e:Event)
		{
			myTimer.start();
			windTimer.start();
			
			
			
			_turret.followMouse();	
			
			var K = _enemy.length ;
			for (var j:int = 0; j < K; j++) 
			{
				_enemy[j].y += 2;
				_enemy[j].x += windSpeed;
			}
			
			
			var l = _bullet.length;
			for (var i:int = 0; i < l; i++) {
				_bullet[i].movement(35);
				
				if(_bullet[i].y < _bul.mosY &&(contains(_bullet[i])) ) {
				
				removeChild(_bullet[i]);
				_bullet.splice(i, 0); }
				}
				
			//hit detection
			
			if (_bullet[i].hitTestObject(_enemy[j])) 
			{ _bullet.splice(i, 0); _enemy.splice(i, 0);  }
					
		}
		private function spawnTimer(event:TimerEvent):void {
			_enemy.push(new Enemy);
			addChild(_enemy[_enemy.length - 1]);
		}
		private function wind(event:TimerEvent):void {
			windSpeed = Math.floor(Math.random() * 5 -3) ;
		}
		
		
		public function shootBullet(e:MouseEvent):void {
			//bclass.goBullet(); 
			_bul = new Bullet();
			 
			_bullet.push( _bul);
			
			addChild(_bullet[_bullet.length - 1]);
			_bullet[_bullet.length - 1].x = 640;
			_bullet[_bullet.length - 1].y = 650;
			_bullet[_bullet.length - 1].bulletFollowTarget(new Point((mouseX), (mouseY)));
			_bul.mosY = mouseY;
			enemyFall = true;
		}
	}

	
}