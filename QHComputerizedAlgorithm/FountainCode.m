//
//  FountainCode.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14/11/30.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "FountainCode.h"

//超酷算法：喷泉码---http://blog.jobbole.com/78841/

/*
 喷泉码，或者称为“无率码”。喷泉码是将一些数据，例如文件，转化为一个有效的任意数量的编码包的方法，这样只要你接收到稍大于信源数据包数量的编码包的子集，就可以恢复信源数据。换句话说，你创建了一个编码数据的“喷泉”，只要接收端接收到足够的“水滴”，就可以恢复文件，而不管它们接到哪一个遗漏了哪一个。
 
 让喷泉码如此知名的原因是，它允许你在有损连接（比如说因特网）的情况下传输文件，而且传输过程不依赖于你是否知道丢包率，也不需要接收端反馈哪些数据包丢失了。可以看到在很多场景，从通过广播媒介传送一个静态文件，比如点播电视，到在多源并行下载中传播文件包，像BitTorrent那样，喷泉码都得到了很好的应用。
 */

/*
 虽然从根本上喷泉码惊人地简单。它有许多种类，但是在本文中我们只介绍最简单的——LT码，或者Luby变换码。LT码生成编码包的步骤如下：
 
 在 l 和 k 的之间随机选取一个数字 d，d 代表文件中块的数量。我们将会在后面的内容中讨论如何选取最佳的d。
 从文件中随机选取 d 块，并把它们组合起来。这里我们可以用异或运算来组合这些块。
 传送合并的块，同时发送它由哪些块构成的信息。
 
 
 解码的过程有一点复杂，但是没有很复杂：
 
 重建用于生成编码块的源码块列表。
 对于列表中的每一个源码块，如果已经解码了，将它和编码块做异或运算，并且把它从源码块列表中移除。
 如果在列表剩下至少两个源码块，将编码块加入到一个等候区。
 如果在列表中只剩下一个源码块，我们已经成功的把另一个源码块解码了，那么把它加入到已解码文件中，迭代等候列表，重复以上过程直到有编码块包含它。
 */
@implementation FountainCode

- (void)initCodeData
{
}

- (void)runingCode
{
//    NSString *h = @"2D";
//    NSString *enH = [FountainCode hexStringFromString:h];
//    NSLog(@"%@", enH);
//
//    NSString *hashCode = @"48";
//    NSString *hashE = @"2D";
//    int r = [hashE intValue]^[hashCode intValue];
//    NSLog(@"%d", r);
//    
    NSArray *arEncode = @[@"48", @"2D", @"24", @"66", @"03"];
    NSMutableArray *arDencode = [NSMutableArray new];
    [arDencode addObject:@"48"];
    NSArray *arHasHCode = @[@[@0], @[@0], @[@0], @[@1,@2,@4], @[@3,@4]];
    
    NSMutableArray *arResult = [NSMutableArray new];
    [arResult addObject:@"h"];
    for (int i = 1; i < 3; i++)//arEncode.count
    {
        //这里需要调整为将16进制转为10进制的int型再异或
        //此处有问题
        int result = [[arEncode objectAtIndex:i] intValue];
        for (NSNumber *number in [arHasHCode objectAtIndex:i])
        {
            result ^= [[arDencode objectAtIndex:[number intValue]] intValue];
        }
        [arDencode addObject:[NSString stringWithFormat:@"%d", result]];
        [arResult addObject:[FountainCode stringFromHexString:[NSString stringWithFormat:@"%d", result]]];
    }
    
    NSLog(@"%@", arDencode);
    NSLog(@"%@", arResult);
}

// 十六进制转换为普通字符串的。
+ (NSString *)stringFromHexString:(NSString *)hexString { //
    
    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2)
    {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
    NSLog(@"------字符串=======%@",unicodeString);
    return unicodeString;
} 

//普通字符串转换为十六进制的。
+ (NSString *)hexStringFromString:(NSString *)string{
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr]; 
    } 
    return hexStr; 
}

@end
