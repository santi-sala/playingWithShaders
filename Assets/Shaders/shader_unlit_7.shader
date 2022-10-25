Shader "SantiagoTesting/shader_unlit_seven"
{
    Properties
    {
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            
            struct vertexTofragment
            {
                float4 vertex : SV_POSITION;
                float4 position: TEXCOORD1;
                float2 uv : TEXCOORD0;
            }; //Semi colon.....
            
            vertexTofragment vert (appdata_base v)
            {
                vertexTofragment o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.position = v.vertex;
                o.uv = v.texcoord;
                return o;
            }

            fixed4 frag (vertexTofragment i) : SV_Target
            {
                // When value is less than 1, put the color.
                float inCircle = 1 - step(0, length(i.position.xy));
                fixed3 color = fixed3(1,0,0) * inCircle;
                return fixed4(color, 1.0);
            }
            ENDCG


        }
    }
}
