using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FrostByTime : MonoBehaviour
{
    private float transparency = 0f;
    [SerializeField]
    private Material iceMat;
    void Start()
    {
        
    }
    void Update()
    {
        if (Input.GetMouseButton(0))
        {
            transparency -= .02f;
        }
        else
        {
            transparency += .02f;
        }
        transparency = Mathf.Clamp(transparency, 0f, 5f);
        iceMat.SetFloat("_Alpha", transparency);
    }
}
