//
//  StackAndQueue.h
//  QHComputerizedAlgorithm
//
//  Created by chen on 14/11/23.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "BasicAlgorithmsAndDataStructuresObject.h"

@interface Node : NSObject
{
    id item;
    Node *next;
}

@property (nonatomic, retain) id item;
@property (nonatomic, retain) Node *next;

- (instancetype)initWithItm:(id)obj;

@end

@interface StackLink : NSObject
{
    Node *first;
}

@property (nonatomic, assign, readonly) int number;

- (void)push:(id)obj;
- (id)pop;

@end

@interface StackArray : NSObject
{
    NSMutableArray *arData;
    int capacitysize;
}

@property (nonatomic, assign, readonly) int number;

- (void)push:(id)obj;
- (id)pop;

@end

@interface QueueLink : NSObject
{
    Node *first;
    Node *last;
}

@property (nonatomic, assign, readonly) int number;

- (void)enqueue:(id)item;
- (id)dequeue;

@end

@interface QueueArray : NSObject
{
    NSMutableArray *arData;
    int capacitysize;
    
    int head;
    int tail;
}

@property (nonatomic, assign, readonly) int number;

- (void)enqueue:(id)item;
- (id)dequeue;

@end

@interface StackAndQueue : BasicAlgorithmsAndDataStructuresObject

- (NSArray *)reverse:(NSArray *)array;
- (NSArray *)reverse:(NSArray *)array index:(int)idx;

@end
