//
//  BNRColorVC.h
//  Colorboard
//
//  Created by ZhaoQ on 2022/1/25.
//

#import <UIKit/UIKit.h>
#import "BNRColorDescription.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNRColorVC : UIViewController

//判断是新颜色还是已经存在的颜色
@property (nonatomic) BOOL existingColor;
//正在编辑的颜色(该对象包含颜色和颜色的名称)
@property (nonatomic) BNRColorDescription *colorDescription;

@end

NS_ASSUME_NONNULL_END
