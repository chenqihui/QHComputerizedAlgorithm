//
//  BitOperation.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-12-3.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "BitOperation.h"

//一道位运算的算法题---http://blog.jobbole.com/78358/

@implementation BitOperation

- (void)initData
{
}

- (void)runing
{
    NSLog(@"BitOperation");
    NSArray *ar = @[@1, @2, @3, @9, @8, @7, @6, @5, @2, @4, @8, @0];
    ar = @[@1, @3, @9, @8, @7, @6, @5, @4, @8, @0, @1, @2, @3, @9, @8, @7, @6, @5, @4, @8, @0];
    int result = [self singleNumber:ar];
    NSLog(@"%d", result);
    
    ar = @[@1, @3, @9, @8, @7, @6, @5, @4, @8, @0, @1, @2, @3, @9, @8, @7, @6, @5, @4, @8, @0, @1, @3, @9, @8, @7, @6, @5, @4, @8, @0];
    result = [self singleNumber2:ar];
    NSLog(@"%d", result);
    
    result = [self singleNumber4:ar];
    NSLog(@"%d", result);
}
/*
 让两个相同的数进行运算以后，能够泯灭掉，这样所有的数进行运算，剩下的值就是那个特殊的数。恰好有这样的方法，这个方法就是“异或”：
 */
- (int)singleNumber:(NSArray *)arA
{
    int total = 0;
    for (NSNumber *number in arA)
    {
        total ^= [number intValue];
    }
    return total;
}
/*
 通用算法
 
 “恰好两次”恰好有“异或”来解，现在“恰好两次”变成了“恰好三次”，推广一点说，如果是“恰好N次”，该怎么解？
 
 通用的算法中，用一个HashMap可以得到复杂度近似为n的解法，key为数字本身，value计数，到三次的时候delete掉这个entry，循环完成以后整个HashMap中剩下的就是那个特殊的整数了。这个解法普普通通，没有叙述的必要。这个方法可以保证“恰好N次”一样解决。这个算法很简单，就不写出来了。
 
 另外一个思路，借由位操作，对于整数32位，对于每一位，整个数列的数加起来去取3的余数，就是那个特殊的数在该位上的值。这个方法也可以保证“恰好N次”一样能够被解决：
 */
/*
 这个算法只能针对一个是唯一，其他必须是重复三次才可以，所以可以简单判断一个数只要又一次出现，它必然是出现三次的，不是唯一的，因此可以排除掉的算法，当然
 */
- (int)singleNumber2:(NSArray *)arA
{
    int ret = 0;
    for (int i = 0; i < 32; i++)
    {
        int c = 0, mask = 1 << i;  // ① mask, 第i位为1，其他位都为0
        for (int j = 0; j < arA.count; j++) {
            int val = ([arA[j] intValue] & mask);
            if ( val>0 || val<0 ) {  // ② 如果该数在这一位上为1，计数器就加一
                c++;
            }
        }
        if (c%3 > 0)  // ③ 这一位的计数除以3取余数，在这里只可能为0或1
            ret |= mask;
    }
    return ret;
}
/*
 需要两个数（one和accumulation），因为一个数在每一位上面无法存放超过两次同样的数出现的信息。每次循环中，需要先标记出现，然后再清零出现过三次的标志位。最终one留下的每一位都是无法清零的，即出现次数不是3的整数倍的。
 */
- (int)singleNumber4:(NSArray *)arA
{
    int one = 0; // 出现一次的标志位
    int accumulation = 0; // 积累标志位
    for (int i = 0; i < arA.count; i++)
    {
        accumulation |= [arA[i] intValue] & one; // 只要第二次或者以上出现，就为1
        one ^= [arA[i] intValue];  // 出现奇数次保留，偶数次抛弃
        int t = one & accumulation;  // 第三次的时候one和accumulation都保留了该位的值
        one &= ~t;  // 清零出现三次的该位的值
        accumulation &= ~t;
    }
    return one;
}

@end
