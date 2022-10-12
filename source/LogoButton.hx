package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

/**
Copyright 2022 DillyzThe1

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
**/

class LogoButton extends FlxSprite {
    private var siteName:String;
    private var lastHovering:Bool;
    private var lastTween:FlxTween;

    public function new(x:Float, y:Float, logoName:String, siteName:String) {
        super(x, y);

        loadGraphic(Paths.image(logoName));
       // setGraphicSize(64, 64);
        //updateHitbox();

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

            lastTween = FlxTween.tween(this.scale, {x: lastHovering ? 1.075 : 0.95, y: lastHovering ? 1.075 : 0.95}, 0.25, {ease: FlxEase.cubeInOut});
        }

        if (lastHovering && FlxG.mouse.justPressed) {
            switch (siteName) {
                case 'github':
                    FlxG.openURL('https://github.com/DillyzThe1');
                case 'youtube':
                    FlxG.openURL('https://www.youtube.com/c/DillyzThe1/');
                case 'gamebanana':
                    FlxG.openURL('https://gamebanana.com/members/2088207');
                default:
                    trace('forgot $siteName');
            }
        }
    }
}