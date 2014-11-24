//
//  BasicSortAlgorithms.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14/11/23.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "BasicSortAlgorithms.h"

@implementation BasicSortAlgorithms

- (void)initData
{
}

- (void)runing
{
    int a1[]={13,0,5,8,1,7,21,50,9,2};
    shell(a1, 10);
    show(a1, 10);
}

//一 选择排序
//选择法循环过程与冒泡法一致，它还定义了记号k=i,然后依次把a[k]同后面元素比较，若a[k]>a[j],则使k=j.最后看看k=i是否还成立，不成立则交换a[k],a[i],这样就比冒泡法省下许多无用的交换，提高了效率。

/// <summary>
/// 选择排序
/// </summary>
/// <param name="array"></param>
void choise(int *a,int n)
{
    int i,j,min;
    
    for(i=0;i<n-1;i++)
    {
        min=i; /*给记号赋值*/
        
        //从第i+1个元素开始，找最小值
        for(j=i+1;j<n;j++)
            if(a[min]>a[j])
                min=j; /*是k总是指向最小元素*/
        
        if(i!=min)
        { /*当k!=i是才交换，否则a[i]即为最小*/
            swap(a, i, min);
        }
    }
}

//二 插入排序
//插入法是一种比较直观的排序方法。它首先把数组头两个元素排好序，再依次把后面的元素插入适当的位置。把数组元素插完也就完成了排序。

void insert(int *a,int n)
{
    int i,j,temp;
    //从第二个元素开始
    for(i=1;i<n;i++)
    {
        temp=a[i]; /*temp为要插入的元素*/
        
        j=i-1;
        
        while(j>=0&&temp<a[j]) { /*从a[i-1]开始找比a[i]小的数，同时把数组元素向后移*/
            a[j+1]=a[j];
            j--;
        }
        a[j+1]=temp; /*插入*/
    } 
    
}
void insert2(int *array,int n)
{
    //从第二个元素开始
    for(int i=1;i<n;i++)
    {
        //从第i个元素开始，一次和前面已经排好序的i-1个元素比较，如果小于，则交换
        for (int j = i; j > 0; j--)
        {
            if (array[j] < array[j - 1])
            {
                swap(array, j, j - 1);
            }else//如果大于，则不用继续往前比较了，因为前面的元素已经排好序，比较大的大就是教大
                break;
        }
    }
    
}

//三 希尔排序(Shell Sort)
//shell法是一个叫 shell 的美国人与1969年发明的。它首先把相距k(k>=1)的那几个元素排好序，再缩小k值（一般取其一半），再排序，直到k=1时完成排序。下面让我们来分析其代码：
/*
 1. 希尔排序的关键在于步长递减序列的确定，任何递减至1步长的序列都可以，目前已知的比较好的序列有：
 
 Shell’s 序列: N/2 , N/4 , …, 1 (重复除以2);
 Hibbard’s 序列: 1, 3, 7, …, 2k - 1 ;
 Knuth’s 序列: 1, 4, 13, …, (3k - 1) / 2 ;该序列是本文代码中使用的序列。
 已知最好的序列是 Sedgewick’s (Knuth的学生，Algorithems的作者)的序列: 1, 5, 19, 41, 109, ….
 */
void shell(int *a, int n)
{
    int i,j,k,x;
    k=n/2; /*间距值*/
    
    while(k>=1)
    {
        for(i=k;i<n;i++)
        {
            x=a[i];
            j=i-k;
//            printf("%d",j);printf("\n");
            while(j>=0 && x<a[j])
            {
                a[j+k]=a[j];
                j-=k; 
            }
            a[j+k]=x;
        } 
        
        k/=2; /*缩小间距值*/
    }
}

void shell2(int *array, int len)
{
    int n = len;
    int h = 1;
    //初始最大步长
    while (h < n / 3) h = h * 3 + 1;
    while (h >= 1)
    {
        //从第二个元素开始
        for (int i = 1; i < n; i++)
        {
            //从第i个元素开始，依次次和前面已经排好序的i-h个元素比较，如果小于，则交换
            for (int j = i; j >= h; j = j - h)
            {
                if (array[j] < array[j - h])
                {
                    swap(array, j, j - h);
                }
                else//如果大于，则不用继续往前比较了，因为前面的元素已经排好序，比较大的大就是教大的了。
                    break;
            }
        }
        //步长除3递减
        h = h / 3;
    }
}

@end
