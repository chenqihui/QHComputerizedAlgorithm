//
//  BurkhardKellerTree.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-12-1.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "BurkhardKellerTree.h"

//超酷算法（1）：BK树---http://blog.jobbole.com/78811/

/*
 BK树或者称为Burkhard-Keller树，是一种基于树的数据结构，被设计于快速查找近似字符串匹配，比方说拼写检查器，或模糊查找，当搜索”aeek”时能返回”seek”和”peek”。为何BK-Trees这么酷，因为除了穷举搜索，没有其他显而易见的解决方法，并且它能以简单和优雅的方法大幅度提升搜索速度。
 */

/*
 BK树的构造就相当简单：每个节点有任意个子节点，每条边有个值表示编辑距离。所有子节点到父节点的边上标注n表示编辑距离恰好为n。比如，我们有棵树父节点是”book”和两个子节点”rook”和”nooks”，”book”到”rook”的边标号1，”book”到”nooks”的边上标号2。
 
 从字典里构造好树后，取任意单词作为树的根节点。无论何时你想插入新单词时，计算该单词与根节点的编辑距离，并且查找数值为d(neweord, root)的边。递归得与各子节点进行比较，直到没有子节点，你就可以创建新的子节点并将新单词保存在那。比如，插入”boon”到刚才上述例子的树中，我们先检查根节点，查找d(“book”, “boon”) = 1的边，然后检查标号为1的边的子节点，得到单词”rook”。我们再计算距离d(“rook”, “boon”)=2，则将新单词插在”rook”之后，边标号为2。
 */
@implementation BurkhardKellerTree

//实现算法不详

- (void)initCodeData
{
}

- (void)runingCode
{
}

@end
