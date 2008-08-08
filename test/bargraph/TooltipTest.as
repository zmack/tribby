package bargraph {

	import asunit.framework.TestCase;

	public class TooltipTest extends TestCase {
		private var tooltip:Tooltip;

		public function TooltipTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			tooltip = new Tooltip();
		}

		override protected function tearDown():void {
			super.tearDown();
			tooltip = null;
		}

		public function testInstantiated():void {
			assertTrue("tooltip is Tooltip", tooltip is Tooltip);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
	}
}