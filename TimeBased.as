﻿package{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;

	public class TimeBased extends Sprite{
		private var ball:Ball;
		private var vx:Number;
		private var vy:Number;
		private var bounce:Number=-0.7;
		private var time:Number;
		
		public function TimeBased(){
			init();
		}
		
		private function init():void{
			stage.frameRate=10;
			ball=new Ball();
			ball.x=stage.stageWidth/2;
			ball.y=stage.stageHeight/2;
			vx=Math.random()*10-5;
			vy=Math.random()*10-5;
			addChild(ball);
			time=getTimer();
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}

		
		public function onEnterFrame(event:Event):void{
			var elapsed:Number=getTimer()-time;
			time=getTimer();
			ball.x+=vx*elapsed/1000;
			ball.y+=vy*elapsed/1000;

			var left:Number=0;
			var right:Number=stage.stageWidth;
			var top:Number=0;
			var bottom:Number=stage.stageHeight;
			if(ball.x+ball.radius>right){
				ball.x=right-ball.radius;
				vx*=bounce;
			}else if(ball.x-ball.radius<left){
				ball.x=left+ball.radius;
				vx*=bounce;
			}
			if(ball.y+ball.radius>bottom){
				
				ball.y=bottom-ball.radius;
				vy*=bounce;
			}else if(ball.y-ball.radius<top){
				ball.y=top+ball.radius;
				vy*=bounce;
			}
		}
	}
}