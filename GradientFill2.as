package{
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;

	public class GradientFill2 extends Sprite{
		
		public function GradientFill2(){
			init();
		}
		
		private function init():void{
			graphics.lineStyle(1);
			var colors:Array=[0xffffff,0x0000ff,0xff0000];
			var alphas:Array=[1,1,1];
			var ratios:Array=[0,128,255];
			var matrix:Matrix=new Matrix();
			matrix.createGradientBox(100,100,Math.PI/4,100,100);
			graphics.beginGradientFill(GradientType.RADIAL,colors,alphas,ratios,matrix);
			graphics.drawRect(100,100,100,100);
			graphics.endFill();
		}
	}
}