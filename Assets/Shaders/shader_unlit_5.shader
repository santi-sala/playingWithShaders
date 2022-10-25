Shader "SantiagoTesting/shader_unlit_five"
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

            // Creating a data structure to pass from vertext shader to fragment shader
            struct vertexTofragment
            {
                // SV_POSITION --> System value position

                float4 vertex : SV_POSITION;
                // For custom data UNity recommends TEXTCOORDn as semantics 
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
                // Saturate clamps the values between 0 and 1
                fixed3 color = saturate(i.position * 2);
                return fixed4(color, 1.0);
            }
            ENDCG
        }
    }
}
