//
//  UndirectedGraphAlgorithms.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14/11/30.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "UndirectedGraphAlgorithms.h"

#import "StackAndQueue.h"

//浅谈算法和数据结构（12）：无向图相关算法基础---http://blog.jobbole.com/79314/
/*
 图是若干个顶点(Vertices)和边(Edges)相互连接组成的。边仅由两个顶点连接，并且没有方向的图称为无向图。
 
 图也分为稀疏图和稠密图两种。
 */

@interface UndirectedGraph ()
{
    int _verticals;//顶点个数
    int _edges;//边的个数
    NSMutableArray *_adjacency;//顶点联接列表
}

@end

//Graph的API的实现可以由多种不同的数据结构来表示，最基本的是维护一系列边的集合

//使用邻接矩阵来表示

//使用邻接列表来表示（此处使用的是这个）
@implementation UndirectedGraph

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _verticals = 10;
        _edges = 0;
    }
    return self;
}

- (void)initVerticals:(int)verticals
{
    _verticals = verticals;
    _adjacency = [[NSMutableArray alloc] initWithCapacity:_verticals];
    for (int i = 0; i < _verticals; i++)
    {
        [_adjacency addObject:[NSMutableArray new]];
    }
}

- (void) AddEdge:(int) verticalStart end:(int) verticalEnd
{
    [_adjacency[verticalStart] addObject:[NSNumber numberWithInt:verticalEnd]];
    [_adjacency[verticalEnd] addObject:[NSNumber numberWithInt:verticalStart]];
    _edges++;
}

- (NSArray *) GetAdjacency:(int) vetical
{
    return _adjacency[vetical];
}

- (int) GetVerticals
{
    return _verticals;
}

- (int) GetEdges
{
    return _edges;
}

@end

@implementation UndirectedGraphAlgorithms

- (void)initData
{
}

- (void)runing
{
    UndirectedGraph *graph = [UndirectedGraph new];
    /*
    [graph initVerticals:13];
    [graph AddEdge:0 end:1];
    [graph AddEdge:0 end:2];
    [graph AddEdge:0 end:5];
    [graph AddEdge:0 end:6];
    [graph AddEdge:3 end:5];
    [graph AddEdge:3 end:4];
    [graph AddEdge:4 end:5];
    [graph AddEdge:4 end:6];
    [graph AddEdge:7 end:8];
    [graph AddEdge:9 end:11];
    [graph AddEdge:9 end:10];
    [graph AddEdge:9 end:12];
    [graph AddEdge:11 end:12];
    
    NSLog(@"%@", [graph GetAdjacency:6]);
     */
    
    [graph initVerticals:6];
    [graph AddEdge:3 end:5];
    [graph AddEdge:3 end:4];
    [graph AddEdge:0 end:2];
    [graph AddEdge:0 end:1];
    [graph AddEdge:0 end:5];
    [graph AddEdge:1 end:2];
    [graph AddEdge:2 end:3];
    [graph AddEdge:2 end:4];
    
    for (int i = 0; i < [graph GetVerticals]; i++)
    {
        NSArray *ar = [graph GetAdjacency:i];
        for (NSNumber *n in ar)
        {
            NSLog(@"%d", [n integerValue]);
        }
        
        NSLog(@"\n=========================\n");
    }
    
    DepthFirstSearch *search = [DepthFirstSearch new];
    [search DepthFirstSearch:graph v:0];
    
    DepthFirstPaths *path = [DepthFirstPaths new];
    [path DepthFirstPaths:graph s:0];
    
    NSLog(@"%@", [path PathTo:5]);
    
    BreadthFirstSearch *breadth = [BreadthFirstSearch new];
    [breadth BreadthFirstSearch:graph s:0];
    
    NSLog(@"%@", [breadth PathTo:4]);
}

@end

//深度优先算法
/*
 创建一个Graph对象
 将Graph对象传给图算法处理对象，如一个Paths对象
 然后查询处理后的结果来获取信息
 */

@interface DepthFirstSearch ()
{
    NSMutableArray *_marked;//记录是否被dfs访问过
    int _count;//搜索的起始点
}

@end

@implementation DepthFirstSearch

- (void)DepthFirstSearch:(UndirectedGraph *)g v:(int)v
{
    _marked = [NSMutableArray arrayWithCapacity:[g GetVerticals]];
    for (int i = 0; i < [g GetVerticals]; i++)
    {
        _marked[i] = [NSNumber numberWithBool:NO];
    }
    [self dfs:g v:v];
}

- (void) dfs:(UndirectedGraph *)g v:(int) v
{
    NSLog(@"dfs(%d)", v);//该位置开始查找
    _marked[v] = [NSNumber numberWithBool:YES];
    _count++;
    
    for (NSNumber *vertical in [g GetAdjacency:v])
    {
        if (![self IsMarked:[vertical integerValue]])
        {
            [self dfs:g v:[vertical integerValue]];
        }else
            NSLog(@"check %d", [vertical integerValue]);//检查到已经标记了
            
    }
    NSLog(@"%d done", v);//该位置结束查找
}

- (BOOL) IsMarked:(int) vertical
{
    return [[_marked objectAtIndex:vertical] boolValue];
}

- (int) Count
{
    return _count;
}

@end

