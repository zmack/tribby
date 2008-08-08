package bargraph {
  import flash.display.Sprite;
	
	public class Bar extends Sprite {
		public var total:uint;
    public var value:uint;
    public var barWidth:Number;
    public var color:uint;
    
    private var totalBar:Sprite;
    private var valueBar:Sprite;

		public function Bar(options:Object) {
      options ||= {};

      this.total = options.total;
      this.value = options.value;
      this.barWidth = options.width;
      this.color = options.color || 0xFFFFFF;

      this.createBars();
		} 

    public function createBars():void {
      this.totalBar = this.createBar(this.barWidth, this.total);
      this.valueBar = this.createBar(this.barWidth, this.value);

      addChild(this.totalBar);
      addChild(this.valueBar);
    }

    public function createBar(width:uint, height:uint):Sprite {
      //trace('creating ' + width + ', ' + height);
      var s:Sprite = new Sprite();
      s.graphics.beginFill(this.color);
      s.graphics.drawRect(0, 0, width, -height);
      s.graphics.endFill();

      return s;
    }
	}
}
