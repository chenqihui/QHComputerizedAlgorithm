//
//  DivideAndConquerAlgorithm.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 15/2/2.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "DivideAndConquerAlgorithm.h"

//五大常用算法之一：分治算法---http://blog.jobbole.com/83944/

/*
 把一个复杂的问题分成两个或更多的相同或相似的子问题，再把子问题分成更小的子问题……直到最后子问题可以简单的直接求解，原问题的解即子问题的解的合并。
 
 {
 分治法在每一层递归上都有三个步骤：
 
 step1 分解：将原问题分解为若干个规模较小，相互独立，与原问题形式相同的子问题；
 
 step2 解决：若子问题规模较小而容易被解决则直接解，否则递归地解各个子问题
 
 step3 合并：将各个子问题的解合并为原问题的解。
 
 它的一般的算法设计模式如下：
 
 Divide-and-Conquer(P)
 
 1. if |P|≤n0
 
 2. then return(ADHOC(P))
 
 3. 将P分解为较小的子问题 P1 ,P2 ,…,Pk
 
 4. for i←1 to k
 
 5. do yi ← Divide-and-Conquer(Pi) △ 递归解决Pi
 
 6. T ← MERGE(y1,y2,…,yk) △ 合并子问题
 
 7. return(T)
 }
 */

@implementation DivideAndConquerAlgorithm

@end
