//
//  BasicAlgorithmsAndDataStructuresObject.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14/11/23.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "BasicAlgorithmsAndDataStructuresObject.h"

@implementation BasicAlgorithmsAndDataStructuresObject

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initData];
    }
    return self;
}

- (void)initData
{
}

- (void)runing
{
}

void swap(int *array, int i, int j)
{
    int temp=array[i];
    array[i]=array[j];
    array[j]=temp;
}

void show(int *array, int len)
{
    for (int i = 0; i < len; i++)
    {
        printf("%d", array[i]);
        printf("\n");
    }
}

void deleteLast(int *array, int len)
{
    int aux[len-1];
    for (int i = 0; i < len-1; i++)
    {
        aux[i] = array[i];
    }
    array = aux;
}

@end
