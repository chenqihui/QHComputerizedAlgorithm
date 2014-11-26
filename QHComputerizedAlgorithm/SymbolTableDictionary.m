//
//  SymbolTableDictionary.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-26.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "SymbolTableDictionary.h"

//浅谈算法和数据结构（6）：符号表及其基本实现---http://blog.jobbole.com/79303/
/*
 在开始介绍查找算法之前，我们需要定义一个名为符号表（Symbol Table）的抽象数据结构，该数据结构类似我们再C#中使用的Dictionary，他是对具有键值对元素的一种抽象，每一个元素都有一个key和value，我们可以往里面添加key，value键值对，也可以根据key来查找value。在现实的生活中，我们经常会遇到各种需要根据key来查找value的情况，比如DNS根据域名查找IP地址，图书馆根据索引号查找图书等等：
 */
@implementation SymbolTableObject

- (instancetype)initWithKey:(NSString *)key value:(NSString *)value
{
    self = [super init];
    if (self)
    {
        self.key = key;
        self.value = value;
    }
    return self;
}

@end

@interface SymbolTableDictionary ()
{
    NSMutableArray *_arData;
}

@end

@implementation SymbolTableDictionary

- (void)initData
{
    _arData = [NSMutableArray new];
}

- (void)runing
{
    NSArray *ar = @[@"hello", @"Jiayou", @"Aoa", @"87", @"json", @"123", @"125", @"Girl", @"apple"];
    [ar enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop)
    {
        SymbolTableObject *insertObj = [[SymbolTableObject alloc] initWithKey:obj value:obj];
        [self insertSort:insertObj];
    }];
    
    [_arData enumerateObjectsUsingBlock:^(SymbolTableObject *obj, NSUInteger idx, BOOL *stop)
    {
        NSLog(@"%@", obj.key);
    }];
    
    NSString *result = [self bnarySearchSymbolTable:@"apple" searchFrom:0 end:_arData.count - 1];
    NSLog(@"%@", result);
    result = [self bnarySearchSymbolTable:@"466" searchFrom:0 end:_arData.count - 1];
    NSLog(@"%@", result);
}

- (void)insert:(SymbolTableObject *)insertObj
{
    for (int i = 0; i < _arData.count; i++)
    {
        SymbolTableObject *obj = [_arData objectAtIndex:i];
        if ([obj.key isEqualToString:insertObj.key])
        {
            [_arData replaceObjectAtIndex:i withObject:insertObj];
            return;
        }
    }
    [_arData addObject:insertObj];
}

//无序查找
- (id)getValueByKey:(id)key
{
    for (int i = 0; i < _arData.count; i++)
    {
        SymbolTableObject *obj = [_arData objectAtIndex:i];
        if ([obj.key isEqualToString:key])
        {
            return obj.value;
        }
    }
    return nil;
}

//进行排序，再通过二分查找

//插入排序
- (void)insertSort:(SymbolTableObject *)insertObj
{
    BOOL bInsert = NO;
    for (int i = 0; i < _arData.count; i++)
    {
        SymbolTableObject *obj = [_arData objectAtIndex:i];
        if ([(NSString *)obj.key compare:(NSString *)insertObj.key options:NSLiteralSearch] == NSOrderedDescending)
        {
            [_arData insertObject:insertObj atIndex:i];
            bInsert = YES;
        }else if ([(NSString *)obj.key compare:(NSString *)insertObj.key options:NSLiteralSearch] == NSOrderedSame)
        {
            [_arData insertObject:insertObj atIndex:i];
            bInsert = YES;
        }
        if (bInsert)
            return;
    }
    if (bInsert == NO)
        [_arData addObject:insertObj];
}

- (NSString *)bnarySearchSymbolTable:(NSString *)key searchFrom:(int)from end:(int)end
{
    int mid = (end + from)/2;
    SymbolTableObject *obj = (SymbolTableObject *)[_arData objectAtIndex:mid];
    NSString *value = nil;
    
    //当区间长度为1时，只需比较这个值是否一样
    if (end - from == 1)
    {
        if ([(NSString *)obj.key compare:key] == NSOrderedSame)
        {
            value = (NSString *)obj.value;
        }
    }else
    {
        //多个值，二分查找
        if ([(NSString *)obj.key compare:key] == NSOrderedSame)
        {
            value = (NSString *)obj.value;
        }else if ([(NSString *)obj.key compare:key] == NSOrderedAscending)// a < b
        {
            value = [self bnarySearchSymbolTable:key searchFrom:mid end:end];
        }else
        {
            value = [self bnarySearchSymbolTable:key searchFrom:from end:mid];
        }
    }
    return value;
}

@end
