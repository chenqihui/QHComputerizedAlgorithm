//
//  PancakeSort.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-12-10.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "PancakeSort.h"

#import "StackAndQueue.h"

@interface PancakeSort ()
{
    StackAndQueue *_stackAndQueue;
}

@end

//算法系列：煎饼排序--http://blog.jobbole.com/74263/
/*
 煎饼排序： 维基百科给出的释义煎饼排序是数学上的一个问题的一种通俗叫法：对一堆无序的煎饼以大小排序，铲子可以在任意位置伸进去并且把上面的煎饼都翻转过来。
 通俗点说，我们有一个锅铲和一堆煎饼，我们的目标是将煎饼按照大小排序，大的在下面。我们唯一的办法是让锅铲从一个地方伸进去，并且把上面所有的煎饼翻下来。举个栗子，一开始的煎饼是这样子的：
 */
@implementation PancakeSort

- (void)initData
{
    _stackAndQueue = [StackAndQueue new];
}

- (void)runing
{
    NSArray *ar = @[@1, @4, @5, @2, @3, @8, @6, @7, @9, @0];
    NSMutableArray *arD;
    arD = (NSMutableArray *)[_stackAndQueue reverse:ar];
    
    for (int i = 0; i < arD.count; i++)
    {
        //寻找最大的值（这里参与线性查找）
        int index = [self maxLinearSearch:arD index:i];
        NSLog(@"%d", index);
        //把最大值翻转到最顶部
        arD = (NSMutableArray *)[_stackAndQueue reverse:arD index:index];
        NSLog(@"‘Flip Up’:%@", arD);
        //把还未排序的部分整个翻转
        arD = (NSMutableArray *)[_stackAndQueue reverse:arD index:i];
        NSLog(@"‘Flip Down’:%@", arD);
    }
}

- (int)maxLinearSearch:(NSArray *)arUnSort index:(int)index
{
    int idx = index;
    int temp = [arUnSort[index] intValue];
    for (int i = index + 1; i < arUnSort.count; i++)
    {
        if ([arUnSort[i] intValue] > temp)
        {
            temp = [arUnSort[i] intValue];
            idx = i;
        }
    }
    
    return idx;
}

@end
