//
//  PowerAlgorithms.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-12-11.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "PowerAlgorithms.h"

#include "math.h"

//算法系列：求幂算法--http://blog.jobbole.com/74468/

@implementation PowerAlgorithms

- (void)initData
{
}

- (void)runing
{
    float reuslt = power1(2, 23);
    NSLog(@"%f", reuslt);
    
    if (1024 == power1(2, 10))
    {
        NSLog(@"power ture");
    }
    
    reuslt = power2(2, 10, 1, 1);
    NSLog(@"%f", reuslt);
    reuslt = power2(2, 10, 0, 0);
    NSLog(@"%f", reuslt);
}
//总结：貌似是一种分解过程，2^4=2^2*2^2=(2^1*2^1)*(2^1*2^1)，下面只是反向来计算
/*
 1.这个函数需要两个整数，$x和$n然后返回$x的$n次幂作为结果。
 
 2.首先创建一个辅助变量$y并且初始化为1，把它作为乘法的主体。
 
 3.然后函数在每次循环迭代的时候扫描$n的二进制表示的数。如果遇到1则$y乘上$x，然后赋值回$y。每次循环都会计算$x的平方，并且把它赋值回$x。
 
 4.遇到1意味着当前$n的值不能被2整除，换句话说就是，$n % 2 == 1。
 
 5.同样的每次循环$n都会折半，然后向下取整得到结果。当$n等于0的时候，我们结束循环并且返回$y的值。
 */
//1
float power1(float x, int n)
{
    //2
    float y = 1;
    //3
    while (true)
    {
        int t = n%2;
        n = floor(n/2);
        //4
        if (t == 1)
        {
            y = y * x;
        }
        //5
        if (n == 0)
        {
            break;
        }
        
        x = x * x;
    }
    
    return y;
}
/*
 1.在当前实现中，我们创建$y作为乘法的主体，并设置为1。如果我们想把算法用在加法上，我们需要把$y设置为0。因此我们仅需要改变函数的单位元素的值。
 
 2.第二步要提供一个函数给我们的算法，它能够作乘法或者加法。为了实现这个目的我们会传递一个担当二元运算的函数。例如：一个需要两个参数的函数。这个函数需要遵循以下的规则。必须满足：a·（ b · c ） = (a · b ) · c。还要求返回结果的类型必须和两个输入参数的类型一致。
 
 PS:幸运的是加法和乘法都满足结合律，因此我们能够仅在一个函数中包含他们然后把它传递给我们的power算法。
 */
float power2(float x, int n, float d, int f)//f=1为乘法，0为加法，这里d要与f一致
{
    //1
    float y = d;
    //2
    while (true)
    {
        int t = n % 2;
        n = floor(n/2);
        
        if (t == 1)
        {
            if (f==1)
            {
                y = y*x;
            }else if (f==0)
            {
                y = y+x;
            }
        }
        
        if (n == 0) {
            break;
        }
        
        if (f==1)
        {
            x = x*x;
        }else if (f==0)
        {
            x = x+x;
        }
    }
    
    return y;
}
//附加更抽象的概念

@end
