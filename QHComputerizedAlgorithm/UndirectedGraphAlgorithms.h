//
//  UndirectedGraphAlgorithms.h
//  QHComputerizedAlgorithm
//
//  Created by chen on 14/11/30.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "BasicAlgorithmsAndDataStructuresObject.h"

//图的数据结构
@interface UndirectedGraph : NSObject

@end

@interface UndirectedGraphAlgorithms : BasicAlgorithmsAndDataStructuresObject

@end

@interface DepthFirstSearch : NSObject

- (void)DepthFirstSearch:(UndirectedGraph *)g v:(int)v;

@end

@interface DepthFirstPaths : NSObject

- (void)DepthFirstPaths:(UndirectedGraph *)g s:(int)s;

- (NSArray *) PathTo:(int) v;

@end

@interface BreadthFirstSearch : NSObject

- (void)BreadthFirstSearch:(UndirectedGraph *)g s:(int)s;

- (NSArray *) PathTo:(int) v;

@end
