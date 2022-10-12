package shaders;

import flixel.system.FlxAssets.FlxShader;
import openfl.display.Shader;

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

class WavyShader extends FlxShader {

    @:glFragmentSource('
        #pragma header

        uniform float totalElapsed;

        float clampFloat(float vall, float minn, float maxx) {
            if (vall < minn)
                return minn;
            if (vall > maxx)
                return maxx;
            return vall;
        }

        vec2 wavyPoint(vec2 og) {
            return vec2(clampFloat(og.x + (cos(totalElapsed*1.25 + og.y*4.0)/2.0), 0.0, 1.0), clampFloat(og.y + (sin(totalElapsed*1.75 + og.x*5.5)/2.0), 0.0, 1.0));
        }

        void main() {
            vec4 color = flixel_texture2D(bitmap, wavyPoint(openfl_TextureCoordv));
            vec4 outputPixel = vec4(color.x, color.y, color.z, 1.0);
            gl_FragColor = outputPixel * color.a;
        }
    ')

    public function new() {
        super();
    }
}