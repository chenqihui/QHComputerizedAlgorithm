//
//  DataEncodeOfHistoryPrincipleCompressionAlgorithms.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 15-1-21.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "DataEncodeOfHistoryPrincipleCompressionAlgorithms.h"

//数据压缩的历史、原理及常用算法---http://blog.jobbole.com/83422/

/*
 1、压缩管道
 原始的输入数据包含我们需要压缩或减小尺寸的符号序列。这些符号被压缩器编码，输出结果是编码过的数据。
 
 2、数据模型
 信息的定义是度量一个数据片段复杂度的量。一个数据集拥有越多的信息，它就越难被压缩。稀有的概念和信息的概念是相关的，因为稀有符号的出现比常见符号的出现提供了更多的信息。
 
 3、概率模型
 设计一个压缩方案的最重要一步，是为数据创建一个概率模型。这个模型允许我们测量数据的特征，达到有效的适应压缩算法的目的。
 
 4、最小编码率
 
 5、熵和冗余
 1）如果我们为字母表中的字符计算最小编码率的加权平均值，我们得到一个被称作香农熵的值，简单地称作模型的熵。熵被定义为给定模型的最小编码率。
 2）编码率（2）和熵值（1.85）的差值被称作压缩方案的冗余。
 
 6、编码模型
 
 7、常见算法
 1）霍夫曼编码
 2）字典方法
 3）哥伦布指数编码
 4）算术编码
 5）行程长度编码（RLE）
 
 8、有损压缩
 
 9、总结
 
 本文聚焦于无损压缩技术，并对一些最流行的技术提供了一个简明的介绍。希望它已经激起了你对于数据压缩重要领域的兴趣，并为这个主题的进一步阅读提供方向。
*/

@implementation DataEncodeOfHistoryPrincipleCompressionAlgorithms

- (void)initCodeData
{
}

- (void)runingCode
{
}

@end
