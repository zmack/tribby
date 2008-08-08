package bargraph {

	import asunit.framework.TestCase;

	public class BarTest extends TestCase {
		private var bar:Bar;

		public function BarTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			bar = new Bar();
		}

		override protected function tearDown():void {
			super.tearDown();
			bar = null;
		}

		public function testInstantiated():void {
			assertTrue("bar is Bar", bar is Bar);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
	}
}