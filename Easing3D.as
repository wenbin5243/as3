package{
	import flash.display.Sprite;
	import flash.events.Event;

	public class Easing3D extends Sprite{
		private var ball:Ball3D;
		private var tx:Number;
		private var ty:Number;
		private var tz:Number;
		private var easing:Number=0.1;
		private var fl:Number=250;
		private var vpX:Number=stage.stageWidth/2;
		private var vpY:Number=stage.stageHeight/2;
		
		public function Easing3D(){
			init();
		}
		
		private function init():void{
			ball=new Ball3D();
			addChild(ball);

			tx=Math.random()*500-250;
			ty=Math.random()*500-250;
			tz=Math.random()*500;

			addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}

		
		public function onEnterFrame(event:Event):void{
			var dx:Number=tx-ball.xpos;
			var dy:Number=ty-ball.ypos;
			var dz:Number=tz-ball.zpos;
			ball.xpos+=dx*easing;
			ball.ypos+=dy*easing;
			ball.zpos+=dz*easing;

			var dist:Number=Math.sqrt(dx*dx+dy*dy+dz*dz);

			if(dist<1){
				tx=Math.random()*500-250;
				ty=Math.random()*500-250;
				tz=Math.random()*500;
			}

			if(ball.zpos>-fl){
				var scale:Number=fl/(fl+ball.zpos);
				ball.scaleX=ball.scaleY=scale;
				ball.x=vpX+ball.xpos*scale;
				ball.y=vpY+ball.ypos*scale;
				ball.visible=true;
			}else{
				ball.visible=false;
			}
		}
	}
}