package{
	import flash.display.Sprite;
	import flash.events.Event;

	public class Boxes extends Sprite{
		private var box:Box;
		private var boxes:Array;
		private var gravity:Number=0.2;
		
		public function Boxes(){
			init();
		}
		
		private function init():void{
			boxes=new Array();
			creatBox();

			addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		
		public function onEnterFrame(event:Event):void{
			box.vy+=gravity;
			box.y+=box.vy;
			if(box.y+box.height/2>stage.stageHeight){
				box.y=stage.stageHeight-box.height/2;
				creatBox();
			}
			for(var i:uint=0;i<boxes.length;i++){
				if(box!=boxes[i]&&box.hitTestObject(boxes[i])){
					box.y=boxes[i].y-boxes[i].height/2-box.height/2;
					creatBox();
				}
			}
		}

		private function creatBox():void{
			box=new Box(Math.random()*40+10,Math.random()*40+10);
			box.x=Math.random()*stage.stageWidth;
			addChild(box);
			boxes.push(box);
		}
	}
}