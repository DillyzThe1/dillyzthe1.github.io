package;

import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(1280, 720, PlayState, 1, 60, 60, true, false));
		addChild(new FPS(10, 10, 0xFFFFFFFF));
	}
}
