Shader "SantiagoTesting/shader_unlit_three"
{
    Properties {
        /* It can be int, float, vector, range, color 2d or cube*/
        _ColorRed("First Color", Color) = (1,0,0,1) //No semi colon....
        _ColorGreen("Second Color", Color) = (0,1,0,1)
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100 //Level of detail (We dont care about light).

        Pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag            

            #include "UnityCG.cginc"

            fixed4 _ColorRed;
            fixed4 _ColorGreen;

            fixed4 frag (v2f_img i) : SV_Target
            {                
                float delta = (sin(_Time.y)+1)/2;

                // If delta == 0 --> _ColorRed, if delta == 1 --> _ColorGreen
                fixed3 color = lerp(_ColorRed, _ColorGreen, delta);

                return fixed4(color, 1);
            }
            ENDCG
        }
    }
}
