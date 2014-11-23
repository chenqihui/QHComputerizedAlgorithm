//
//  StackAndQueue.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14/11/23.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "StackAndQueue.h"

@implementation StackLinkObject

@synthesize item;
@synthesize next;

@end

@interface StackLink ()

@property (nonatomic, assign, readwrite) int number;

@end

@implementation StackLink

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.number = 0;
        first = nil;
    }
    return self;
}

- (void)push:(id)obj
{
    StackLinkObject *oldFirst = first;// != nil ? [first copy]:nil;
    first = [StackLinkObject new];//autorelease
    first.item = obj;
    first.next = oldFirst;
    self.number++;
}

- (id)pop
{
    if (self.number > 0)
    {
        id obj = first.item;
        first = first.next;
        self.number--;
        return obj;
    }
    return nil;
}

- (void)show
{
    NSMutableString *s = [NSMutableString new];
    StackLinkObject *obj = first;
    while (obj != nil)
    {
        [s appendFormat:@"%@-->", obj.item];
        obj = obj.next;
    }
    [s appendFormat:@"nil"];
    NSLog(@"%@", s);
}

@end

@implementation StackArray

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        capacitysize = 10;
        arData = [NSMutableArray arrayWithCapacity:capacitysize];
    }
    return self;
}

- (void)push:(id)obj
{
    if (arData.count > capacitysize/2)
    {
        [self resize:2*capacitysize];
    }
    [arData addObject:obj];
}

- (id)pop
{
    if (arData.count > 0)
    {
        id obj = [arData objectAtIndex:0];
        [arData removeObjectAtIndex:0];
        return obj;
    }
    return nil;
}

- (int)number
{
    return arData.count;
}

- (void)resize:(int)capacity
{
    capacitysize = capacity;
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:capacity];
    [temp addObjectsFromArray:arData];
    arData = temp;
}

- (void)show
{
    NSLog(@"%@", arData);
}

@end

@implementation StackAndQueue

- (void)initData
{
}

- (void)runing
{
    StackLink *stackLink = [StackLink new];
    //    NSUInteger idx = arc4random();
    [stackLink push:[NSString stringWithFormat:@"%d", arc4random()]];
    [stackLink push:[NSString stringWithFormat:@"%d", arc4random()]];
    [stackLink push:[NSString stringWithFormat:@"%d", arc4random()]];
    [stackLink push:[NSString stringWithFormat:@"%d", arc4random()]];
    [stackLink show];
    NSLog(@"%@", [stackLink pop]);
    NSLog(@"%@", [stackLink pop]);
    [stackLink show];
    
    
    StackArray *stackArray = [StackArray new];
    [stackArray push:[NSString stringWithFormat:@"%d", arc4random()]];
    [stackArray push:[NSString stringWithFormat:@"%d", arc4random()]];
    [stackArray push:[NSString stringWithFormat:@"%d", arc4random()]];
    [stackArray push:[NSString stringWithFormat:@"%d", arc4random()]];
    [stackArray show];
    NSLog(@"%@", [stackArray pop]);
    NSLog(@"%@", [stackArray pop]);
    [stackArray show];
}

@end
