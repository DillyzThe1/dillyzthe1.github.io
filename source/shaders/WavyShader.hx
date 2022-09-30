package shaders;

import flixel.system.FlxAssets.FlxShader;
import openfl.display.Shader;

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