Shader "NLD_URP/NLD_Charactor"
{
    Properties
    {
        // [MainColor] _BaseColor ("Main Color", color) = (1,1,1,1)
        [MainTexture] _MainTex ("Texture", 2D) = "white" {}
        _MaskTex ("Mask", 2D) = "white" {}
        _OutlineColor("Outline Color",color)=(0.18,0.1098,0.0549,1)
        _Outline("Thick of Outline",range(0,0.1))=0.008
        _Factor("Factor",range(0,1)) = 0.32
        // _Metillic("Metillic", range(0,1.0)) = 0.5
        // _Smoothness("Smoothness", range(0,1.0)) = 0.5
        // _emission("Emission", range(0, 1.0)) = 0.5
        _shadowScale("ShadowScale", range(0, 1.0)) = 0.5
        // _specularColor("SpecularColor", color) = (1,1,1,1)
        _specularScaleG("SpecularScaleG", range(0, 10.0)) = 2.0
        _specularScaleB("SpecularScaleB", range(0, 10.0)) = 2.0
        _AlphaClip ("Alpha Clip", Range(0,1)) = 0.1
        
        // 接受阴影开关
        [MaterialToggle(_RECEIVE_SHADOW_ON)] _ReceiveShadow ("Receive Shadow", Float) = 0

    }
    SubShader
    {
        Tags { 
            "RenderType"="Opaque"
            "RenderPipeline" = "UniversalPipeline"
        }
        LOD 100
        
        HLSLINCLUDE

        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

        struct appdata
        {
            float4 positionOS : POSITION;
            float3 normal : NORMAL;
            float4 tangent : TANGENT;
            float2 uv : TEXCOORD0;
        };

        struct v2f
        {
            float2 uv : TEXCOORD0;
            float4 positionHCS : SV_POSITION;
            #if defined(_RECEIVE_SHADOW_ON)
            float3 normalWS : TEXCOORD1;
            float3 positionWS : TEXCOORD02;
            #endif
        };

        TEXTURE2D(_MainTex);
        SAMPLER(sampler_MainTex);

        TEXTURE2D(_MaskTex);
        SAMPLER(sampler_MaskTex);

        CBUFFER_START(UnityPerMaterial)

            float4 _MainTex_ST;
            float4 _MaskTex_ST;
            float4 _BaseMap_ST;
            float _specularScaleB;
            float _specularScaleG;
            float _shadowScale;
            float _Outline;
            float4 _OutlineColor;
            float _Factor;
            float _AlphaClip;

        CBUFFER_END

        ENDHLSL

        Pass
        {
            Cull Off
            Name "ForwardLit"
            Tags {
                "LightMode" = "UniversalForward"
                "RenderType" = "Opaque"
            }
            
            Blend SrcAlpha OneMinusSrcAlpha
            BlendOp Add
            
            ZWrite On
            ZTest Less
            
            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature_local _ _RECEIVE_SHADOW_ON

            #if defined(_RECEIVE_SHADOW_ON)
                #pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
                #pragma multi_compile _ _MAIN_LIGHT_SHADOWS
                #pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
                #pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
                #pragma multi_compile _ _SHADOWS_SOFT
            #endif

            v2f vert (appdata v)
            {
                v2f o;
                o.positionHCS = TransformObjectToHClip(v.positionOS.xyz);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);


                #if defined(_RECEIVE_SHADOW_ON)
                    o.positionWS = TransformObjectToWorld(v.positionOS);
                    o.normalWS = TransformObjectToWorldNormal(v.normal);
                #endif
            
                
                return o;
            }

            half4 frag (const v2f i) : SV_Target
            {
                // sample the texture
                half4 color = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, i.uv);
                if (color.a <= _AlphaClip) discard;
                // AlphaDiscard(color.a, 0.5);
                // color.a = 1;

                half4 colorMask = SAMPLE_TEXTURE2D(_MaskTex, sampler_MaskTex, i.uv);
                float r = colorMask.r;
                
                half shadow = 1.0;
                #if defined(_RECEIVE_SHADOW_ON)
                //当前模型接收阴影
                float4 SHADOW_COORDS = TransformWorldToShadowCoord(i.positionWS);
                
                // 光照阴影数据
                shadow = MainLightRealtimeShadow(SHADOW_COORDS);
                #endif
                
                if (r < 0.5) {
                    shadow = 0;
                }

                color.xyz *= lerp(1, _shadowScale, 1 - shadow);

                if (colorMask.b > 0.5) {
                    color.xyz *= _specularScaleB;
                }

                if (colorMask.g > 0.5) {
                    color.xyz *= _specularScaleG;
                }

                // if (colorMask.g > 0.5) {
                //     SurfaceData surfaceData = (SurfaceData)0;
                //     surfaceData.alpha = 1;
                //     surfaceData.albedo = color.rgb;
                //     // 金属度
                //     surfaceData.metallic = _Metillic;
                //     surfaceData.specular = half3(0,0,0);
                //     surfaceData.smoothness = _Smoothness;
                //     surfaceData.normalTS = i.normalWS;
                //     surfaceData.occlusion = 1.0;
                //     surfaceData.emission = _emission;

                //     InputData inputData = (InputData)0;
                //     inputData.positionWS = i.positionWS;
                //     half3 viewDirWS = GetWorldSpaceNormalizeViewDir(inputData.positionWS);
                //     inputData.normalWS = i.normalWS;
                //     inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
                //     viewDirWS = SafeNormalize(viewDirWS);
                //     inputData.viewDirectionWS = viewDirWS;
                //     inputData.shadowCoord = float4(0,0,0,0);

                //     half4 bpColor = UniversalFragmentPBR(inputData, surfaceData);
                //     return bpColor;
                // }

                return color;
                
            }
            ENDHLSL
        }

        Pass {
            Name "Outline"
            Tags { "LightMode" = "Outline" }
            Cull Front
            ZTest Less
		    ZWrite On

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            v2f vert (appdata v)
            {
                v2f o;
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                float3 dir = TransformObjectToWorldNormal(v.normal);
                float3 dir2 = v.normal;
                float D = dot(dir, dir2);
                dir = dir*sign(D);
                dir = dir*_Factor + dir2*(1-_Factor);
                v.positionOS.xyz += dir*_Outline;
                o.positionHCS = TransformObjectToHClip(v.positionOS.xyz);
                return o;
            }

            half4 frag (v2f i) : SV_Target
            {
                // sample the texture
                half4 color = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, i.uv);
                if (color.a < _AlphaClip) discard;

                half4 mask = SAMPLE_TEXTURE2D(_MaskTex, sampler_MaskTex, i.uv);
                if (mask.a < 0.1) discard;
                
                half4 c = _OutlineColor;
			    return c;
            }
            ENDHLSL
        }

        Pass {
            Name "ShadowCaster"
            Tags
            {
                "LightMode" = "ShadowCaster"
            }

            // -------------------------------------
            // Render State Commands
            ZWrite On
            ZTest LEqual
            Cull Back

            HLSLPROGRAM
            #pragma target 2.0

            // -------------------------------------
            // Shader Stages
            #pragma vertex vert
            #pragma fragment frag

            v2f vert (appdata v)
            {
                v2f o;
                o.positionHCS = TransformObjectToHClip(v.positionOS.xyz);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            half4 frag (v2f i) : SV_Target
            {
                half4 color = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, i.uv);
                if (color.a < _AlphaClip) discard;
                return 1;
            }
            
            ENDHLSL
        }
    }
}
