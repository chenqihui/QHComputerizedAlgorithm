//
//  RedBlackTree.h
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-27.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "BasicAlgorithmsAndDataStructuresObject.h"

@interface RedBlackTreeObject : NSObject

@property (nonatomic, strong) id key;
@property (nonatomic, strong) id value;
@property (nonatomic, assign) int number;
@property (nonatomic, assign) int color;//red为1，black为0

@property (nonatomic, strong) RedBlackTreeObject *leftObj;
@property (nonatomic, strong) RedBlackTreeObject *rightObj;

- (instancetype)initWithKey:(NSString *)key value:(NSString *)value number:(int)number color:(int)color;

- (BOOL) isRed;

@end

@interface RedBlackTree : BasicAlgorithmsAndDataStructuresObject
{
    RedBlackTreeObject* root;
}

@end
