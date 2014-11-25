//
//  BasicAlgorithmsAndDataStructuresObject.h
//  QHComputerizedAlgorithm
//
//  Created by chen on 14/11/23.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicAlgorithmsAndDataStructuresObject : NSObject

- (void)initData;

- (void)runing;

void swap(int *array, int i, int j);

void show(int *array, int len);

void deleteLast(int *array, int len);

@end
