package src 
{
	import adobe.utils.CustomActions;
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
		//public var _house:Array;
		
		private var enemyFall:Boolean = false;
		private var _bul:Bullet;
		private var windSpeed:int;
		//private var car:Car;
		private var _carDirection:int = 1;
		//private var _enemyDir:int = 1;
		private var _life:int;
		
		//private  var carSpawn:Timer = new Timer(Math.random() * 1000 + 500, 1);
		//private var _car:Car = new Car();
		private var vehicle:Vehicle;
		private var _house:House = new House();
		private var _turret:Turret = new Turret();
	    private var myTimer:Timer = new Timer(Math.random() * 2500 + 1500, 1);
		private var windTimer:Timer = new Timer(Math.random() * 3000 + 2000, 1);
		private var vehicleTimer:Timer = new Timer(10000);
		
		public function Main() 
		{
			level1();
		}
		
		private function level1()
		{
			_enemy = [];
			_bullet = [];
		
			addChild(_turret);
			//addChild(_car);
			addChild(_house);
			
			_life = 7;
		
			stage.addEventListener(Event.ENTER_FRAME, gameLoop);
			stage.addEventListener(MouseEvent.CLICK, shootBullet);
			myTimer.addEventListener(TimerEvent.TIMER, spawnTimer);
			windTimer.addEventListener(TimerEvent.TIMER, wind);
			vehicleTimer.addEventListener(TimerEvent.TIMER, spawnVehicle);
			
		}
		
		private function spawnVehicle(event:TimerEvent):void 
		{
			var carfactory : carFactory = new carFactory();
			var randomNumber: int = Math.random() * 10;
			vehicle = carfactory.makeCar(randomNumber);
			vehicle.y =	400;
			addChild(vehicle);
		}
		private function gameLoop(e:Event)
		{
			// life 
			if (_life == 5) 
			{ 
				_house.transformHouse1(); 
			}
			if (_life == 3)
			{
				_house.transformHouse2(); 
			}
			if (_life == 0) 
			{
				removeAll();
				level1();
			}
			if(vehicle)vehicle.move();
			// Timers start
			myTimer.start();
			windTimer.start();
			_turret.followMouse();
			vehicleTimer.start();
			
			// car
			//_car.x += 10 * _carDirection;
			
			//if (vehicle.x >= 1400 || vehicle.x <= -100 ) {
			//	_carDirection = _carDirection * -1; 
			//}
			
			var K = _enemy.length ;
			for (var j:int = K-1; j >= 0; j--) 
			{
				_enemy[j].y += 2;
				_enemy[j].x += windSpeed
				if (_enemy[j].y > 750 && (contains(_enemy[j])) )
				{
					_life -= 1; 
					removeChild(_enemy[j]);
					_enemy.splice(j, 0);
				}
				/*if (_enemy[j].x >= 1300 || _enemy[j].x <= 0 )
				{
					if (contains(_enemy[j]))
						{
							removeChild(_enemy[j]);
							_enemy.splice(j, 0);
						}
				}		
				*/
				
				
				var l = _bullet.length;
				for (var i:int = l-1; i >= 0; i--) {
					_bullet[i].movement(15);
					//hit detection
					if (_bullet[i].hitTestObject(_enemy[j])) 
					{
						if(contains(_bullet[i])){removeChild(_bullet[i]);}
						if(contains(_enemy[j])){removeChild(_enemy[j]);}
						_bullet.splice(i, 0);
						_enemy.splice(i, 0); 
					}
					
					else if (_bullet[i].y < _bul.mosY && (contains(_bullet[i])) ) 
					{
						removeChild(_bullet[i]);
						_bullet.splice(i, 0);		
					}	
				}
			}
						
		}
		private function spawnTimer(event:TimerEvent):void 
		{
			_enemy.push(new Enemy);
			addChild(_enemy[_enemy.length - 1]);
		}
		private function wind(event:TimerEvent):void 
		{
			windSpeed = Math.floor(Math.random() * 5 -3) ;
		}
		//	private function carTimer(event:TimerEvent):void {
		//		_car.push(new Car);
		//		addChild(_car[_car.length - 1]);
		//		trace("car");
		//	}
		private function removeAll()
		{
			removeChild(_house);
			//removeChild(_car);
			removeChild(_turret);
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