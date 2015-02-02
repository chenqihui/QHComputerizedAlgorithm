//
//  ReturnAlgorithm.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 15/2/2.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "ReturnAlgorithm.h"

//五大常用算法之四：回溯法---http://blog.jobbole.com/83962/

/*
 在包含问题的所有解的解空间树中，按照深度优先搜索的策略，从根结点出发深度探索解空间树。当探索到某一结点时，要先判断该结点是否包含问题的解，如果包含，就从该结点出发继续探索下去，如果该结点不包含问题的解，则逐层向其祖先结点回溯。（其实回溯法就是对隐式图的深度优先搜索算法）。
 
 
 （1）问题框架
 
 设问题的解是一个n维向量(a1,a2,………,an),约束条件是ai(i=1,2,3,…..,n)之间满足某种条件，记为f(ai)。
 
 （2）非递归回溯框架
 
 int a[n],
 i;初始化数组a[];
 i = 1;
 while (i > 0(有路可走) and(未达到目标)) // 还未回溯到头
 {
    if (i > n) // 搜索到叶结点
    {
        搜索到一个解，输出；
    } else // 处理第i个元素
    {
        a[i]第一个可能的值；
        while (a[i]在不满足约束条件且在搜索空间内)
        {
            a[i]下一个可能的值；
        }
        if (a[i]在搜索空间内)
        {
            标识占用的资源；
            i = i + 1; // 扩展下一个结点
        }else
        {
            清理所占的状态空间； // 回溯
            i = i –1;
        }
    }
 }
 （3）递归的算法框架
 
 回溯法是对解空间的深度优先搜索，在一般情况下使用递归函数来实现回溯法比较简单，其中i为搜索的深度，框架如下：
 */

@implementation ReturnAlgorithm

@end
