//
//  MapReduce.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-12-5.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "MapReduce.h"

//MapReduce原理与设计思想---http://blog.jobbole.com/80619/
/*
 MapReduce合并了两种经典函数：
 
 映射（Mapping）对集合里的每个目标应用同一个操作。即，如果你想把表单里每个单元格乘以二，那么把这个函数单独地应用在每个单元格上的操作就属于mapping。
 化简（Reducing ）遍历集合中的元素来返回一个综合的结果。即，输出表单里一列数字的和这个任务属于reducing。
 */

@interface MapReduce ()
{
    NSArray *_arCode;
}

@end

@implementation MapReduce

- (void)initData
{
    _arCode = @[@"the weather is good", @"today is good", @"good weather is good", @"today has good weather"];
}

- (void)runing
{
    [self normal];
    
    [self mapReduce];
}

//文档词频统计：WordCount
/*
 传统的串行处理方式
 */
- (void)normal
{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [_arCode enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop)
    {
        NSArray *ar = [obj componentsSeparatedByString:@" "];
        for (NSString *string in ar)
        {
            NSNumber *number = [dic objectForKey:string];
            if (number)
            {
                number = [NSNumber numberWithInt:([number intValue] + 1)];
                [dic setObject:number forKey:string];
            }else
                [dic setObject:@1 forKey:string];
        }
    }];
    NSLog(@"%@", dic);//good:  5;   has: 1;  is: 3;   the: 1;   today: 2;    weather: 3
}

/*
 基于MapReduce的处理过程示例–文档词频统计：WordCount
 
 设有4组原始文本数据：
 
 Text 1: the weather is good         Text 2: today is good
 
 Text 3: good weather is good      Text 4: today has good weather
 */
