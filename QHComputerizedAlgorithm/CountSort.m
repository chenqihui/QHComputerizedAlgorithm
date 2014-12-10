//
//  CountSort.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-12-10.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "CountSort.h"

//算法系列：计数排序--http://blog.jobbole.com/74574/
/*
 1.初始化一个计数数组，大小是输入数组中的最大的数。
 2.遍历输入数组，遇到一个数就在计数数组对应的位置上加一。例如：遇到5，就将计数数组第五个位置的数加一。
 3.把计数数组直接覆盖到输出数组（节约空间）。
 */

@implementation CountSort

- (void)initData
{
}

- (void)runing
{
    int test1[] = {2, 6, 4, 3, 2, 3, 4, 6, 3, 4, 3, 5, 2, 6};
    int size1 = 14;
    
    countingSort(test1, size1);
    
    int test2[] = {5, 6, 7, 8, 5};
    int size2 = 5;
    
    countingSort(test2, size2);
    
//    int test3[] = {8, 1, 2, 3, 3, 4};
//    int size3 = 6;
//    
//    countingSort(test3, size3);
}

void printArray(int * array, int size)
{
    
    int curr;
    for(curr = 0; curr < size; curr++)
    {
        printf("%d, ", array[curr]);
    }
    printf("\n");
}

int maximum(int * array, int size)
{
    int curr = 0;
    int max = 0;
    
    for(curr = 0; curr < size; curr++)
    {
        if(array[curr] > max)
        {
            max = array[curr];
        }
    }
    
    return max;
}

void countingSort(int * array, int size){
    
    int curr = 0;
    //1.输入{3, 4, 3, 2, 1}，最大是4，数组长度是5
    int max = maximum(array, size);
    //2.建立计数数组{0, 0, 0, 0}。
    int * counting_array = calloc((max+1),sizeof(int)); // Zeros out the array
    //3.遍历输入数组：
    for(curr = 0; curr < size; curr ++)
    {
        //4.计数数组现在是{1, 1, 2, 1}，我们现在把它写回到输入数组里：
        counting_array[array[curr]]++;
    }
    printArray(counting_array, max+1);
    
    int num = 0;
    curr = 0;
    
    //5.这样就排好序了。
    while(curr <= max)
    {
        while(counting_array[num] > 0)
        {
            array[curr] = num;
            counting_array[num]--;
            curr++;
            if(curr > size)
            {
                break;
            }
        }
        num++;
    }
    printArray(array, size);
}

@end
