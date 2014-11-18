//
//  GameEncodeViewController.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-18.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "RunCoding.h"

@interface RunCoding ()

@end

/*
 计算机算法：数据压缩之游程编码：http://blog.jobbole.com/79758/
 */
@implementation RunCoding

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _code = @"aaaaaaaaaabbbaxxxxyyyzyx";
    }
    return self;
}

- (void)runingCode
{
    [self encodeOne];
    [self encodeTwo];
    [self encodeThree];
}

/*
 该算法的实现是用当前数据元素以及该元素连续出现的次数来取代字符串中连续出现的数据部分。具体实现我们通过一个字符串实例来说明。
 
 aaaaaaaaaabbbaxxxxyyyzyx
 字符串长度为24，我们可以看到字符串中有很多的重复部分。使用游程算法，我们用较短的字符串后加一个计数值来替换游程对象。

 a10b3a1x4y3z1y1x1
 此时字符串长度为17，大约是初始字符串长度的70%。很明显，这并不是压缩给定字符串的最佳方式。例如当字符仅出现一次时，我们并不需要其后添加“1”。
 */
- (NSString *)encodeOne
{
    int i = 0, j = 0;
    NSString *prev;
    NSMutableString *output = [NSMutableString new];
    for (; i < _code.length; i++)
    {
//        NSLog(@"%c", [_code characterAtIndex:i]);
        NSString *code = [NSString stringWithFormat:@"%c", [_code characterAtIndex:i]];
        if (![code isEqualToString:prev])
        {
            if (prev != nil)
                [output appendString:[NSString stringWithFormat:@"%d", j]];
            prev = code;
            [output appendString:code];
            j = 0;
        }
        j++;
    }
    
    NSLog(@"%@", output);//a10b3a1x4y3z1y1x
    return output;
}

/*
 在某些情况下，这种方式会增加初始字符串的长度，而这违反了我们的初衷。这样我们得到的字符串如下。
 
 a10b3ax4y3zyx
 此时字符串长度为13，是初始长度的54%！
 */
- (NSString *)encodeTwo
{
    int i = 0, j = 0;
    NSString *prev;
    NSMutableString *output = [NSMutableString new];
    for (; i < _code.length; i++)
    {
        NSString *code = [NSString stringWithFormat:@"%c", [_code characterAtIndex:i]];
        if (![code isEqualToString:prev])
        {
            if (prev != nil && j > 1)
                [output appendString:[NSString stringWithFormat:@"%d", j]];
            prev = code;
            [output appendString:code];
            j = 0;
        }
        j++;
    }
    
    NSLog(@"%@", output);//a10b3ax4y3zyx
    return output;
}

/*
 上面例子的一个变种是不对字符保持计数，而是对位置进行计数。这样原始字符串可以被压缩成下面这样。
 
 a0b10a13x14y18z21y22x23
 */
- (NSString *)encodeThree
{
    int i = 0;
    NSString *prev;
    NSMutableString *output = [NSMutableString new];
    for (; i < _code.length; i++)
    {
        NSString *code = [NSString stringWithFormat:@"%c", [_code characterAtIndex:i]];
        if (![code isEqualToString:prev])
        {
            prev = code;
            [output appendString:code];
            [output appendString:[NSString stringWithFormat:@"%d", i]];
        }
    }
    
    NSLog(@"%@", output);//a0b10a13x14y18z21y22x23
    return output;
}

//总结：
/*
 使用这两种方式中的哪一个取决于我们的目标。第二种情况下，我们能够实现二分查找的优化。
 
 显然，这个算法不仅适用于字符串。对数组也能取得很好的结果。一个典型的例子是服务器和客户机之间字符对象(JSON)的传输。特别是如果有大量重复数据序列的存在，我们能获取很好的压缩结果。
 */

- (NSString *)dencode
{
    return nil;
}

@end
