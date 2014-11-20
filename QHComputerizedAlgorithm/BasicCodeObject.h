//
//  BasicCodeObject.h
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-18.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicCodeObject : NSObject
{
    NSString *_code;
    NSString *_encode;
}

- (void)initCodeData;//子类必须实现

- (void)runingCode;

@end
