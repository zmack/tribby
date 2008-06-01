package  {
	
	public class ContributionFetcher {
		
		public function ContributionFetcher() {
		} 

    public function parseData(data:String):Array {
      var splitData:Array = data.split("\n");

      //var own:String = data.split(',')[1];
      
      return getWeeklyContributions(splitData[0], splitData[1]);
    }

    private function getWeeklyContributions(totalData:String, ownData:String):Array {
      var rVal:Array = [];
      for ( var i:uint = 0; i < 52; i++ ) {
        rVal[i] = {
          own: decodeString(ownData.substr(i*2, 2)),
          total: decodeString(totalData.substr(i*2, 2))
        }
      }
      return rVal;
    }

    private function decodeString(s:String):uint {
      return ( gitHubCharCodeToInt(s.charCodeAt(0)) * 52 + gitHubCharCodeToInt(s.charCodeAt(1)) )
    }

    private function gitHubCharCodeToInt(c:uint):uint {
      var zero:uint = 65;
      var value:uint = c - zero;

      if ( value > 25 ) {
        return value - 6;
      } else {
        return value;
      }
    }
	}
}
