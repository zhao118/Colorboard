//
//  BNRColorDescription.h
//  Colorboard
//
//  Created by ZhaoQ on 2022/1/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


//包含用户选择的颜色和颜色名称的对象
@interface BNRColorDescription : NSObject

@property (nonatomic) UIColor *color; //颜色
@property (nonatomic, copy) NSString *name; //颜色名称


@end

NS_ASSUME_NONNULL_END
