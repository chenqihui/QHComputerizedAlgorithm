//
//  BasicSuperCoolAlgorithms.h
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-12-1.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicSuperCoolAlgorithms : NSObject
{
    NSString *_code;
    NSString *_encode;
}

- (void)initCodeData;//子类必须实现

- (void)runingCode;

@end
