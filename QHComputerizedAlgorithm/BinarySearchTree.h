//
//  BinarySearchTree.h
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-26.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "BasicAlgorithmsAndDataStructuresObject.h"

@interface BinarySearchTreeObject : NSObject

@property (nonatomic, strong) id key;
@property (nonatomic, strong) id value;
@property (nonatomic, assign) int number;

@property (nonatomic, assign) BinarySearchTreeObject *leftObj;
@property (nonatomic, assign) BinarySearchTreeObject *rightObj;

- (instancetype)initWithKey:(NSString *)key value:(NSString *)value number:(int)number;

@end

@interface BinarySearchTree : BasicAlgorithmsAndDataStructuresObject

@property (nonatomic, assign) BinarySearchTreeObject *midObj;

@end
