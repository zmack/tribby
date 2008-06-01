package  {
  import flash.display.Sprite;
	
	public class LineGraph extends Sprite {
    private var _data:Array;
		
		public function LineGraph(data:Array) {
      _data = data;
      render();
		}

    private function render():void {
      var x_offset:Number = 10;
      this.graphics.clear();
      this.drawTotalParticipation();
      this.drawOwnParticipation();
    }

    private function drawOwnParticipation():void {
      this.graphics.beginFill(0x0000FF);
      this.graphics.lineStyle(1, 0x0000FF);
      for( var i:uint = 0; i < _data.length - 1; i++ ) {
        this.graphics.drawCircle(i*10, 300 - _data[i].own, 2);
        this.graphics.moveTo(i*10, 300 - _data[i].own);
        this.graphics.lineTo((i+1)*10, 300 - _data[i+1].own);
      }
      this.graphics.drawCircle((_data.length - 1)*10, 300 - _data[_data.length - 1].own, 2);
      this.graphics.endFill();
    }

    private function drawTotalParticipation():void {
      this.graphics.lineStyle(1, 0x00FFFF);
      this.graphics.moveTo(0, 300);
      this.graphics.beginFill(0x00FFFF);
      for( var i:uint = 0; i < _data.length - 1; i++ ) {
        //this.graphics.drawCircle(i*10, 300 - _data[i].total, 2);
        this.graphics.lineTo((i+1)*10, 300 - _data[i+1].total);
      }
      //this.graphics.drawCircle((_data.length - 1)*10, 300 - _data[_data.length - 1].total, 2);
      this.graphics.lineTo(( _data.length-1 )* 10, 300);
      this.graphics.lineTo(0, 300)
      this.graphics.endFill();
    }
	}
}
