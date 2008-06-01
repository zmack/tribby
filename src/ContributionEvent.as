package  {
  import flash.events.Event;
	
	public class ContributionEvent extends Event {
		
		public static const DATA_RECEIVED:String = "gotGitHubData";
		
		public var data:Array;
		
		public function ContributionEvent(type:String, data:Array = null) {
			super(type);
			this.data = data;
		}
		
		public override function clone():Event {
			return new ContributionEvent(this.type, this.data);
		}
	}
}