//深度优先路径查询
/*
 有了这个基础，我们可以实现基于深度优先的路径查询，要实现路径查询，我们必须定义一个变量来记录所探索到的路径。 所以在上面的基础上定义一个edgesTo变量来后向记录所有到s的顶点的记录，和仅记录从当前节点到起始节点不同，我们记录图中的每一个节点到开始节点的路径。为了完成这一日任务，通过设置edgesTo[w]=v，我们记录从v到w的边，换句话说，v-w是做后一条从s到达w的边。 edgesTo[]其实是一个指向其父节点的树。
 */

@interface DepthFirstPaths ()
{
    NSMutableArray *_marked;//记录是否被dfs访问过
    NSMutableArray *_edgesTo;//记录最后一个到当前节点的顶点
    int _s;//搜索的起始点
}

@end

@implementation DepthFirstPaths

- (void)DepthFirstPaths:(UndirectedGraph *)g s:(int)s
{
    _marked = [NSMutableArray arrayWithCapacity:[g GetVerticals]];
    for (int i = 0; i < [g GetVerticals]; i++)
    {
        _marked[i] = [NSNumber numberWithBool:NO];
    }
    _edgesTo = [NSMutableArray arrayWithCapacity:[g GetVerticals]];
    for (int i = 0; i < [g GetVerticals]; i++)
    {
        _edgesTo[i] = [NSNumber numberWithInt:-1];
    }
    _s = s;
    [self dfs:g v:s];
}

- (void) dfs:(UndirectedGraph *)g v:(int) v
{
    NSLog(@"dfs(%d)", v);//该位置开始查找
    _marked[v] = [NSNumber numberWithBool:YES];
    
    for (NSNumber *vertical in [g GetAdjacency:v])
    {
        if (![self IsMarked:[vertical integerValue]])
        {
            _edgesTo[[vertical integerValue]] = [NSNumber numberWithInt:v];//将可以跳到的下个顶点记录到当前节点下
            [self dfs:g v:[vertical integerValue]];
        }else
            NSLog(@"check %d", [vertical integerValue]);//检查到已经标记了
        
    }
    NSLog(@"%d done", v);//该位置结束查找
}

- (BOOL) IsMarked:(int) vertical
{
    return [[_marked objectAtIndex:vertical] boolValue];
}

- (BOOL) HasPathTo:(int) v
{
    return [_marked[v] boolValue];
}

- (NSArray *) PathTo:(int) v
{
    if (![self HasPathTo:v]) return nil;
    NSMutableArray *path = [NSMutableArray new];
    
    for (int x = v; x!=_s; x = [_edgesTo[x] integerValue])
    {
        [path addObject:[NSNumber numberWithInt:x]];
    }
    [path addObject:[NSNumber numberWithInt:_s]];
    return path;
}

@end

//广度优先算法
/*
 移除最近最近添加的顶点v
 将v未被访问的节点添加到队列中
 标记他们为已经访问
 */
@interface BreadthFirstSearch ()
{
    NSMutableArray *_marked;
    NSMutableArray *_edgeTo;
    int _sourceVetical;
}

@end

@implementation BreadthFirstSearch

- (void)BreadthFirstSearch:(UndirectedGraph *)g s:(int)s
{
    _marked = [NSMutableArray arrayWithCapacity:[g GetVerticals]];
    for (int i = 0; i < [g GetVerticals]; i++)
    {
        _marked[i] = [NSNumber numberWithBool:NO];
    }
    _edgeTo = [NSMutableArray arrayWithCapacity:[g GetVerticals]];
    for (int i = 0; i < [g GetVerticals]; i++)
    {
        _edgeTo[i] = [NSNumber numberWithInt:-1];
    }
    _sourceVetical = s;
    [self bfs:g s:s];
}

- (void) bfs:(UndirectedGraph *)g s:(int) s
{
    QueueArray *queue = [QueueArray new];
    NSLog(@"dfs(%d)", s);//该位置开始查找
    [queue enqueue:[NSNumber numberWithInt:s]];
    _marked[s] = [NSNumber numberWithBool:YES];
    
    while (queue.number != 0)
    {
        int v = [queue.dequeue integerValue];
        for (NSNumber *vertical in [g GetAdjacency:v])
        {
            if (![self IsMarked:[vertical integerValue]])
            {
                _edgeTo[[vertical integerValue]] = [NSNumber numberWithInt:v];
                _marked[[vertical integerValue]] = [NSNumber numberWithBool:YES];
                [queue enqueue:vertical];
            }else
                NSLog(@"check %d", [vertical integerValue]);//检查到已经标记了
            
        }
    }
    
    NSLog(@"%d done", s);//该位置结束查找
}

- (BOOL) IsMarked:(int) vertical
{
    return [[_marked objectAtIndex:vertical] boolValue];
}

- (BOOL) HasPathTo:(int) v
{
    return [_marked[v] boolValue];
}

- (NSArray *) PathTo:(int) v
{
    if (![self HasPathTo:v]) return nil;
    NSMutableArray *path = [NSMutableArray new];
    
    for (int x = v; x!=_sourceVetical; x = [_edgeTo[x] integerValue])
    {
        [path addObject:[NSNumber numberWithInt:x]];
    }
    [path addObject:[NSNumber numberWithInt:_sourceVetical]];
    return path;
}

@end
