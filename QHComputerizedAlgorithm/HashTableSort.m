//
//  HashTableSort.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-28.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "HashTableSort.h"

#import "StackAndQueue.h"

//浅谈算法和数据结构（11）：哈希表---http://blog.jobbole.com/79261/
/*
 哈希表就是一种以 键-值(key-indexed) 存储数据的结构，我们只要输入待查找的值即key，即可查找到其对应的值。
 
 哈希的思路很简单，如果所有的键都是整数，那么就可以使用一个简单的无序数组来实现：将键作为索引，值即为其对应的值，这样就可以快速访问任意键的值。这是对于简单的键的情况，我们将其扩展到可以处理更加复杂的类型的键。
 
 使用哈希查找有两个步骤:
 
 使用哈希函数将被查找的键转换为数组的索引。在理想的情况下，不同的键会被转换为不同的索引值，但是在有些情况下我们需要处理多个键被哈希到同一个索引值的情况。所以哈希查找的第二个步骤就是处理冲突
 处理哈希碰撞冲突。有很多处理哈希碰撞冲突的方法，本文后面会介绍拉链法和线性探测法。
 哈希表是一个在时间和空间上做出权衡的经典例子。如果没有内存限制，那么可以直接将键作为数组的索引。那么所有的查找时间复杂度为O(1)；如果没有时间限制，那么我们可以使用无序数组并进行顺序查找，这样只需要很少的内存。哈希表使用了适度的时间和空间来在这两个极端之间找到了平衡。只需要调整哈希函数算法即可在时间和空间上做出取舍。
 */

/*
 拉链法 (Separate chaining with linked lists)
 
 通过哈希函数，我们可以将键转换为数组的索引(0-M-1)，但是对于两个或者多个键具有相同索引值的情况，我们需要有一种方法来处理这种冲突。
 
 一种比较直接的办法就是，将大小为M 的数组的每一个元素指向一个条链表，链表中的每一个节点都存储散列值为该索引的键值对，这就是拉链法。
 */
@interface SeperateChainingHashSet ()
{
    NSMutableArray *_arSeparateChainingWithLinkedLists;
    int _M;//散列表大小
}

@end

@implementation SeperateChainingHashSet

- (instancetype)init
{
    self = [super init];
    if (self) {
        _arSeparateChainingWithLinkedLists = [NSMutableArray new];
    }
    return self;
}

- (void)put:(NSString *)key value:(NSString*)value
{
    StackLink *stackLink = _arSeparateChainingWithLinkedLists[[self getHashCode:key]];
    Node *node = [[Node alloc] initWithItm:@{key:value}];
    if (stackLink == nil)
    {
        stackLink = [StackLink new];
    }
    [stackLink push:node];
}

- (id)get
{
    return nil;
}

- (NSUInteger)getHashCode:(NSString *)key
{
    return [key hash];
}

@end

/*
 线性探测法
 
 线性探测法是开放寻址法解决哈希冲突的一种方法，基本原理为，使用大小为M的数组来保存N个键值对，其中M>N，我们需要使用数组中的空位解决碰撞冲突。
 */
/*
 开放寻址法中最简单的是线性探测法：当碰撞发生时即一个键的散列值被另外一个键占用时，直接检查散列表中的下一个位置即将索引值加1，这样的线性探测会出现三种结果：
 
 命中，该位置的键和被查找的键相同
 未命中，键为空
 继续查找，该位置和键被查找的键不同
 */
@interface LinearProbingHashSet ()
{
    NSMutableArray *_arLinearProbingHashSet;
    int _M;//散列表大小
}

@end

@implementation LinearProbingHashSet

- (instancetype)init
{
    self = [super init];
    if (self) {
        _arLinearProbingHashSet = [NSMutableArray new];
    }
    return self;
}

- (void)put:(NSString *)key value:(NSString*)value
{
    [self put:[self getHashCode:key] dic:@{key:value}];
}

- (void)put:(NSUInteger)index dic:(NSDictionary *)dic
{
    NSDictionary *oldDic = _arLinearProbingHashSet[index];
    if (oldDic == nil)
    {
        _arLinearProbingHashSet[index] = dic;
    }else
        [self put:++index dic:dic];
}

- (id)get:(NSString *)key
{
    return [self get:[self getHashCode:key] key:key];
}

- (NSDictionary *)get:(NSUInteger)index key:(NSString *)key
{
    NSDictionary *oldDic = _arLinearProbingHashSet[index];
    if (oldDic != nil && [oldDic objectForKey:key] == nil)
    {
        oldDic = [self get:++index key:key];
    }
    return oldDic;
}

- (NSUInteger)getHashCode:(NSString *)key
{
    return [key hash];
}

@end

/*
 以hash做为key有点问题
 */
@interface HashTableSort ()

@end

@implementation HashTableSort

- (void)initData
{
}

- (void)runing
{
    NSString *str = @"hello";
    NSLog(@"%lld", (long long)[str hash]);
}

@end
