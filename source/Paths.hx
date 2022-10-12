import flixel.graphics.frames.FlxAtlasFrames;

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

enum PathAssetType
{
	TXT;
	JSON;
	IMAGE;
	IMAGE_JSON;
	XML;
	MUSIC;
	SOUND;
	FONT;
	TEXTURE_ATLAS;
}

class Paths
{
	inline private static function asset(path:String, assetType:PathAssetType)
	{
		var subFolder:String;
		var fileExtension:String;

		switch (assetType)
		{
			case JSON:
				subFolder = 'data';
				fileExtension = 'json';
			case IMAGE:
				subFolder = 'images';
				fileExtension = 'png';
			case IMAGE_JSON:
				subFolder = 'images';
				fileExtension = 'json';
			case XML:
				subFolder = 'images';
				fileExtension = 'xml';
			case MUSIC:
				subFolder = 'music';
				fileExtension = #if web 'mp3' #else 'ogg' #end;
			case SOUND:
				subFolder = 'sounds';
				fileExtension = #if web 'mp3' #else 'ogg' #end;
			case FONT:
				subFolder = 'fonts';
				fileExtension = 'ttf';
			case TEXTURE_ATLAS:
				subFolder = 'images';
				fileExtension = null;
			default:
				subFolder = 'data';
				fileExtension = 'txt';
		}
		return 'assets/$subFolder/$path${fileExtension != null ? '.$fileExtension' : ''}';
	}

	inline public static function text(path:String)
		return asset(path, TXT);

	inline public static function json(path:String)
		return asset(path, JSON);

	inline public static function image(path:String)
		return asset(path, IMAGE);

	inline public static function imagejson(path:String)
		return asset(path, IMAGE_JSON);

	inline public static function xml(path:String)
		return asset(path, XML);

	inline public static function music(path:String)
		return asset(path, MUSIC);

	inline public static function sound(path:String)
		return asset(path, SOUND);

	inline public static function font(path:String)
		return asset(path, FONT);

	inline public static function sparrowv2(path:String)
		return FlxAtlasFrames.fromSparrow(image(path), xml(path));

	inline public static function textureAtlas(path:String)
		return asset(path, TEXTURE_ATLAS);
}
