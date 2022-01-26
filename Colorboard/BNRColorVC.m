//
//  BNRColorVC.m
//  Colorboard
//
//  Created by ZhaoQ on 2022/1/25.
//

#import "BNRColorVC.h"
#import "BNRColorDescription.h"

@interface BNRColorVC ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;

@property (weak, nonatomic) IBOutlet UISlider *greenSlider;

@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@end

@implementation BNRColorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *color = self.colorDescription.color;
    
    //从UIColor中对象中取出RGB颜色分量
    float red, green, blue;
    [color getRed:&red green:&green blue:&blue alpha:nil];
    
    //初始化UISlider滑块的值
    self.redSlider.value = red;
    self.greenSlider.value = green;
    self.blueSlider.value = blue;
    
    //初始化view的背景颜色和颜色名称
    self.view.backgroundColor = color;
    self.textField.text = self.colorDescription.name;
    
    
}

- (IBAction)dismiss:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)changeColor:(id)sender {
    
    float red = self.redSlider.value;
    float green = self.greenSlider.value;
    float blue = self.blueSlider.value;
    
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    self.view.backgroundColor = newColor;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //如果颜色已经存在,就移除Done按钮
    if (self.existingColor) {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    //当视图消失时保存颜色和颜色名称
    [super viewWillDisappear:animated];
    
    self.colorDescription.name = self.textField.text;
    self.colorDescription.color = self.view.backgroundColor;
}

@end
