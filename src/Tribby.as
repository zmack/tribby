package {
	import flash.display.Sprite;
	import skins.TribbySkin;
	
	public class Tribby extends Sprite {

		public function Tribby() {
			addChild(new TribbySkin.ProjectSprouts());
			trace("Tribby instantiated!");
		}
	}
}
