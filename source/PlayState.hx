package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	private var dillyzPFP:FlxSprite;
	override public function create()
	{
		super.create();

		FlxG.autoPause = false;

		dillyzPFP = new FlxSprite().loadGraphic(Paths.image('dillyznewpfp'));
		dillyzPFP.setGraphicSize(150,150);
		dillyzPFP.updateHitbox();
		add(dillyzPFP);
		dillyzPFP.x = FlxG.width/2 - dillyzPFP.width/2;
		dillyzPFP.y = FlxG.height - dillyzPFP.height;
	}

	private var totalElapsed:Float;
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		totalElapsed += elapsed;

		dillyzPFP.x = (FlxG.width/2 - dillyzPFP.width/2) + Math.sin(totalElapsed*2.5)*20;
	}
}
