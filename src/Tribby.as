package {
	import flash.display.Sprite;
	import skins.TribbySkin;
	
	public class Tribby extends Sprite {

		public function Tribby() {
      var c:ContributionFetcher = new ContributionFetcher();
      c.addEventListener(ContributionEvent.DATA_RECEIVED, onDataLoaded);
      c.loadProject('http://github.com/wycats/participation_graph/26');
		}

    private function onDataLoaded(e:ContributionEvent):void {
      var graph:LineGraph = new LineGraph(e.data);
      addChild(graph);
    }
	}
}
