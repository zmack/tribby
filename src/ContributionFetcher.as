package  {
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.net.URLLoader;
  import flash.net.URLRequest;
	
	public class ContributionFetcher extends EventDispatcher {
		private var _loader:URLLoader;
    
		public function ContributionFetcher() {
      _loader = new URLLoader();
      _loader.addEventListener(Event.COMPLETE, onLoaded);
		} 

    public function loadProject(participationGraphURL:String):void {
      var request:URLRequest = new URLRequest(participationGraphURL);
      
      try {
        _loader.load(request);
      } catch (e:Error) {
        trace("Failed miserably");
      }
    }

    public function parseData(data:String):Array {
      var splitData:Array = data.split("\n");

      return getWeeklyContributions(splitData[0], splitData[1]);
    }

    private function onLoaded(e:Event):void {
      trace('data loaded');
      var decodedData:Array = parseData(_loader.data);
      var ce:ContributionEvent = new ContributionEvent(ContributionEvent.DATA_RECEIVED, decodedData);

      dispatchEvent(ce);
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
