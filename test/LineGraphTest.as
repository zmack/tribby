package  {

	import asunit.framework.TestCase;

	public class LineGraphTest extends TestCase {
		private var lineGraph:LineGraph;

		public function LineGraphTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			lineGraph = new LineGraph();
		}

		override protected function tearDown():void {
			super.tearDown();
			lineGraph = null;
		}

		public function testInstantiated():void {
			assertTrue("lineGraph is LineGraph", lineGraph is LineGraph);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
	}
}