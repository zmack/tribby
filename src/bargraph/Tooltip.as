package bargraph {

  import flash.display.Sprite;
  import flash.text.TextField;
  import flash.text.TextFormat;
  import flash.geom.Point;
  import flash.text.AntiAliasType;
  import flash.text.TextFormatAlign;
	
	public class Tooltip extends Sprite {
    private var _textField:TextField;
		
		public function Tooltip() {
      this._textField = this.createTextField();
      addChild(this._textField);

      this.render();
		}

    public function set text(value:String):void {
      this._textField.text = value;
    }

    public function show():void {
      this.alpha = 1;
    }

    public function hide():void {
      this.alpha = 0;
    }

    private function createTextField():TextField {
      var tf:TextField = new TextField();

      tf.defaultTextFormat = this.createTextFormat();
      tf.antiAliasType= AntiAliasType.NORMAL;
      tf.sharpness = 400;
      tf.embedFonts = true;
      tf.width = 100;
      tf.height = 20;

      return tf;
    }

    private function render():void {
      this.graphics.beginFill(0);
      this.graphics.drawRoundRect(0, 0, 100, 18, 15, 15);
      this.graphics.endFill();
    }

    private function createTextFormat():TextFormat {
      var tf:TextFormat = new TextFormat();
      tf.size = 13;
      tf.font = 'Ventouse';
      tf.color = 0xFFFFFF;
      tf.align = TextFormatAlign.CENTER;

      return tf;
    }
	}
}
