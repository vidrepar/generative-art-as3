package  {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.geom.ColorTransform;
	
	
	public class Main extends MovieClip {
		
		private var mySquare:Square;
		private var myCircle:Circle;
		
		private var colorFrom:uint = 0xCC0000;
		private var colorTo:uint = 0xFFFFFF;
		
		public function Main() {
			// constructor code
			
			createSquareGrid();
			createCircleGrid();
			
		}
		
		private function createSquareGrid(){
			
			
			var myArrayOfTiles:Array = [];
			var gridNumber:int = 5;
			
			var distanceX:Number = 0;
			var distanceY:Number = 0;
			for(var i:Number = 0; i < gridNumber; i++) {
				
				myArrayOfTiles[i] = new Array();
				for(var j:Number = 0; j < gridNumber; j++) {
				var mySquare:Square = new Square();
					addChild(mySquare);
					myArrayOfTiles[i][j] = mySquare;
					myArrayOfTiles[i][j].x = distanceX;
					myArrayOfTiles[i][j].y = distanceY;
										
					distanceX += mySquare.width + 10;
					
					//Random Alpha Values, Create Color Interppolation Later On
					//mySquare.alpha = Math.random()*1;
					
					//Scaling mySquare X And Y, Best Result When Manipulating Just One, Or None
					//mySquare.scaleX = Math.random()*1;
					//mySquare.scaleY = Math.random()*1;
					
					//Color Interpolation
					var myColorTransform = new ColorTransform();
					myColorTransform.color = interpolateColor(colorFrom,colorTo,Math.random());
					mySquare.transform.colorTransform = myColorTransform;
				}
				distanceX = 0;
				distanceY += mySquare.height + 10;
			}
			
			
			} //End Of createSquareGrid Function
			
			private function createCircleGrid(){
			
			
			var myArrayOfTiles:Array = [];
			var gridNumber:int = 5;
			
			var distanceX:Number = 0;
			var distanceY:Number = 0;
			for(var i:Number = 0; i < gridNumber; i++) {
				
				myArrayOfTiles[i] = new Array();
				for(var j:Number = 0; j < gridNumber; j++) {
				var myCircle:Circle = new Circle();
					addChild(myCircle);
					myArrayOfTiles[i][j] = myCircle;
					
					//Square Tiles With Circles
					myArrayOfTiles[i][j].x = distanceX;
					myArrayOfTiles[i][j].y = distanceY;
					
					//Squares And Circles With Different Z Values
					//myArrayOfTiles[i][j].x = distanceX+32;
					//myArrayOfTiles[i][j].y = distanceY+32;
					
					distanceX += myCircle.width + 10;
					
					//Random Alpha Values, Create Color Interppolation Later On
					//mySquare.alpha = Math.random()*1;
					
					//Scaling mySquare X And Y, Best Result When Manipulating Just One, Or None
					//mySquare.scaleX = Math.random()*1;
					//mySquare.scaleY = Math.random()*1;
					
					//Color Interpolation
					
					var myColorTransform = new ColorTransform();
					myColorTransform.color = interpolateColor(0xFFFF00,0xFFFFFF,Math.random());
					myCircle.transform.colorTransform = myColorTransform;
					
				}
				distanceX = 0;
				distanceY += myCircle.height + 10;
			}
			
			
			} //End Of createCircleGrid Function
			
			private function interpolateColor(fromColor:uint, toColor:uint, progress:Number):uint
		{
			var q:Number = 1-progress;
			var fromA:uint = (fromColor >> 24) & 0xFF;
			var fromR:uint = (fromColor >> 16) & 0xFF;
			var fromG:uint = (fromColor >>  8) & 0xFF;
			var fromB:uint =  fromColor        & 0xFF;

			var toA:uint = (toColor >> 24) & 0xFF;
			var toR:uint = (toColor >> 16) & 0xFF;
			var toG:uint = (toColor >>  8) & 0xFF;
			var toB:uint =  toColor        & 0xFF;
			
			var resultA:uint = fromA*q + toA*progress;
			var resultR:uint = fromR*q + toR*progress;
			var resultG:uint = fromG*q + toG*progress;
			var resultB:uint = fromB*q + toB*progress;
			var resultColor:uint = resultA << 24 | resultR << 16 | resultG << 8 | resultB;
			return resultColor;  
		} // End Of interpolateColor Function
		
	}
	
}
