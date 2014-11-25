//
//  MergeSort.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14/11/24.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "MergeSort.h"

//浅谈算法和数据结构（3）：合并排序---http://blog.jobbole.com/79293/
@implementation MergeSort

- (void)initData
{
}

- (void)runing
{
    int a1[]={1,5,8,13,21};
    int a2[]={2,5,10,12,25};
    merge(a1, 5, a2, 5);
}

/*
 合并排序依赖于合并操作，即将两个已经排序的序列合并成一个序列，具体的过程如下：
 
 申请空间，使其大小为两个已经排序序列之和，然后将待排序数组复制到该数组中。
 设定两个指针，最初位置分别为两个已经排序序列的起始位置
 比较复制数组中两个指针所指向的元素，选择相对小的元素放入到原始待排序数组中，并移动指针到下一位置
 重复步骤3直到某一指针达到序列尾
 将另一序列剩下的所有元素直接复制到原始数组末尾
 */
void merge(int *a1, int alen, int *a2, int blen)
{
    int a[alen + blen];
    int i = 0;
    int j = 0;
    //然后按照规则将数据从辅助数组中拷贝回原始的array中
    for (int k = 0; k < alen + blen; k++)
    {
        //如果左边元素没了， 直接将右边的剩余元素都合并到到原数组中
        if (i > alen)
        {
            a[k] = a2[j++];
        }//如果右边元素没有了，直接将所有左边剩余元素都合并到原数组中
        else if (j > blen)
        {
            a[k] = a1[i++];
        }//如果左边右边小，则将左边的元素拷贝到原数组中
        else if (a1[i] < a2[j])
        {
            a[k] = a1[i++];
        }else
        {
            a[k] = a2[j++];
        }
    }
    
    show(a, alen + blen);
}

@end
