package  {

	import asunit.framework.TestCase;

	public class BarGraphTest extends TestCase {
		private var barGraph:BarGraph;

		public function BarGraphTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			barGraph = new BarGraph();
		}

		override protected function tearDown():void {
			super.tearDown();
			barGraph = null;
		}

		public function testInstantiated():void {
			assertTrue("barGraph is BarGraph", barGraph is BarGraph);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
	}
}