package{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;

	public class MatrixRotate extends Sprite{
		private var angle:Number=0;
		private var box:Sprite;
		
		public function MatrixRotate(){
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
			angle+=.05;
			var cos:Number=Math.cos(angle);
			var sin:Number=Math.sin(angle);
			box.transform.matrix=new Matrix(cos,sin,-sin,cos,stage.stageWidth/2,stage.stageHeight/2);
		}

		
	}
}