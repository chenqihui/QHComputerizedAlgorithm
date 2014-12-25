//
//  InvertedIndexMapReduce.h
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-12-25.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "BasicAlgorithmsItemBank.h"

@interface Mapper : NSObject

@property (nonatomic, retain) id object;
@property (nonatomic, retain) NSString *keyInfo;
@property (nonatomic, retain) NSString *valueInfo;
@property (nonatomic, retain) NSString *count;

@end

@interface InvertedIndexMapReduce : BasicAlgorithmsItemBank

@end
