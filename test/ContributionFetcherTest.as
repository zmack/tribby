package  {

	import asunit.framework.TestCase;

	public class ContributionFetcherTest extends TestCase {
		private var instance:ContributionFetcher;

		public function ContributionFetcherTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new ContributionFetcher();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is ContributionFetcher", instance is ContributionFetcher);
		}

    public function testDataParse():void {
      var data:String = "AAAAAAAAAAAAAAAAAAAAAAAAAAAEAGAAANAAABAAAAAAArAIACAhAAAAAAACAAAAAGAAACAAANAGADAAAAAAAAAAAAAAAJAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAEAGAAANAAABAAAAAAAhAIAAAgAAAAAAACAAAAAGAAACAAANAAADAAAAAAAAAAAAAAAJAAAAAAAAAA"
      var parsedData:Array = instance.parseData(data);
      assertEquals(0, parsedData[0].total);
      assertEquals(0, parsedData[0].own);
      
      assertEquals(4, parsedData[13].total);
      assertEquals(4, parsedData[13].own);

      assertEquals(33, parsedData[25].total);
      assertEquals(32, parsedData[25].own);
      // 0 - 13 = 0
      // 14 = 4/4
      // 15 = 6/6
      // 16 = 0
      // 17 = 13
      // 19 = 1
      // 23 = 33/43
    }
	}
}
