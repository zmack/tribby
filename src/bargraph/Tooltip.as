package bargraph {

  import flash.display.Sprite;
  import flash.text.TextField;
  import flash.text.TextFormat;
	
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
      tf.embedFonts = true;

      return tf;
    }

    private function render():void {
      this.graphics.beginFill(0);
      this.graphics.drawRoundRect(0, 0, 40, 10, 15, 15);
      this.graphics.endFill();
    }

    private function createTextFormat():TextFormat {
      var tf:TextFormat = new TextFormat();
      tf.size = 8;
      tf.font = 'Pixel';
      tf.color = 0xFFFFFF;

      return tf;
    }
	}
}
