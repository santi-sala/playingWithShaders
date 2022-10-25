Shader "SantiagoTesting/shader_unlit_four"
{
    Properties {
        /* It can be int, float, vector, range, color 2d or cube*/
        _ColorRed("First Color", Color) = (1,0,0,1) //No semi colon....
        _ColorBlue("First Color", Color) = (0,0,1,1)
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
            fixed4 _ColorBlue;

            fixed4 frag (v2f_img i) : SV_Target
            {                
                float delta = i.uv.x;
                fixed3 color = lerp(_ColorRed, _ColorBlue, delta);
                return fixed4(color, 1);
            }
            ENDCG
        }
    }
}
