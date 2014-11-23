//
//  StackAndQueue.h
//  QHComputerizedAlgorithm
//
//  Created by chen on 14/11/23.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "BasicAlgorithmsAndDataStructuresObject.h"

@interface StackLinkObject : NSObject
{
    id item;
    StackLinkObject *next;
}

@property (nonatomic, retain) id item;
@property (nonatomic, retain) StackLinkObject *next;

@end

@interface StackLink : NSObject
{
    StackLinkObject *first;
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

@interface StackAndQueue : BasicAlgorithmsAndDataStructuresObject

@end
