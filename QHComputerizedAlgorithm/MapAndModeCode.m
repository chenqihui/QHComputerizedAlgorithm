//
//  MapAndModeCode.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-20.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "MapAndModeCode.h"

/*
 计算机算法：数据压缩之图编码和模式替换（3）：http://blog.jobbole.com/79952/
 */
@implementation MapAndModeCode

/*
 图编码：
 被称之为“图”的字符串几乎会出现在所有自然语言中。日常英语中就有些图，例如“the”，“and”，“ing”（例如在“waiting”中），“aa”，“tt”，“ee”这些双字母。
 另一方面，在日常英语中有很多包含双字母的字符串，而这些情况在游程编码中并不能有效地被压缩，这样导致压缩效率非常低。
 在理解了图编码的基本规则之后，最好的替代双字母的方法是，用“#”符号替代“cc”，用“@”替代“ss”，用“%”替代“ll”。
 */
/*
 模式替换：
 但是如果输入字符串中包含“# @ %”这些符号怎么办呢？而且我们也不能确定的说在输入字符串中有足够多的双字母让我们有理由去替换它们。一个更好的方式是模式替换。
 模式替换算法是图编码的一种变形。我在上面说过，在日常英语中“ the ”这种单词会经常出现。我们现在可以把它替换为类似于“$%”这样的字符。如果输入字符串是“I send the message”，那么压缩之后变成了“I send$%message”。但是这种方法也有一些缺陷。
 缺陷：
 第一个问题是我们需要知道了解将要被压缩的这门语言。
 第二个问题是关于解压缩。
 
 应用：
 压缩编程语言，如css等会有优势
 
 */
- (void)initCodeData
{
}

- (void)runingCode
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ios-basic" ofType:@"css"];
    
    NSString *encodeContent = [self modeEncode:filePath];
    NSLog(@"%@", encodeContent);
}

- (NSString *)modeEncode:(NSString *)filePath
{
    _encode = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    if (_encode != nil)
    {
        NSDictionary *dic = @{@"n":@"$0", @"text":@"$1", @"color":@"$2", @"display":@"$3", @"font":@"$4", @"width":@"$5", @"height":@"$6", @" ":@""};
        [dic enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop)
        {
            _encode = [_encode stringByReplacingOccurrencesOfString:key withString:obj];
        }];
    }
    
    //ios-basic.css由11KB到10KB，如果加入对应的字典的话，效果不明显
    NSString *encodeFilePath = [NSString stringWithFormat:@"%@/encode-ios-basic.css", [self documentsDirectoryPath]];
    [_encode writeToFile:encodeFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    return _encode;
}

- (NSString *)documentsDirectoryPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask,
                                                         YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

@end
