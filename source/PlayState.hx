package;

import LogoButton;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import openfl.filters.GlowFilter;
import shaders.WavyShader;

class PlayState extends FlxState
{
	private var bg:FlxSprite;
	private var bgShader:WavyShader;
	private var dillyzPFP:FlxSprite;
	private var dillyzTitle:FlxText;
	private var dillyzSubTitle:FlxText;
	private var dillyzSubTitle2:FlxText;

	private var camGame:FlxCamera;
	private var camHUD:FlxCamera;

	override public function create()
	{
		super.create();
		FlxG.autoPause = false;

		camGame = new FlxCamera();
		camHUD = new FlxCamera();
		camHUD.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camHUD, false);

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
		dillyzPFP.antialiasing = true;

		dillyzTitle = new FlxText(0, 20, 0, "DillyzThe1", 16, true);
		dillyzTitle.setFormat(Paths.font('FredokaOne-Regular'), 64, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
		//dillyzTitle.borderSize = 5;
		dillyzTitle.screenCenter(X);
		dillyzTitle.antialiasing = true;
		add(dillyzTitle);

		dillyzSubTitle = new FlxText(0, 100, 0, "The one friend with all the digital skills you needed.", 16, true);
		dillyzSubTitle.setFormat(Paths.font('FredokaOne-Regular'), 24, 0xFFDCDCDC, FlxTextAlign.CENTER, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
		//dillyzSubTitle.borderSize = 5;
		dillyzSubTitle.screenCenter(X);
		dillyzSubTitle.antialiasing = true;
		add(dillyzSubTitle);

		dillyzSubTitle2 = new FlxText(0, 128, 0, "Programming | Art | Animation | Music | Pixel Art | Pixel Animation", 16, true);
		dillyzSubTitle2.setFormat(Paths.font('FredokaOne-Regular'), 16, 0xFFBBBBBB, FlxTextAlign.CENTER, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
		//dillyzSubTitle.borderSize = 5;
		dillyzSubTitle2.screenCenter(X);
		dillyzSubTitle2.antialiasing = true;
		add(dillyzSubTitle2);

		var githubButton:LogoButton = new LogoButton(dillyzPFP.x - 82 - 32, dillyzPFP.y + dillyzPFP.height/2 - 32, 'GitHub-Mark-Light-64px', 'github');
		githubButton.antialiasing = true;
		add(githubButton);

		dillyzPFP.cameras = dillyzTitle.cameras = dillyzSubTitle.cameras = dillyzSubTitle2.cameras = githubButton.cameras = [camHUD];
		camHUD.setFilters([new GlowFilter(0x00000000, 1, 6, 6, 2, 3, false, false)]);

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
