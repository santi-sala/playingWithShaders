Shader "SantiagoTesting/shader_unlit_nine"
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

            //Custom function
            float rectangle(float2 pt, float2 size, float2 center)
            {
                float2 p = pt-center;
                float2 halfsize = size * 0.5;                
                float horizontal = step(-halfsize.x, p.x) - step(halfsize.x, p.x);
                float vertical = step(-halfsize.y, p.y) - step(halfsize.y, p.y);
                return horizontal * vertical;
            }

            fixed4 frag (vertexTofragment i) : SV_Target
            {
                // Check if pixel is inside the rectangle, if it is color it else black
                float2 pos = i.position.xy;
                float2 size = float2(0.5, 0.25);
                float2 center = float2(0.25, 0.25);
                float inRectangle = rectangle(pos, size, center);
                fixed3 color = fixed3(1,1,0) * inRectangle;
                return fixed4(color, 1.0);
            }
            ENDCG


        }
    }
}
