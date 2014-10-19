﻿package {
	import flash.display.Sprite;

	public class Random3 extends Sprite
	{
		private var numDots:uint=300;
		private var maxRadius:Number=50;

		public function Random3()
		{
			init();
		}
		
		private function init():void
		{
			for(var i:uint=0;i<numDots;i++){
				var dot:Ball=new Ball(1,0);
				var radius:Number=Math.random()*maxRadius;
				var angle:Number=Math.random()*(Math.PI*2);
				dot.x=stage.stageWidth/2+Math.cos(angle)*radius;
				dot.y=stage.stageHeight/2+Math.sin(angle)*radius;
				addChild(dot);
			}
						
		}
		

	}
}