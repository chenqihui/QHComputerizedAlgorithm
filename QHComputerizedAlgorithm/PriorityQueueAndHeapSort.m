//
//  PriorityQueueAndHeapSort.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-25.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "PriorityQueueAndHeapSort.h"

//浅谈算法和数据结构（5）：优先级队列与堆排序---http://blog.jobbole.com/79300/
@implementation PriorityQueueAndHeapSort

- (void)initData
{
}

- (void)runing
{
    //进行堆排序
    //1. 使用序列的所有元素，创建一个最大堆。
    int a[] = {9,6,8,10,2,11,1,5,7,4,2};
    int b[12];
    for (int i = 0; i < 12; i++)
    {
        insert2array(b, a[i], i);
    }
    show(b, 12);
    printf("----------------------");
    printf("\n");
    //2. 然后重复删除最大元素。
    for (int i = 1; i < 12; i++)
    {
        int d = delMax(b, 12);
        printf("%d", d);
        printf("\n");
    }
    
    printf("----------------------");
    printf("\n");
    //创建最大二叉堆：
    //???使用至下而上的方法创建二叉堆的方法为，分别对叶子结点的上一级节点以重上之下的方式重建堆。
    int d[] = {999,9,6,8,10,2,11,1,5,7,4,2};
    int N = 13;
    for (int i = N / 2; i >= 1; i--)
    {
        sink(d, i, N);
    }
    show(d, 13);
    
    printf("----------------------");
    printf("\n");
    //排序
    //利用二叉堆排序其实就是循环移除顶部元素到数组末尾，然后利用Sink重建堆的操作。如下图，实现代码如下：
    while (N > 1)
    {
        swap(d, 1, N--);
        sink(d, 1, N);
    }
    show(d, 13);
}

/*
 优先级队列可以通过链表，数组，堆或者其他数据结构实现。
 
 优先级队列和通常的栈和队列一样，只不过里面的每一个元素都有一个”优先级”，在处理的时候，首先处理优先级最高的。如果两个元素具有相同的优先级，则按照他们插入到队列中的先后顺序处理。
 优先级队列可以通过链表，数组，堆或者其他数据结构实现。
 */

//二叉堆
/*
 二叉堆是一个近似完全二叉树的结构，并同时满足堆积的性质：即子结点的键值或索引总是小于（或者大于）它的父节点。 有了这一性质，那么二叉堆上最大值就是根节点了。
 */

void swim(int *array, int k)
{
    while (k > 1 && array[k] > array[k/2])
    {
        swap(array, k, k/2);
        k = k/2;
    }
}

void insert2array(int *array, int s, int len)
{
    //将元素添加到数组末尾
    array[++len] = s;
    //然后让该元素从下至上重建堆
    swim(array, len);
}

//下沉
void sink(int *array, int k, int len)
{
    while (2*k < len)
    {
        int j = 2*k;
        //去左右子节点中，稍大的那个元素做比较
        if (array[j] < array[j+1]) j++;
        //如果父节点比这个较大的元素还大，表示满足要求，退出
        if (array[k] > array[j]) break;
        //否则，与子节点进行交换
        swap(array, k, j);
        k = j;
    }
}

int delMax(int *array, int len)
{
    int max = array[1];
    swap(array, 1, len--);
    sink(array, 1, len);
    array[len + 1] = 0x0;
//    deleteLast(array, (len + 1));
    
    return max;
}

@end
