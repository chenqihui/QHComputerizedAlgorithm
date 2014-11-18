//
//  BitMapCode.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-18.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "BitMapCode.h"

@implementation BitMapCode

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _code = @"aazahalavaatalawacamaahakafaaaqaaaiauaacaaxaauaxaaaaaapaayatagaaoafaawayazavaaaazaaabararaaaaakakaaqaarazacajaazavanazaaaeanaaoajauaaaaaxalaraaapabataaavaaab";
    }
    return self;
}

- (void)runingCode
{
//    unsigned long long temp = powf(2, 100);

    [self encode];
}

/*
 字符串有太多重复元素组成，尽管不是一个接着另一个。我可以使用位图压缩该字符串。也就是说我们可以使用序列中的位来保存给定元素出现的位置，这个序列可以简单地转换成一个十进制值。上例中的字符串“abababababababab”可以压缩成“1010101010101010”，即十进制数43690，甚至表示成十六进制的AAAA更好。由此这个长字符串就被压缩了。当解压（解码）消息时，我们再从十进制/十六进制转化成二进制，匹配字符的出现次数。
 */
- (NSString *)encode
{
    int i = 0;
    NSMutableString *bits = [NSMutableString new];
    NSMutableString *rest = [NSMutableString new];
    for (; i < _code.length; i++)
    {
        NSString *code = [NSString stringWithFormat:@"%c", [_code characterAtIndex:i]];
        if ([code isEqualToString:@"a"])
        {
            [bits appendString:[NSString stringWithFormat:@"%d", 1]];
        }else
        {
            [bits appendString:[NSString stringWithFormat:@"%d", 0]];
            [rest appendString:code];
        }
    }
//    NSLog(@"%@%@", bits, rest);
    
    long long v = [self toDecimalSystemWithBinarySystem:bits];
    NSLog(@"%lld%@", v, rest);//数值太多无法显示
    return nil;
}

- (NSString *)dencode
{
    return nil;
}

- (unsigned long long)toDecimalSystemWithBinarySystem:(NSString *)binary
{
    unsigned long long ll = 0 ;
    unsigned long long temp = 0 ;
    for (int i = 0; i < binary.length; i ++)
    {
        temp = [[binary substringWithRange:NSMakeRange(i, 1)] intValue];
        temp = temp * powf(2, binary.length - i - 1);
        ll += temp;
    }
    
    NSString * result = [NSString stringWithFormat:@"%lld",ll];
    
    return [result longLongValue] ;
    
}

@end
