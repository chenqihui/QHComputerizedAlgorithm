//
//  BAndBplusTree.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-27.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "BAndBplusTree.h"

//浅谈算法和数据结构（10）：平衡查找树之B树---http://blog.jobbole.com/79311/
/*
 维基百科对B树的定义为“在计算机科学中，B树（B-tree）是一种树状数据结构，它能够存储数据、对其进行排序并允许以O(log n)的时间复杂度运行进行查找、顺序读取、插入和删除的数据结构。B树，概括来说是一个节点可以拥有多于2个子节点的二叉查找树。与自平衡二叉查找树不同，B-树为系统最优化大块数据的读和写操作。B-tree算法减少定位记录时所经历的中间过程，从而加快存取速度。普遍运用在数据库和文件系统。”
 */
/*
 B树：
 
 B 树可以看作是对2-3查找树的一种扩展，即他允许每个节点有M-1个子节点。
 
 根节点至少有两个子节点
 每个节点有M-1个key，并且以升序排列
 位于M-1和M key的子节点的值位于M-1 和M key对应的Value之间
 其它节点至少有M/2个子节点
 
 B+树：
 
 B+树是对B树的一种变形树，它与B树的差异在于：
 
 有k个子结点的结点必然有k个关键码；
 非叶结点仅具有索引作用，跟记录有关的信息均存放在叶结点中。
 树的所有叶结点构成一个有序链表，可以按照关键码排序的次序遍历全部记录。
 */
@implementation BAndBplusTree

- (void)initData
{
}

- (void)runing
{
}

@end
