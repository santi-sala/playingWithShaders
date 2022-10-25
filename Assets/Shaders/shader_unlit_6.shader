Shader "SantiagoTesting/shader_unlit_six"
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
                fixed3 color = i.position * 2;

                //Step n<edge --> 0 n>edge --> 1 smoothstep(edge1, edge2, n)
                //X Channel (Horizontal)
                color.r = step(-1, color.r);
                //Y channel (Vertical)
                color.g = step(0, color.g);
                   
                return fixed4(color, 1.0);
            }
            ENDCG


        }
    }
}
