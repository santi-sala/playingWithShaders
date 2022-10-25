Shader "SantiagoTesting/shader_unlit_one"
{
    Properties
    {
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


            fixed4 frag (v2f_img i) : SV_Target
            {                            
                return fixed4(1,0,0,1);
            }
            ENDCG
        }
    }
}
