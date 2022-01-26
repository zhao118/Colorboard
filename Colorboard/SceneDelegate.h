//
//  SceneDelegate.h
//  Colorboard
//
//  Created by ZhaoQ on 2022/1/25.
//

#import <UIKit/UIKit.h>

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>


//因为项目有了Storyboard文件,在载入Storyboard和其包含的UIViewController对象时,会创建一个UIWindow对象.502
//并将SB文件中的初始化视图控制器设置为UIWindow对象的根视图控制器.这一且都是自动设置,无需在手动设置window的根视图控制器
@property (strong, nonatomic) UIWindow * window;

@end

