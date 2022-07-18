Shader "Unlit/FrostShader"
{
    Properties
    {
        _MainTex("Main Texture", 2D) = "white" {}
        _MainColor("Main Color", Color) = (1, 1, 1, 1)
        _AlphaMap("Alpha Map (R)", 2D) = "white" {}
        _Alpha("Alpha", Range(0.0, 5.0)) = 0.5
    }

    SubShader
    {
        LOD 300

        Tags
        {
            "Queue" = "Transparent"
            "IgnoreProjector" = "True"
            "RenderType" = "Transparent"
        }
        ZWrite Off
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows alpha:fade
        #pragma target 3.0
        struct Input
        {
            float2 uv_MainTex;
            float2 uv_AlphaMap;
        };
        sampler2D _MainTex;
        float4 _MainColor;
        sampler2D _AlphaMap;
        float _Alpha;
        float _MeshSize;
        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * _MainColor;
            fixed atex = tex2D(_AlphaMap, IN.uv_AlphaMap).a;
            o.Alpha = clamp(atex * _Alpha,0,1);
        }
        ENDCG
    }
}
