package{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;

	public class SkewX extends Sprite{
		private var angle:Number=0;
		private var box:Sprite;
		
		public function SkewX(){
			init();
		}
		
		private function init():void{
			box=new Sprite();
			box.graphics.beginFill(0xff0000);
			box.graphics.drawRect(-50,-50,100,100);
			box.graphics.endFill();
			addChild(box);

			addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}

		
		public function onEnterFrame(event:Event):void{
			var skewX:Number=(mouseX-stage.stageWidth/2)*.01;
			box.transform.matrix=new Matrix(1,0,skewX,1,stage.stageWidth/2,stage.stageHeight/2);
		}

		
	}
}