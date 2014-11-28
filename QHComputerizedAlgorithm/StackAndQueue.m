//
//  StackAndQueue.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14/11/23.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "StackAndQueue.h"

//浅谈算法和数据结构（1）：栈和队列---http://blog.jobbole.com/79267/
/*
 栈 (Stack)是一种后进先出(last in first off，LIFO)的数据结构
 */
@implementation Node

@synthesize item;
@synthesize next;

- (instancetype)initWithItm:(id)obj
{
    self = [super init];
    if (self)
    {
        self.item = obj;
    }
    return self;
}

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
    NSLog(@"%@", obj);
    Node *oldFirst = first;// != nil ? [first copy]:nil;
    first = [Node new];//autorelease
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
    Node *obj = first;
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
    if (arData.count == capacitysize)
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
        if (self.number > 0 && self.number == capacitysize/4)
        {
            [self resize:capacitysize/2];
        }
        return obj;
    }
    return nil;
}

- (int)number
{
    return arData.count;
}

/*
 在Push和Pop方法中，为了节省内存空间，我们会对数组进行整理。Push的时候，当元素的个数达到数组的Capacity的时候，我们开辟2倍于当前元素的新数组，然后将原数组中的元素拷贝到新数组中。Pop的时候，当元素的个数小于当前容量的1/4的时候，我们将原数组的大小容量减少1/2。
 */
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

/*
 队列(Queue)则是一种先进先出 (fisrt in first out，FIFO)的结构
 */

@interface QueueLink ()

@property (nonatomic, assign, readwrite) int number;

@end

@implementation QueueLink

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.number = 0;
    }
    return self;
}

- (void)enqueue:(id)item
{
    NSLog(@"%@", item);
    Node *oldLast = last;//arc下回retain
    last = [Node new];
    last.item = item;
    if ([self isEmpety])
    {
        first = last;
    }else
    {
        oldLast.next = last;
    }
    self.number++;
}

- (id)dequeue
{
    id temp = first.item;
    first = first.next;
    self.number--;
    if ([self isEmpety])
    {
        last = nil;
    }
    return temp;
}

- (BOOL)isEmpety
{
    if (self.number == 0)
    {
        return YES;
    }
    return NO;
}

- (void)show
{
    NSMutableString *s = [NSMutableString new];
    Node *obj = first;
    while (obj != nil)
    {
        [s appendFormat:@"%@-->", obj.item];
        obj = obj.next;
    }
    [s appendFormat:@"nil"];
    NSLog(@"%@", s);
}

@end

@implementation QueueArray

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        head = 0;
        tail = 0;
        capacitysize = 10;
        arData = [NSMutableArray arrayWithCapacity:capacitysize];
    }
    return self;
}

- (void)enqueue:(id)item
{
    if (head + tail - 1 == arData.count)
    {
        [self resize:capacitysize*2];
    }
    tail++;
    [arData addObject:item];
}

- (id)dequeue
{
    if (self.number > 0)
    {
        head--;
        id temp = [arData objectAtIndex:0];
        [arData removeObjectAtIndex:0];
        if (head>0 && (tail - head + 1) == self.number/4)
        {
            [self resize:self.number/2];
        }
        return temp;
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
    /*
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
     */
    
    /*
    QueueLink *queueLink = [QueueLink new];
    [queueLink enqueue:[NSString stringWithFormat:@"%d", arc4random()]];
    [queueLink enqueue:[NSString stringWithFormat:@"%d", arc4random()]];
    [queueLink enqueue:[NSString stringWithFormat:@"%d", arc4random()]];
    [queueLink enqueue:[NSString stringWithFormat:@"%d", arc4random()]];
    [queueLink show];
    NSLog(@"%@", [queueLink dequeue]);
    NSLog(@"%@", [queueLink dequeue]);
     [queueLink show];
     */
    
    NSArray *ar = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @0];
    ar = [self reverse:ar];
    NSLog(@"%@", ar);
}

- (NSArray *)reverse:(NSArray *)array
{
    NSMutableArray *arTemp = [NSMutableArray new];
    [arTemp addObjectsFromArray:array];
    
    int begin = 0;
    int end = array.count - 1;
    
    while (end > begin)
    {
        id temp = [arTemp objectAtIndex:begin];
        [arTemp replaceObjectAtIndex:begin withObject:[arTemp objectAtIndex:end]];
        [arTemp replaceObjectAtIndex:end withObject:temp];
        
        begin++;
        end--;
    }
    
    return (NSArray *)arTemp;
}

@end
