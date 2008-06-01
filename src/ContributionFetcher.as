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
      //trace( s + ' => ' + (gitHubCharCodeToInt(s.charCodeAt(0)) * 62 + gitHubCharCodeToInt(s.charCodeAt(1))) )
      return ( gitHubCharCodeToInt(s.charCodeAt(0)) * 64 + gitHubCharCodeToInt(s.charCodeAt(1)) )
    }

    private function gitHubCharCodeToInt(c:uint):uint {

      // A = 0 .. Z = 25
      if ( ( c >= 65 ) && ( c <= 90 ) )
        return c - 65;
      
      // a = 26 .. z = 51
      if ( ( c >= 97 ) && ( c <= 122 ) ) 
        return c - 97 + 26;
      
      // 0 = 52 .. 9 = 61
      if ( ( c >= 48 ) && ( c <= 57 ) ) 
        return c - 48 + 52;
      
      // ! = 62
      if ( c == 33 ) 
        return 62;

      // - = 63
      if ( c == 45 ) 
        return 63;

      return 0; // eeh, dunno =(
    }
	}
}
