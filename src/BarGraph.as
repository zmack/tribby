package  {
  import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.MouseEvent;
  import bargraph.*;
	
	public class BarGraph extends Sprite {
    private var _data:Array;
    private var _pointHeight:Number;
    private var _pointWidth:Number;
    private var _width:Number;
    private var _height:Number;
    private var _weeks:uint = 52;

    private var _itemWidth:Number;
    private var _itemHeight:Number;
    private var _horizontalPadding:Number;
    private var _tooltip:Tooltip;
		
		public function BarGraph(data:Array, width:Number, height:Number) {
      this._tooltip = new Tooltip();
      addChild(this._tooltip);
    
      this._data = data;
      this._width = width;
      this._height = height;

      this.render();
		}

    public function render():void {
      this._data.forEach( function(item:Object, index:uint, arr:Array):void {
        var bar:Bar = new Bar({ total: item.total, 
                                value: item.own, 
                                width: this.itemWidth, 
                                max: this.maxItemHeight, 
                                pixelHeight: this.itemCommitHeight, 
                                normal: 0xFF00FF,
                                hover: 0x00FF00 });

        bar.x = this.horizontalPadding + index * (this.itemWidth + 1);
        bar.y = this._height * .9;
        this.addChild(bar);
        bar.addEventListener(MouseEvent.MOUSE_OVER, onBarOver);
      }, this);
    }

    private function get itemWidth():Number {
      return this._itemWidth ||= Math.floor((this._width - (this._weeks - 1)) / this._weeks);
    }

    private function get itemCommitHeight():Number {
      return this._itemHeight ||= this._height / this.getMaxCommits() * .8;
    }

    private function get maxItemHeight():Number {
      return this.getMaxCommits() * this.itemCommitHeight;
    }

    private function get horizontalPadding():Number {
      return this._horizontalPadding ||= ( ( this._width - (this._weeks - 1)) - ( this._itemWidth * this._weeks ) ) / 2;
    }

    private function getMaxCommits():uint {
      var max:uint = 0;
      for( var i:uint = 0; i < this._data.length; i++ ) {
        if ( this._data[i].total > max ) {
          max = this._data[i].total;
        }
      }
      return max;
    }

    private function filterData():void {
      // should i filter initial weeks with 0 commits ? =/
    }

    private function onBarOver(e:MouseEvent):void {
      var bar:Object = e.target.parent;
      this._tooltip.text = bar.value + ' commit' + ((bar.value == 1)?'':'s') + ' of ' + bar.total;
    }
	}
}
