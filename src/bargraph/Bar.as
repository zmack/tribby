package bargraph {
  import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.MouseEvent;

	public class Bar extends Sprite {
		public var total:uint;
    public var value:uint;
    public var barWidth:Number;
    public var pixelHeight:Number;
    public var max:Number;
    public var color:uint;
    public var hoverColor:uint;
    public var normalColor:uint;
    
    private var ghostBar:Sprite;
    private var totalBar:Sprite;
    private var valueBar:Sprite;
    private var markerBar:Sprite;

		public function Bar(options:Object) {
      options ||= {};

      this.total = options.total;
      this.value = options.value;
      this.barWidth = options.width;
      this.normalColor = options.normal || 0xFF00FF;
      this.hoverColor = options.hover || 0x00FF00;
      this.pixelHeight = options.pixelHeight || 1;
      this.max = options.max || 0;

      this.createBars();
      this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
      this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		} 

    public function createBars():void {
      this.color = this.normalColor;

      this.totalBar = new Sprite();
      this.drawBar(this.totalBar, this.barWidth, this.total * this.pixelHeight);
      this.totalBar.alpha = 0.4;

      this.valueBar = new Sprite();
      this.drawBar(this.valueBar, this.barWidth, this.value * this.pixelHeight);

      this.ghostBar = new Sprite();
      this.drawBar(this.ghostBar, this.barWidth, this.max);
      this.ghostBar.alpha = 0;

      this.markerBar = new Sprite();
      this.drawBar(this.markerBar, this.barWidth, 1);
      this.markerBar.y = 2;

      addChild(this.ghostBar);
      addChild(this.totalBar);
      addChild(this.valueBar);
      addChild(this.markerBar);
    }

    public function redraw():void {
      this.drawBar(this.totalBar, this.barWidth, this.total * this.pixelHeight);
      this.drawBar(this.valueBar, this.barWidth, this.value * this.pixelHeight);
      this.drawBar(this.ghostBar, this.barWidth, this.max);
    }

    public function drawBar(s:Sprite, width:uint, height:uint):Sprite {
      s.graphics.clear();
      s.graphics.beginFill(this.color);
      s.graphics.drawRect(0, 0, width, -height);
      s.graphics.endFill();

      return s;
    }

    private function onMouseOver(e:MouseEvent):void {
      this.color = this.hoverColor;
      this.redraw();
    }

    private function onMouseOut(e:MouseEvent):void {
      this.color = this.normalColor;
      this.redraw();
    }

	}
}
