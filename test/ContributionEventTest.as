package  {

	import asunit.framework.TestCase;

	public class ContributionEventTest extends TestCase {
		private var instance:ContributionEvent;

		public function ContributionEventTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new ContributionEvent();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is ContributionEvent", instance is ContributionEvent);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
	}
}