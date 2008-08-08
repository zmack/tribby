package  {
  import flash.display.Sprite;
  import bargraph.*;
	
	public class BarGraph extends Sprite {
    private var _data:Array;
    private var _pointHeight:Number;
    private var _pointWidth:Number;
    private var _width:Number;
    private var _height:Number;

    private var _itemWidth:Number;
		
		public function BarGraph(data:Array, width:Number, height:Number) {
      this._data = data;
      this._width = width;
      this._height = height;

      this.render();
		}

    public function render():void {
      this._data.forEach( function(item:Object, index:uint, arr:Array):void {
        var bar:Bar = new Bar({ total: item.total, value: item.own, width: this.itemWidth, color: 0xFF00FF });
        bar.x = index * this.itemWidth;
        bar.y = this._height * .9;
        this.addChild(bar);
      }, this);
    }

    private function get itemWidth():Number {
      return this._itemWidth ||= Math.floor(this._width / 52);
    }
	}
}
