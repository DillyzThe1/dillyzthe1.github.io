package;

import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;

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

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(1280, 720, PlayState, 1, 60, 60, true, false));
		addChild(new FPS(10, 10, 0xFFFFFFFF));
	}
}
