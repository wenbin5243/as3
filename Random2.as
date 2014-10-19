package {
	import flash.display.Sprite;

	public class Random2 extends Sprite
	{
		private var numDots:uint=300;

		public function Random2()
		{
			init();
		}
		
		private function init():void
		{
			for(var i:uint=0;i<numDots;i++){
				var dot:Ball=new Ball(1,0);
				dot.x=stage.stageWidth/2+Math.random()*100-50;
				dot.y=stage.stageHeight/2+Math.random()*100-50;
				addChild(dot);
			}
						
		}
		

	}
}
