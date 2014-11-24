//
//  QuickSort.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14/11/24.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "QuickSort.h"

//浅谈算法和数据结构（4）：快速排序----http://blog.jobbole.com/79298/
/*
 里面海介绍了划分寻找中间值的函数
 */
@implementation QuickSort

- (void)initData
{
}

- (void)runing
{
    int a1[]={13,0,5,8,1,7,21,50,9,2};
    quick(a1, 0, 10 - 1);
    show(a1, 10);
    
    printf("====================================\n");
    
    int a2[]={13,0,5,8,1,7,21,50,9,2};
    quick2(a2, 0, 10 - 1);
    show(a2, 10);
}

//快速法定义了三个参数，（数组首地址*a,要排序数组起始元素下标i,要排序数组结束元素下标j). 它首先选一个数组元素（一般为a[(i+j)/2],即中间元素）作为参照，把比它小的元素放到它的左边，比它大的放在右边。然后运用递归，在将它左，右两个子数组排序，最后完成整个数组的排序。下面分析其代码：

void quick(int *a,int i,int j)
{
    int m,n,temp;
    int k;
    m=i;
    n=j;
    k=a[(i+j)/2]; /*选取的参照*/
    
    do
    {
        while(a[m]<k&&m<j) m++; /* 从左到右找比k大的元素*/
        
        while(a[n]>k&&n>i) n--; /* 从右到左找比k小的元素*/
        
        if(m<=n) { /*若找到且满足条件，则交换*/
            
            temp=a[m];
            a[m]=a[n];
            a[n]=temp; 
            
            m++;
            n--;
        }
    }while(m<=n); 
    
    if(m<j) quick(a,m,j); /*运用递归*/ 

    if(n>i) quick(a,i,n);
}

/// <summary>
/// 快速排序中的划分过程
/// </summary>
/// <param name="array">待划分的数组</param>
/// <param name="lo">最左侧位置</param>
/// <param name="hi">最右侧位置</param>
/// <returns>中间元素位置</returns>
int partition(int *array, int lo, int hi)
{
    int i = lo, j = hi + 1;
    while (true)
    {
        //从左至右扫描，如果碰到比基准元素array[lo]小，则该元素已经位于正确的分区，i自增，继续比较i+1；
        //否则，退出循环，准备交换
        while (array[++i] < array[lo])
        {
            //如果扫描到了最右端，退出循环
            if (i == hi) break;
        }
        
        //从右自左扫描，如果碰到比基准元素array[lo]大，则该元素已经位于正确的分区，j自减，继续比较j-1
        //否则，退出循环，准备交换
        while (array[--j] > array[lo])
        {
            //如果扫描到了最左端，退出循环
            if (j == lo) break;
        }
        
        //如果相遇，退出循环
        if (i >= j) break;
        
        //交换左a[i],a[j]右两个元素，交换完后他们都位于正确的分区
        swap(array, i, j);
    }
    //经过相遇后，最后一次a[i]和a[j]的交换
    //a[j]比a[lo]小，a[i]比a[lo]大，所以将基准元素与a[j]交换
    swap(array, lo, j);
    //返回扫描相遇的位置点
    return j;
}

void quick2(int *array, int lo, int hi)
{
    //如果子序列为1，则直接返回
    if (lo >= hi) return;
    //划分，划分完成之后，分为左右序列，左边所有元素小于array[index]，右边所有元素大于array[index]
    int index = partition(array, lo, hi);
    
    //对左右子序列进行排序完成之后，整个序列就有序了
    //对左边序列进行递归排序
    quick2(array, lo, index - 1);
    //对右边序列进行递归排序
    quick2(array, index + 1, hi);
}

@end
