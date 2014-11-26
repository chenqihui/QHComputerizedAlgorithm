//
//  SymbolTableDictionary.h
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-26.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "BasicAlgorithmsAndDataStructuresObject.h"

@interface SymbolTableObject : NSObject

@property (nonatomic, strong) id key;
@property (nonatomic, strong) id value;

- (instancetype)initWithKey:(NSString *)key value:(NSString *)value;

@end

@interface SymbolTableDictionary : BasicAlgorithmsAndDataStructuresObject

@end
