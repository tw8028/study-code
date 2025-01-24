using System.Collections;
using System.Collections.Generic;
using UnityEditor.Animations;
using UnityEngine;

public class SetAnimator : MonoBehaviour
{
    AnimatorController controller;   
    public SetAnimator(Animator _animator)
    {
        controller = _animator.runtimeAnimatorController as AnimatorController;
    }
    ////void start()
    ////{
    ////    controller = animator.runtimeanimatorcontroller as animatorcontroller;
    ////}

    public void SetAniSpeed(int _layer, string _aniName, float _speed)
    {
        if (controller)
        {
            for (int i = 0; i < controller.layers[_layer].stateMachine.states.Length; i++)
            {
                if (controller.layers[_layer].stateMachine.states[i].state.name == _aniName)
                {
                    controller.layers[_layer].stateMachine.states[i].state.speed = _speed;
                }
            }
        }       
    }    
}
