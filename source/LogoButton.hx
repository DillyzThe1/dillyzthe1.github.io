package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class LogoButton extends FlxSprite {
    private var siteName:String;
    private var lastHovering:Bool;
    private var lastTween:FlxTween;

    public function new(x:Float, y:Float, logoName:String, siteName:String) {
        super(x, y);

        loadGraphic(Paths.image(logoName));
        setGraphicSize(64, 64);
        updateHitbox();

        this.siteName = siteName;
        lastHovering = false;
    }

    public override function update(e:Float) {
        super.update(e);

        var curHover:Bool = FlxG.mouse.overlaps(this);
        if (curHover != lastHovering) {
            lastHovering = curHover;

            if (lastTween != null)
                lastTween.cancel();

            lastTween = FlxTween.tween(this.scale, {x: lastHovering ? 1.075 : 0.95, y: lastHovering ? 1.075 : 0.95}, 0.65, {ease: FlxEase.cubeInOut});
        }

        if (lastHovering && FlxG.mouse.justPressed) {
            switch (siteName) {
                case 'github':
                    FlxG.openURL('https://github.com/DillyzThe1');
                default:
                    trace('forgot $siteName');
            }
        }
    }
}