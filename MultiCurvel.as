package{
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class MultiCurvel extends Sprite{
		private var numPoints:uint=9;
		
		public function MultiCurvel(){
			init();
		}
		
		private function init():void{
			var points:Array=new Array();
			for(var i:int=0;i<numPoints;i++){
				points[i]=new Object();
				points[i].x=Math.random()*stage.stageHeight;
				points[i].y=Math.random()*stage.stageHeight;
			}

			graphics.lineStyle(1);

			graphics.moveTo(points[0].x,points[0].y);

			for(i=1;i<numPoints;i+=2){
				gra
			}
		}
	}
}