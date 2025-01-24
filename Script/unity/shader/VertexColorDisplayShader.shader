Shader "Custom/VertexColorDisplayShader"
{
    Properties
    {
        
    }
    SubShader
    {       

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag   
            
            struct appdata
            {
                float4 vertex : POSITION;
                fixed3 color : COLOR;
            };

            struct v2f
            {          
                float4 vertex : SV_POSITION;
                fixed3 color : COLOR;
            };


            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.color = v.color;
                return o;
            }

            fixed3 frag (v2f i) : SV_Target
            {
                return i.color;
            }
            ENDCG
        }
    }
}
