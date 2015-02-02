//
//  LogStructuredFileSystems.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 15-1-4.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "LogStructuredFileSystems.h"

//超酷算法：日志结构化存储---http://blog.jobbole.com/82730/

/*
 通常，如果你正在设计一个存储系统，例如一个文件系统或者数据库，你主要问题之一是如何把数据储存到磁盘上。你不仅要注意存储索引数据，也要注意为存储对象分配空间；你不仅要担忧当你想扩大一个现有的模块（例如，附加到文件）会发生什么，注意新旧对象交替时候产生的存储碎片。所有的这些增加了很多复杂度，解决方案往往或者有缺陷或者效率低。
 
 日志结构化存储（Log structured storage）是一项可以解决所有这些问题的技术。它来源于20世纪80年代的日志结构文件系统（Log Structured File Systems），但是最近越来越多的把它当作构建数据库引擎存储的一种方法使用。在其原始的文件系统应用程序中， 它受到一些缺点的影响而不能被广泛使用，但我们将会看到，这些对于数据库引擎来说都已经不是问题了，而且日志结构化存储除了简单的存储管理之外，还为数据库引擎带来了额外的好处。
 
 顾名思义，日志结构化存储系统的基础组织是一个日志，即一个只可添加数据输入的序列。每当你有新的数据要写入的时候，你只需要简单的添加它到日志的末尾，而不需要在磁盘中为它寻找一个位置。索引数据可以通过对元数据进行同样处理得到：元数据的更新同样添加到日志中。这看起来似乎效率不高，但是基于磁盘的索引结构（比如B-树）通常非常广泛，所以我们每次写入是需要更新的索引节点数目通常非常小。
 */

@implementation LogStructuredFileSystems

- (void)initCodeData
{
}

- (void)runingCode
{
}

@end