package  {
  import flash.display.Sprite;
	
	public class LineGraph extends Sprite {
    private var _data:Array;
    private var _pointHeight:Number;
    private var _pointWidth:Number;
    private var _width:Number;
    private var _height:Number;
		
		public function LineGraph(data:Array, width:Number, height:Number) {
      _data = data;
      _width = width;
      _height = height * 0.9;

      render();
		}

    private function getPointHeight():Number {
      return _pointHeight ||= (0.9*_height) / getMaxCommits();
    }

    private function getPointWidth():Number {
      return _pointWidth ||= ( _width - 20 ) / 52;
    }

    private function getMaxCommits():uint {
      var max:uint = 0;
      for( var i:uint = 0; i < _data.length; i++ ) {
        if ( _data[i].total > max ) max = _data[i].total
      }
      return max;
    }

    private function render():void {
      var x_offset:Number = 10;
      this.graphics.clear();
      this.drawTotalParticipation();
      this.drawOwnParticipation();
    }

    private function drawOwnParticipation():void {
      var pointH:Number = getPointHeight();
      var pointW:Number = getPointWidth();

      this.graphics.beginFill(0x0000FF);
      this.graphics.lineStyle(1, 0x0000FF);
      for( var i:uint = 0; i < _data.length - 1; i++ ) {
        if ( pointW > 5 ) 
          this.graphics.drawCircle(i*pointW, _height - _data[i].own * pointH, 2);
        this.graphics.moveTo(i*pointW, _height - _data[i].own * pointH);
        this.graphics.lineTo((i+1)*pointW, _height - _data[i+1].own * pointH);
      }
      if ( pointW > 5 ) 
        this.graphics.drawCircle((_data.length - 1)*pointW, _height - _data[_data.length - 1].own * pointH, 2);
      this.graphics.endFill();
    }

    private function drawTotalParticipation():void {
      var pointH:Number = getPointHeight();
      var pointW:Number = getPointWidth();

      this.graphics.lineStyle(1, 0x00FFFF);
      this.graphics.moveTo(0, _height);
      this.graphics.beginFill(0x00FFFF);
      for( var i:uint = 0; i < _data.length - 1; i++ ) {
        this.graphics.lineTo((i+1)*pointW, _height - _data[i+1].total * pointH);
      }
      this.graphics.lineTo(( _data.length-1 ) * pointW, _height);
      this.graphics.lineTo(0, _height)
      this.graphics.endFill();
    }
	}
}
