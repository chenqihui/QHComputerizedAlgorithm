//
//  DynamicProgramming.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 15/2/2.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "DynamicProgramming.h"

//五大常用算法之二：动态规划算法---http://blog.jobbole.com/83949/

/*
 将待求解的问题分解为若干个子问题（阶段），按顺序求解子阶段，前一子问题的解，为后一子问题的求解提供了有用的信息。在求解任一子问题时，列出各种可能的局部解，通过决策保留那些有可能达到最优的局部解，丢弃其他局部解。依次解决各子问题，最后一个子问题就是初始问题的解。
 
 
 动态规划决策过程示意图
 
 (1)划分阶段：按照问题的时间或空间特征，把问题分为若干个阶段。在划分阶段时，注意划分后的阶段一定要是有序的或者是可排序的，否则问题就无法求解。
 
 (2)确定状态和状态变量：将问题发展到各个阶段时所处于的各种客观情况用不同的状态表示出来。当然，状态的选择要满足无后效性。
 
 (3)确定决策并写出状态转移方程：因为决策和状态转移有着天然的联系，状态转移就是根据上一阶段的状态和决策来导出本阶段的状态。所以如果确定了决策，状态转移方程也就可写出。但事实上常常是反过来做，根据相邻两个阶段的状态之间的关系来确定决策方法和状态转移方程。
 
 (4)寻找边界条件：给出的状态转移方程是一个递推式，需要一个递推的终止条件或边界条件。
 
 一般，只要解决问题的阶段、状态和状态转移决策确定了，就可以写出状态转移方程（包括边界条件）。
 */

@implementation DynamicProgramming

@end
