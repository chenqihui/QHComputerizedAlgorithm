//
//  PrefixionCode.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14/11/21.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "PrefixionCode.h"

/*
 计算机算法：数据压缩之前缀编码（5）：http://blog.jobbole.com/79757/
 */
@implementation PrefixionCode

/*
 前缀编码，有时也被称为前向编码，是另一个通过移除冗余数据来降低数据量的算法。
 
 通常会忽略年份的前两个数字，例如我们通常不会写1995或1996，而是使用更短的——‘95’和‘96’。这样年份就被编码成更短的字符串。
 input: (1991, 1992, 1993, 1994, 1995, 1996)
 output: (91, 92, 93, 94, 95, 96)
 
 可以使用一些特殊标识和前缀一起编码。
 input: (1998, 1992, 1932, 1924, 2001, 2012)
 output: (#19, 98, 92, 32, 24, #20, 01, 12)
 一旦解码器读到#字符，它就知道下面的数为前缀。
 */
/*
 后缀编码和前缀编码几乎相同，区别在于编码重复后缀。
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
    NSArray *ar = @[@"use", @"used", @"useful", @"usefully", @"usefulness", @"useless", @"uselessly", @"uselessness"];
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [ar enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop)
     {
         [dic setObject:obj forKey:[NSString stringWithFormat:@"%d", idx]];
    }];
    for (int i = 0; i < ar.count - 1; i++)
    {
        NSString *key;
        NSString *value;
        key = [NSString stringWithFormat:@"%d", i];
        value = [dic objectForKey:key];
        NSLog(@"%@,%@", key, value);
        
        for (int j = i + 1; j < ar.count; j++)
        {
            NSString *obj = [dic objectForKey:[NSString stringWithFormat:@"%d", j]];
            NSRange range = [obj rangeOfString:value];//判断字符串是否包含
            if (range.location != NSNotFound)
            {
                obj = [obj stringByReplacingOccurrencesOfString:value withString:key];
            }
            [dic setObject:obj forKey:[NSString stringWithFormat:@"%d", j]];
        }
    }
    
    NSLog(@"%@", dic);
    return nil;
}

@end
