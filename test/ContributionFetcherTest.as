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
      var data:String = "AAAAAAAAAAAAAAAAAAAAAAAAAAAEAGAAANAAABAAAAAAArAIACAhAAAAAAACAAAAAGAAACAAANAGADAAAAAAAAAAAAAAAJAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAEAGAAANAAABAAAAAAAhAIAAAgAAAAAAACAAAAAGAAACAAANAAADAAAAAAAAAAAAAAAJAAAAAAAAAA";
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

    public function testBigAssNumbers():void {
      var data:String = "AhAYAkAUAEANAJAPADAKAPAHAPAaA4BdBlA2BQBGA1APAuAdAdAqBLBLA6AaAuA5AgAmAmAdA2AdAQAXAfAjA6BVAlAeAqA2AzA5AeAb\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
      // Big thanks to rails for providing big-ass numbers >_<
      var parsedData:Array = instance.parseData(data);

      assertEquals(33, parsedData[0].total);
      assertEquals(24, parsedData[1].total);
      assertEquals(36, parsedData[2].total);
      assertEquals(56, parsedData[14].total);
      assertEquals(93, parsedData[15].total);
      assertEquals(101, parsedData[16].total);
      //assertEquals(33, parsedData[5].total);
      //assertEquals(33, parsedData[6].total);
    }
	}
}
