package {
	import flash.display.Sprite;
  import flash.external.ExternalInterface;
  import flash.display.StageScaleMode;
  import flash.display.StageAlign;
  import flash.display.LoaderInfo;

  import skins.TribbySkin;
	
	public class Tribby extends Sprite {

		public function Tribby() {
      new skins.TribbySkin.PixelFont();
      stage.scaleMode = StageScaleMode.NO_SCALE;
      stage.align = StageAlign.TOP_LEFT;

      var c:ContributionFetcher = new ContributionFetcher();
      c.addEventListener(ContributionEvent.DATA_RECEIVED, onDataLoaded);
      c.loadProject(getProjectUrl());
		}

    private function getProjectUrl():String {
      var params:Object = LoaderInfo(this.loaderInfo).parameters;
      var user:String = params.gitUser || 'rails';
      var project:String = params.gitProject || 'rails';

      return 'http://github.com/' + user + '/' + project + '/graphs/owner_participation';
    }
      
    private function onDataLoaded(e:ContributionEvent):void {
      //var graph:LineGraph = new LineGraph(e.data, stage.stageWidth, stage.stageHeight);
      var graph:BarGraph = new BarGraph(e.data, stage.stageWidth, stage.stageHeight);
      addChild(graph);
    }
	}
}
