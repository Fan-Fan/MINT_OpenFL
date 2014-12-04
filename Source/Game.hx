package ;

import flash.display.Sprite;
import flash.events.Event;

class Game extends Sprite
{
	public function new()
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}

	private function init(e:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		trace("I can start writing the game!");
	}
}