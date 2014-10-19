package{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLRequest;

	public class SoundEvents extends Sprite{
		private var ball:Ball;
		private var vx:Number;
		private var vy:Number;
		private var bounce:Number=-0.7;
		private var boing:Sound;
		
		public function SoundEvents(){
			init();
		}
		
		private function init():void{
			boing=new Sound(new URLRequest("Boing.mp3"));
			ball=new Ball();
			ball.x=stage.stageWidth/2;
			ball.y=stage.stageHeight/2;
			vx=Math.random()*10-5;
			vy=Math.random()*10-5;
			addChild(ball);
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}

		
		public function onEnterFrame(event:Event):void{
			ball.x+=vx;
			ball.y+=vy;

			var left:Number=0;
			var right:Number=stage.stageWidth;
			var top:Number=0;
			var bottom:Number=stage.stageHeight;
			if(ball.x+ball.radius>right){
				boing.play();
				ball.x=right-ball.radius;
				vx*=bounce;
			}else if(ball.x-ball.radius<left){
				boing.play();
				ball.x=left+ball.radius;
				vx*=bounce;
			}
			if(ball.y+ball.radius>bottom){
				boing.play();
				ball.y=bottom-ball.radius;
				vy*=bounce;
			}else if(ball.y-ball.radius<top){
				boing.play();
				ball.y=top+ball.radius;
				vy*=bounce;
			}
		}
	}
}