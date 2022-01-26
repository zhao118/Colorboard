//
//  BNRColorDescription.m
//  Colorboard
//
//  Created by ZhaoQ on 2022/1/25.
//

#import "BNRColorDescription.h"

@implementation BNRColorDescription


//初始化构造方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        _color = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
        
        _name = @"Blue";
    }
    return self;
}

@end
