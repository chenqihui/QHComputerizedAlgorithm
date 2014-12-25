//
//  InvertedIndexMapReduce.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-12-25.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "InvertedIndexMapReduce.h"

//MapReduce实战：倒排索引--http://blog.jobbole.com/82607/
/*
 倒排索引（Inverted index），也常被称为反向索引、置入档案或反向档案，是一种索引方法，被用来存储在全文搜索下某个单词在一个文档或者一组文档中的存储位置的映射。它是文档检索系统中最常用的数据结构。
 
 有两种不同的反向索引形式：
 
 一条记录的水平反向索引（或者反向档案索引）包含每个引用单词的文档的列表。
 一个单词的水平反向索引（或者完全反向索引）又包含每个单词在一个文档中的位置。
 后者的形式提供了更多的兼容性（比如短语搜索），但是需要更多的时间和空间来创建。
 */

@implementation InvertedIndexMapReduce

- (void)initData
{
}

- (void)runing
{
}

//（1）Map过程:
//Map过程首先必须分析输入的<key, value>对，得到倒排索引中需要的三个信息：单词、文档URI和词频
- (void)mapForInvertedIndexMapper:(id)key value:(NSString *)value
{
    
}

/*
 存在两个问题，
 第一：<key, value>对只能有两个值，在不使用Hadoop自定义数据类型的情况下，需要根据情况将其中的两个值合并成一个值，作为value或key值；
 第二：通过一个Reduce过程无法同时完成词频统计和生成文档列表，所以必须增加一个Combine过程完成词频统计
 */

//（2）Combine过程:
//将key值相同的value值累加，得到一个单词在文档中的词频
- (void)reduceForInvertedIndexCombiner
{
    
}

//（3）Reduce过程
//Reduce过程只需将相同key值的value值组合成倒排索引文件所需的格式即可，剩下的事情就可以直接交给MapReduce框架进行处理了
- (void)reducerForInvertedIndexReducer
{
    
}

@end