- (void)mapReduce
{
    //这里用暂时用循环模拟多线程
    
    //Mapping
    //1、计算任务的划分和调度
    NSMutableArray *arD = [NSMutableArray new];
    NSMutableSet *setD = [NSMutableSet new];
    [_arCode enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop)
     {
         NSMutableDictionary *dic = [NSMutableDictionary new];
         NSArray *ar = [obj componentsSeparatedByString:@" "];
         for (NSString *string in ar)
         {
             NSNumber *number = [dic objectForKey:string];
             if (number)
             {
                 number = [NSNumber numberWithInt:([number intValue] + 1)];
                 [dic setObject:number forKey:string];
             }else
                 [dic setObject:@1 forKey:string];
         }
         [arD addObject:dic];
         [setD addObjectsFromArray:dic.allKeys];
     }];
    //Reducing
    //2、数据的分布存储和划分
    //总共6个key，所以分3组，每组2个key操作
    int reduce = 3;
    int reduceSum = setD.count/reduce;
    NSArray *arDD = [setD allObjects];
    NSString *str1;
    NSString *str2;
    NSMutableDictionary *dic = [NSMutableDictionary new];
    //3、处理数据与计算任务的同步
    for (int i = 0; i < setD.count; i = i + reduceSum)
    {
        str1 = [arDD objectAtIndex:i];
        str2 = [arDD objectAtIndex:i + 1];
        __block int sum1 = 0;
        __block int sum2 = 0;
        [arD enumerateObjectsUsingBlock:^(NSMutableDictionary *dic, NSUInteger idx, BOOL *stop)
         {
             NSNumber *n = [dic objectForKey:str1];
             if (n)
                 sum1 += [n intValue];
             NSNumber *n2 = [dic objectForKey:str2];
             if (n2)
                 sum2 += [n2 intValue];
         }];
        //4、结果数据的收集整理(sorting, combining, partitioning,…)
        [dic setObject:[NSNumber numberWithInt:sum1] forKey:str1];
        [dic setObject:[NSNumber numberWithInt:sum2] forKey:str2];
    }
    //5、系统通信、负载平衡、计算性能优化处理
    NSLog(@"%@", dic);
    
    //6、处理系统节点出错检测和失效恢复
}
/*
 4.MapReduce的主要设计思想和特征
 
 1、向“外”横向扩展，而非向“上”纵向扩展（Scale “out”, not “up”）
 
 即MapReduce集群的构筑选用价格便宜、易于扩展的大量低端商用服务器，而非价格昂贵、不易扩展的高端服务器（SMP）低端服务器市场与高容量Desktop PC有重叠的市场，因此，由于相互间价格的竞争、可互换的部件、和规模经济效应，使得低端服务器保持较低的价格基于TPC-C在2007年底的性能评估结果,一个低端服务器平台与高端的共享存储器结构的服务器平台相比,其性价比大约要高4倍;如果把外存价格除外,低端服务器性价比大约提高12倍对于大规模数据处理，由于有大量数据存储需要，显而易见，基于低端服务器的集群远比基于高端服务器的集群优越，这就是为什么MapReduce并行计算集群会基于低端服务器实现
 
 2、失效被认为是常态（Assume failures are common）
 
 MapReduce集群中使用大量的低端服务器(Google目前在全球共使用百万台以上的服务器节点),因此，节点硬件失效和软件出错是常态，因而：一个良好设计、具有容错性的并行计算系统不能因为节点失效而影响计算服务的质量，任何节点失效都不应当导致结果的不一致或不确定性；任何一个节点失效时，其它节点要能够无缝接管失效节点的计算任务；当失效节点恢复后应能自动无缝加入集群，而不需要管理员人工进行系统配置MapReduce并行计算软件框架使用了多种有效的机制，如节点自动重启技术，使集群和计算框架具有对付节点失效的健壮性，能有效处理失效节点的检测和恢复。
 
 3、把处理向数据迁移（Moving processing to the data）
 
 　　传统高性能计算系统通常有很多处理器节点与一些外存储器节点相连，如用区域存储网络(SAN,Storage Area Network)连接的磁盘阵列，因此，大规模数据处理时外存文件数据I/O访问会成为一个制约系统性能的瓶颈。为了减少大规模数据并行计算系统中的数据通信开销，代之以把数据传送到处理节点(数据向处理器或代码迁移)，应当考虑将处理向数据靠拢和迁移。MapReduce采用了数据/代码互定位的技术方法，计算节点将首先将尽量负责计算其本地存储的数据,以发挥数据本地化特点(locality),仅当节点无法处理本地数据时，再采用就近原则寻找其它可用计算节点，并把数据传送到该可用计算节点。
 
 4、顺序处理数据、避免随机访问数据（Process data sequentially and avoid random access）
 
 　大规模数据处理的特点决定了大量的数据记录不可能存放在内存、而只可能放在外存中进行处理。磁盘的顺序访问和随即访问在性能上有巨大的差异
 
 例：100亿(1010)个数据记录(每记录100B,共计1TB)的数据库
 
 更新1%的记录(一定是随机访问)需要1个月时间；而顺序访问并重写所有数据记录仅需1天时间！
 
 　MapReduce设计为面向大数据集批处理的并行计算系统，所有计算都被组织成很长的流式操作，以便能利用分布在集群中大量节点上磁盘集合的高传输带宽。
 5、为应用开发者隐藏系统层细节（Hide system-level details from the application developer）
 
 　　软件工程实践指南中，专业程序员认为之所以写程序困难，是因为程序员需要记住太多的编程细节(从变量名到复杂算法的边界情况处理)，这对大脑记忆是一个巨大的认知负担,需要高度集中注意力而并行程序编写有更多困难，如需要考虑多线程中诸如同步等复杂繁琐的细节，由于并发执行中的不可预测性，程序的调试查错也十分困难；大规模数据处理时程序员需要考虑诸如数据分布存储管理、数据分发、数据通信和同步、计算结果收集等诸多细节问题MapReduce提供了一种抽象机制将程序员与系统层细节隔离开来，程序员仅需描述需要计算什么(what to compute), 而具体怎么去做(how to compute)就交由系统的执行框架处理，这样程序员可从系统层细节中解放出来，而致力于其应用本身计算问题的算法设计
 
 6、平滑无缝的可扩展性（Seamless scalability）
 
 主要包括两层意义上的扩展性：数据扩展和系统规模扩展。理想的软件算法应当能随着数据规模的扩大而表现出持续的有效性，性能上的下降程度应与数据规模扩大的倍数相当在集群规模上，要求算法的计算性能应能随着节点数的增加保持接近线性程度的增长绝大多数现有的单机算法都达不到以上理想的要求；把中间结果数据维护在内存中的单机算法在大规模数据处理时很快失效；从单机到基于大规模集群的并行计算从根本上需要完全不同的算法设计奇妙的是，MapReduce几乎能实现以上理想的扩展性特征。  多项研究发现基于MapReduce的计算性能可随节点数目增长保持近似于线性的增长
*/

@end
