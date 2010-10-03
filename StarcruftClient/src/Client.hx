package ;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.Lib;

/**
 * ...
 * @author Chris
 */

class Client extends Sprite
{
	var _battlefield : Battlefield;
	
	var _ship_one : Ship;
	
	var _down_keys : Array<Bool>;

	public function new()
	{
		super();
		
		_down_keys = new Array<Bool>();
		
		_battlefield = new Battlefield(Constants.BATTLEFIELD_WIDTH, Constants.BATTLEFIELD_HEIGHT);
		
		Lib.current.addChild(this);
		
		addChild(_battlefield);
		
		_ship_one = new Ship();
		
		_ship_one.setLocation(new Vector2d(400, 500));
		_ship_one.setVelocity(new Vector2d( -30, -90));
		_ship_one.setBearing(300);
		_ship_one.setRotationSpeed(50);
		
		_battlefield.addSpaceObject(_ship_one);
		
		stage.addEventListener(Event.ENTER_FRAME,      onEnterFrame);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP,   onKeyUp);
	}
	
	private function onEnterFrame(event : Event) : Void
	{
	}
	
	private function onKeyDown(event : KeyboardEvent) : Void
	{
		var key_code : UInt;
		
		key_code = event.keyCode;
		
		if (!_down_keys[key_code])
		{
			_down_keys[key_code] = true;
			switch(key_code)
			{
				case 87: // w
					_ship_one.engageForwardThruster();
				case 65: // a
					_ship_one.engageLeftJet();
				case 83: // s
					_ship_one.engageReverseThruster();
				case 68: //d
					_ship_one.engageRightJet();
				default:
					trace("Key down: " + key_code);
			}
		}
	}
	
	private function onKeyUp(event : KeyboardEvent) : Void
	{
		var key_code : UInt;
		
		key_code = event.keyCode;
		
		if (_down_keys[key_code])
		{
			_down_keys[key_code] = false;
			switch(key_code)
			{
				case 87: // w
					_ship_one.disengageForwardThruster();
				case 65: // a
					_ship_one.disengageLeftJet();
				case 83: // s
					_ship_one.disengageReverseThruster();
				case 68: //d
					_ship_one.disengageRightJet();
				default:
					trace("Key up: " + key_code);
			}
		}
	}
	
}