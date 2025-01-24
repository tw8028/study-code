Shader "Custom/AlphaTestShader"
{   
    Properties
    {
        _Color ("Color Tint", Color) = (1,1,1,1)
        _MainTex ("Texture", 2D) = "white" {}
        _Specular ("Specular", Color) = (1,1,1,1)
        _Gloss ("Gloss", Range(8.0, 256)) = 20
        
        _CutOffHand("CutOffHand", Color) = (1,1,1)
        _CutOffArm("CutOffArm", Color) = (1,1,1)
        _CutOffSpine("CutOffSpine", Color) = (1,1,1)
        _CutOffPelvis("CutOffPelvis", Color) = (1,1,1)
        _CutOffLeg("CutOffLeg", Color) = (1,1,1)
        _CutOffFoot("CutOffFoot", Color) = (1,1,1)
        _CutOffShoulder("CutOffShoulder", Color) = (1,1,1)
        


    }
    SubShader
    {       
        Tags{"Queue"="AlphaTest" "IgnoreProjector"="True" "RenderType"="TransparentCutout"}

        Pass
        {
            Tags {"LightMode" = "ForwardBase"}

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag           
            // ...
            #include "Lighting.cginc"       
            // ...

            //==============================================================
            /// <summary>
            /// variables are connected to Properties.
            /// </summary>
            fixed4 _Color;
            sampler2D _MainTex;
            // _MainTex_ST attach the scale and offset of _MainTex.
            float4 _MainTex_ST;
            fixed4 _Specular;
            float _Gloss;

            fixed3 _CutOffHand;
            fixed3 _CutOffArm;
            fixed3 _CutOffSpine;
            fixed3 _CutOffPelvis;
            fixed3 _CutOffLeg;
            fixed3 _CutOffFoot;
            fixed3 _CutOffShoulder;


            //===============================================================
            /// <summary>
            /// input and output struct.
            /// </summary>
            struct a2v{
                float4 vertex : POSITION;
                float3 normal : NORMAl;
                // use the first uv
                float4 texcoord : TEXCOORD0;
                fixed3 color : COLOR;
                };

            struct v2f{
                float4 pos : SV_POSITION;
                float3 worldNormal : TEXCOORD0;
                float3 worldPos : TEXCOORD1;
                float2 uv : TEXCOORD2;
                fixed3 color : COLOR;
                };

            //================================================================
            v2f vert(a2v v)
            {
                v2f o;

                // Get pos of v.vertex in clip space.
                o.pos = UnityObjectToClipPos(v.vertex);

                // Get v.normal in world space.
                o.worldNormal = UnityObjectToWorldNormal(v.normal);

                // Get pos of v.vertex in world sapce by multiplying worldMatrix of object.
                o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;

                // tranform uv by _MainTex_ST
                o.uv = v.texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
                // or just call the build-in function
                //      o.uv = TRANSFORM_TEX(v.texcoord, MainTex);
                o.color = v.color;
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                // normal in world space
                fixed3 worldNormal = normalize(i.worldNormal);
                fixed3 worldLightDir = normalize(UnityWorldSpaceLightDir(i.worldPos));

                // 反射率
                fixed3 albedo = tex2D(_MainTex, i.uv).rgb * _Color.rgb;

                // 环境光
                fixed3 ambient = unity_AmbientSky * albedo;

                fixed3 diffuse = _LightColor0.rgb * albedo * max(0, dot(worldNormal, worldLightDir));
                fixed3 viewDir = normalize(UnityWorldSpaceViewDir(i.worldPos));
                fixed3 halfDir = normalize(worldLightDir + viewDir);
                fixed3 specular = _LightColor0.rgb * _Specular.rgb * pow(max(0, dot(worldNormal, halfDir)), _Gloss);

                clip(length(_CutOffHand.rgb - i.color) < 0.1f ? -1 : 1);
                clip(length(_CutOffArm.rgb - i.color) < 0.1f ? -1 : 1);
                clip(length(_CutOffSpine.rgb - i.color) < 0.1f ? -1 : 1);
                clip(length(_CutOffPelvis.rgb - i.color) < 0.1f ? -1 : 1);
                clip(length(_CutOffLeg.rgb - i.color) < 0.1f ? -1 : 1);
                clip(length(_CutOffFoot.rgb - i.color) < 0.1f ? -1 : 1);
                clip(length(_CutOffShoulder.rgb - i.color) < 0.1f ? -1 : 1);



                return fixed4(ambient + diffuse + specular, 1.0);
            }
            ENDCG
        }       
    }
}