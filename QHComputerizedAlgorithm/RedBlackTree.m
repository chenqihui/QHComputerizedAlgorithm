//
//  RedBlackTree.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-27.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "RedBlackTree.h"

//浅谈算法和数据结构（9）：平衡查找树之红黑树---http://blog.jobbole.com/79309/
/*
 红黑树中将节点之间的链接分为两种不同类型，红色链接，他用来链接两个2-nodes节点来表示一个3-nodes节点。黑色链接用来链接普通的2-3节点。特别的，使用红色链接的两个2-nodes来表示一个3-nodes节点，并且向左倾斜，即一个2-node是另一个2-node的左子节点。这种做法的好处是查找的时候不用做任何修改，和普通的二叉查找树相同。
 */
@implementation RedBlackTreeObject

- (instancetype)initWithKey:(NSString *)key value:(NSString *)value number:(int)number color:(int)color
{
    self = [super init];
    if (self)
    {
        self.key = key;
        self.value = value;
        self.number = number;
        self.color = color;
    }
    return self;
}

- (BOOL) isRed
{
    if (self.color == 1) return YES;
    return NO;
}

@end

@interface RedBlackTree ()
{
    NSMutableArray *_arData;
}

@end

@implementation RedBlackTree

- (void)initData
{
    _arData = [NSMutableArray new];
}

- (void)runing
{
    NSArray *ar = @[@"hello", @"Jiayou", @"Aoa", @"87", @"json", @"123", @"125", @"Girl", @"apple"];
    ar = @[@"hello", @"Jiayou", @"Aoa"];
    [ar enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop)
     {
         [self PutKey:obj value:[NSString stringWithFormat:@"%@%d", obj, idx]];
     }];
//    for (int idx = 0; idx < ar.count; idx++)
//    {
//        NSString *obj = [ar objectAtIndex:idx];
//        [self PutKey:obj value:[NSString stringWithFormat:@"%@%d", obj, idx]];
//    }
    
    RedBlackTreeObject *jiayou = root;
    NSLog(@"%@--%d", jiayou.value, jiayou.color);
    NSLog(@"%@--%d", jiayou.leftObj.value, jiayou.leftObj.color);
    NSLog(@"%@--%d", jiayou.rightObj.value, jiayou.rightObj.color);
    
//    RedBlackTreeObject *hello = [_arData objectAtIndex:0];
//    NSLog(@"%@--%d", hello.value, hello.color);
//    NSLog(@"%@--%d", hello.leftObj.value, hello.color);
//    NSLog(@"%@--%d", hello.rightObj.value, hello.color);
}

//查找获取指定的值，与二叉树查找一样
- (NSString*) Get:(NSString*)key
{
    return [self GetValueNode:root key:key];
}

- (NSString*) GetValueNode:(RedBlackTreeObject*)node key:(NSString*)key
{
    if (node == nil) return nil;
    NSComparisonResult cmp = [key compare:node.key];
    if (cmp == NSOrderedSame) return node.value;
    else if (cmp == NSOrderedDescending) return [self GetValueNode:node.rightObj key:key];
    else return [self GetValueNode:node.leftObj key:key];
}

//左旋转
- (RedBlackTreeObject*) RotateLeft:(RedBlackTreeObject*)h
{
    RedBlackTreeObject *x = h.rightObj;
    //将x的左节点复制给h右节点
    h.rightObj = x.leftObj;
    //将h复制给x右节点
    x.leftObj = h;
    
    x.color = h.color;
    h.color = 1;
    return x;
}

//右旋转
- (RedBlackTreeObject*) RotateRight:(RedBlackTreeObject*)h
{
    RedBlackTreeObject *x = h.leftObj;
    h.leftObj = x.rightObj;
    x.rightObj = h;
    
    x.color = h.color;
    h.color = 1;
    return x;
}

- (RedBlackTreeObject*)FlipColor:(RedBlackTreeObject*)h
{
    h.color = 1;
    h.leftObj.color = 0;
    h.rightObj.color = 0;
    return h;
}

/*
 具体操作方式如下：
 
 如果节点的右子节点为红色，且左子节点位黑色，则进行左旋操作
 如果节点的左子节点为红色，并且左子节点的左子节点也为红色，则进行右旋操作
 如果节点的左右子节点均为红色，则执行FlipColor操作，提升中间结点。
 */
- (void) PutKey:(NSString*)key value:(NSString*)value
{
    root = [self Put:root key:key value:value];
    root.color = 0;
    [_arData addObject:root];
}

- (RedBlackTreeObject*) Put:(RedBlackTreeObject*)h key:(NSString*)key value:(NSString*)value
{
    if (h == nil) return [[RedBlackTreeObject alloc] initWithKey:key value:value number:1 color:1];
    NSComparisonResult cmp = [key compare:h.key];
    if (cmp == NSOrderedAscending) h.leftObj = [self Put:h.leftObj key:key value:value];
    else if (cmp == NSOrderedDescending) h.rightObj = [self Put:h.rightObj key:key value:value];
    else h.Value = value;
    
    //平衡化操作
    if ([h.rightObj isRed] && ![h.leftObj isRed]) h = [self RotateLeft:h];
    if ([h.leftObj isRed] && [h.leftObj.leftObj isRed]) h = [self RotateRight:h];
    if ([h.leftObj isRed] && [h.rightObj isRed]) h = [self FlipColor:h];
    
    h.number = [self Size:h.leftObj] + [self Size:h.rightObj] + 1;
    return h;
}

- (int) Size:(RedBlackTreeObject*)node
{
    if (node == nil) return 0;
    return node.number;
}

@end
