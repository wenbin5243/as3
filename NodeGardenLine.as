﻿package{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;

	public class NodeGardenLine extends Sprite{
		private var particles:Array;
		private var numParticles:uint=30;
		private var minDist:Number=100;
		private var springAmount:Number=.001;
		
		public function NodeGardenLine(){
			init();
		}
		
		private function init():void{
			particles=new Array();
			for(var i:uint=0;i<numParticles;i++){
				var particle:Ball=new Ball(5,0x000000);
				particle.x=Math.random()*stage.stageWidth;
				particle.y=Math.random()*stage.stageHeight;
				particle.vx=Math.random()*6-3;
				particle.vy=Math.random()*6-3;
				addChild(particle);
				particles.push(particle);
			}
			

			addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void{
			graphics.clear();
			for(var i:uint=0;i<numParticles;i++){
				var particle:Ball=particles[i];
				particle.x+=particle.vx;
				particle.y+=particle.vy;
				if(particle.x>stage.stageWidth){
					particle.x=0;
				}else if(particle.x<0){
					particle.x=stage.stageWidth;
				}
				if(particle.y>stage.stageHeight){
					particle.y=0;
				}else if(particle.y<0){
					particle.y=stage.stageHeight;
				}
			}
			for(i=0;i<numParticles-1;i++){
				var partA:Ball=particles[i];
				for(var j:uint=i+1;j<numParticles;j++){
					var partB:Ball=particles[j];
					spring(partA,partB);
				}
			}
		}

		private function spring(partA:Ball,partB:Ball):void{
			var dx:Number=partB.x-partA.x;
			var dy:Number=partB.y-partA.y;
			var dist:Number=Math.sqrt(dx*dx+dy*dy);
			if(dist<minDist){
				graphics.lineStyle(1,0x000000,1-dist/minDist);
				graphics.moveTo(partA.x,partA.y);
				graphics.lineTo(partB.x,partB.y);
				var ax:Number=dx*springAmount;
				var ay:Number=dy*springAmount;
				partA.vx+=ax;
				partA.vy+=ay;
				partB.vx-=ax;
				partB.vy-=ay;
			}
		}
	}
}