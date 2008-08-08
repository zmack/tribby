package bargraph {
  import flash.display.Sprite;
	
	public class Bar extends Sprite {
		public var total:uint;
    public var value:uint;
    public var barWidth:Number;
    public var color:uint;
    public var pixelHeight:Number;
    public var max:Number;
    
    private var ghostBar:Sprite;
    private var totalBar:Sprite;
    private var valueBar:Sprite;

		public function Bar(options:Object) {
      options ||= {};

      this.total = options.total;
      this.value = options.value;
      this.barWidth = options.width;
      this.color = options.color || 0xFFFFFF;
      this.pixelHeight = options.pixelHeight || 1;
      this.max = options.max || 0;

      this.createBars();
		} 

    public function createBars():void {
      this.totalBar = this.createBar(this.barWidth, this.total * this.pixelHeight);
      this.totalBar.alpha = 0.4;
      this.valueBar = this.createBar(this.barWidth, this.value * this.pixelHeight);
      this.ghostBar = this.createBar(this.barWidth, this.max);
      this.ghostBar.alpha = 0;

      addChild(this.ghostBar);
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
