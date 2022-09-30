package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import openfl.filters.BlurFilter;
import openfl.filters.ShaderFilter;
import shaders.WavyShader;

class PlayState extends FlxState
{
	private var bg:FlxSprite;
	private var bgShader:WavyShader;
	private var dillyzPFP:FlxSprite;
	override public function create()
	{
		super.create();
		FlxG.autoPause = false;

		bg = new FlxSprite().loadGraphic(Paths.image('bg'));
		bg.setGraphicSize(FlxG.width, FlxG.height);
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);
		bgShader = new WavyShader();
		bg.shader = bgShader;

		dillyzPFP = new FlxSprite().loadGraphic(Paths.image('dillyznewpfp'));
		dillyzPFP.setGraphicSize(150,150);
		dillyzPFP.updateHitbox();
		add(dillyzPFP);
		dillyzPFP.x = FlxG.width/2 - dillyzPFP.width/2;
		dillyzPFP.y = FlxG.height - dillyzPFP.height;

		bgShader.totalElapsed.value = [0];
	}

	private var totalElapsed:Float;
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		totalElapsed += elapsed;
		bgShader.totalElapsed.value[0] = totalElapsed;

		//dillyzPFP.x = (FlxG.width/2 - dillyzPFP.width/2) + Math.sin(totalElapsed*2.5)*20;
	}
}
