//
//  NumberEstimative.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-12-1.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "NumberEstimative.h"

//超酷算法：基数估计---http://blog.jobbole.com/78255/

/*
 一个简单的朴素基数估计器
 
 让我们从一个简单的例子开始吧。假定某人以下列方式来生成数据:
 
 1、生成 n 个充分分散的随机数
 2、任意地从中选择一些数字，使其重复某次
 3、打乱这些数字
 */

@implementation NumberEstimative

- (void)initCodeData
{
//    int f = (int)(1+arc4random()%99);
//    
//    NSLog(@"%d", f);
//    NSString *r = [NumberEstimative toBinarySystemWithDecimalSystem:[NSString stringWithFormat:@"%d", f]];
//    NSLog(@"%@", r);
    
    NSMutableArray *originalArray = [NSMutableArray new];
    for (int i = 0; i < 10; i++)
    {
        float f = (float)(arc4random() % 100) /100;
        [originalArray addObject:[NSNumber numberWithFloat:f]];
    }
    
    NSLog(@"%@", originalArray);
    
    NSArray *sortedArray = [originalArray sortedArrayUsingComparator:^(NSNumber *number1,NSNumber *number2)
    {
        float val1 = [number1 floatValue];
        float val2 = [number2 floatValue];
        if (val1 > val2)
        {
            return NSOrderedDescending;
        } else
        {
            return NSOrderedAscending;
        }
    }];
    
    NSLog(@"%@", sortedArray);
    
    float numberEstimative = [sortedArray[sortedArray.count - 1] floatValue]/[sortedArray[0] floatValue];
    
    NSLog(@"估计结果：%.2f", numberEstimative);
    
    //方法2.NSSortDescriptor
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc]initWithKey:nil ascending:YES];
    NSArray *sortArray = [NSArray arrayWithObjects:descriptor, nil];
    NSArray *sortedArray2 = [originalArray sortedArrayUsingDescriptors:sortArray];
    NSLog(@"方法2.NSSortDescriptor:%@", sortedArray2);
}

- (void)runingCode
{
}

-(long long int) two_ten:(long long int)tn
{
    long long int b,TheTen=0,Total=0;
    while(tn)
    {
        b=tn-(int)(tn/10)*10;
        TheTen+=b*pow(2,Total);;
        Total++;
        tn=(int)(tn/10);
    }
    
    printf("转换为十进制："); //打印
    printf("%lli",TheTen);
    printf("n");
    
    return TheTen;
}
//  十进制转二进制
+ (NSString *)toBinarySystemWithDecimalSystem:(NSString *)decimal
{
    int num = [decimal intValue];
    int remainder = 0;      //余数
    int divisor = 0;        //除数
    
    NSString * prepare = @"";
    
    while (true)
    {
        remainder = num%2;
        divisor = num/2;
        num = divisor;
        prepare = [prepare stringByAppendingFormat:@"%d",remainder];
        
        if (divisor == 0)
        {
            break;
        }
    }
    
    NSString * result = @"";
    for (int i = prepare.length - 1; i >= 0; i --)
    {
        result = [result stringByAppendingFormat:@"%@",
                  [prepare substringWithRange:NSMakeRange(i , 1)]];
    }
    
    return result;
}

//  二进制转十进制
+ (NSString *)toDecimalSystemWithBinarySystem:(NSString *)binary
{
    int ll = 0 ;
    int  temp = 0 ;
    for (int i = 0; i < binary.length; i ++)
    {
        temp = [[binary substringWithRange:NSMakeRange(i, 1)] intValue];
        temp = temp * powf(2, binary.length - i - 1);
        ll += temp;
    }
    
    NSString * result = [NSString stringWithFormat:@"%d",ll];
    
    return result;
}

@end

