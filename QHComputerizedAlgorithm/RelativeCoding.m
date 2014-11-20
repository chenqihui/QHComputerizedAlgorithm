//
//  RelativeCoding.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-20.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "RelativeCoding.h"

/*
 计算机算法：数据压缩之相对编码（4）：http://blog.jobbole.com/79761/
 */
@implementation RelativeCoding

/*
 相对编码
 相对编码是另一种数据压缩算法。游程编码、位图编码以及图编码和模式替换都基于减少重复数据实现，而相对编码目标略有不同。
 
 exp：
 96,97,98,99,100,101,102,103,999,1000,1001,1002
 某基准值附近的相对值分组将会更加方便。
 (-4,-3,-2,-1,100,1,2,3)(-1,1000,1,2)
 
 关键在于找出基准值，得到它与其他数据直接的相对关系。
 */
- (void)initCodeData
{
}

- (void)runingCode
{
    [self encode];
}

- (NSString *)encode
{
    _code = @"[1991,1991,1999,1998,1999,1998,1995,1997,1994,1993]";//JSON:
    NSArray *ar = [NSJSONSerialization JSONObjectWithData:[_code dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    
    int base = [[ar objectAtIndex:0] intValue];//假设以第一个为基准值
    NSMutableArray *arEncode = [NSMutableArray arrayWithCapacity:ar.count];
    [arEncode addObject:[ar objectAtIndex:0]];
    for (int i = 1; i < ar.count; i++)
    {
        NSNumber *obj = [ar objectAtIndex:i];
        NSNumber *result = [NSNumber numberWithInt:([obj intValue] - base)];
        [arEncode addObject:result];
    }
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arEncode
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    _encode = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", _encode);// JSON: [1991,0,8,7,8,7,4,6,3,2]
    
    return _encode;
}

@end
