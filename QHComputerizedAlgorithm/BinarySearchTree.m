//
//  BinarySearchTree.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-26.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "BinarySearchTree.h"

//浅谈算法和数据结构（7）：二叉查找树---http://blog.jobbole.com/79305/
/*
 指一棵空树或者具有下列性质的二叉树：
 
 1. 若任意节点的左子树不空，则左子树上所有结点的值均小于它的根结点的值；
 
 2. 若任意节点的右子树不空，则右子树上所有结点的值均大于它的根结点的值；
 
 3. 任意节点的左、右子树也分别为二叉查找树。
 
 4. 没有键值相等的节点（no duplicate nodes）。
 */
@implementation BinarySearchTreeObject

- (instancetype)initWithKey:(NSString *)key value:(NSString *)value number:(int)number
{
    self = [super init];
    if (self)
    {
        self.key = key;
        self.value = value;
        self.number = number;
    }
    return self;
}

@end

@interface BinarySearchTree ()
{
    NSMutableArray *_arData;
}

@end

@implementation BinarySearchTree

- (void)initData
{
    _arData = [NSMutableArray new];
}

- (void)runing
{
    NSArray *ar = @[@"hello", @"Jiayou", @"Aoa", @"87", @"json", @"123", @"125", @"Girl", @"apple"];
    [ar enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop)
     {
         BinarySearchTreeObject *insertObj = [[BinarySearchTreeObject alloc] initWithKey:obj value:[NSString stringWithFormat:@"%@%d", obj, idx] number:1];
         [self insert:insertObj];
     }];
    
//    [_arData enumerateObjectsUsingBlock:^(BinarySearchTreeObject *obj, NSUInteger idx, BOOL *stop)
//     {
//         NSLog(@"%@-->%d", obj.key, obj.number);
//         NSLog(@"%@-->%d", obj.leftObj.key, obj.number);
//         NSLog(@"%@-->%d", obj.rightObj.key, obj.number);
//     }];
    
    NSString *result = [self binarySearch:@"apple"];
    NSLog(@"%@", result);
}

- (void)insert:(BinarySearchTreeObject *)insertObj
{
    if (_arData.count != 0)
    {
        BinarySearchTreeObject *midObj = [_arData objectAtIndex:0];
        [self insert:insertObj superObj:midObj left:-1];
    }
    [_arData addObject:insertObj];
}

- (void)insert:(BinarySearchTreeObject *)insertObj superObj:(BinarySearchTreeObject *)superObj left:(int)bLeft
{
    BinarySearchTreeObject *midObj;
    if (bLeft != -1)
    {
        if (bLeft)
            midObj = superObj.leftObj;
        else
            midObj = superObj.rightObj;
    }
    
    if (midObj == nil)
    {
        if (bLeft)
            superObj.leftObj = insertObj;
        else
            superObj.rightObj = insertObj;
        
        superObj.number = superObj.rightObj.number + superObj.leftObj.number + 1;
    }else
    {
        if ([midObj.key compare:insertObj.key options:NSLiteralSearch] == NSOrderedAscending)
        {
            [self insert:insertObj superObj:midObj left:NO];
        }else if ([midObj.key compare:insertObj.key options:NSLiteralSearch] == NSOrderedDescending)
        {
            [self insert:insertObj superObj:midObj left:YES];
        }else
        {
            midObj.key = insertObj.key;
            midObj.value = insertObj.value;
            midObj.number = midObj.rightObj.number + midObj.leftObj.number + 1;
        }
    }
}

- (NSString *)binarySearch:(NSString *)key
{
    NSString *resultKey = nil;
    
    if (_arData.count != 0)
    {
        BinarySearchTreeObject *midObj = [_arData objectAtIndex:0];
        resultKey = [self search:key compareObj:midObj];
    }
    
    return resultKey;
}

//二叉树查找----递归
- (NSString *)search:(NSString *)key compareObj:(BinarySearchTreeObject *)compareObj
{
    NSString *resultKey = nil;
    if ([compareObj.key compare:key options:NSLiteralSearch] == NSOrderedAscending)
    {
        if (compareObj.rightObj != nil)
            resultKey = [self search:key compareObj:compareObj.rightObj];
    }else if ([compareObj.key compare:key options:NSLiteralSearch] == NSOrderedDescending)
    {
        if (compareObj.leftObj != nil)
            resultKey = [self search:key compareObj:compareObj.leftObj];
    }else
    {
        resultKey = compareObj.value;
    }
    return resultKey;
}

@end
