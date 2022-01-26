//
//  BNRPaletteTableVC.m
//  Colorboard
//
//  Created by ZhaoQ on 2022/1/25.
//

#import "BNRPaletteTableVC.h"
#import "BNRColorVC.h"
#import "BNRColorDescription.h"

@interface BNRPaletteTableVC ()

//类的扩展中添加属性(私有的)
@property (nonatomic) NSMutableArray *colors;


@end

@implementation BNRPaletteTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
    
}

//colors的取方法(与属性同名),添加一个BNRColorDescription对象
- (NSMutableArray *)colors {
    if (!_colors) {
        _colors = [NSMutableArray array];
        
        //测试2-1:向colors数组中添加一个颜色(BNRColorDescription对象)用于测试.516
        BNRColorDescription *cd = [[BNRColorDescription alloc]  init];
        [_colors addObject:cd];
    }
    
    return _colors;
}


//根据UIStoryboardSegue的indetifier来判断.528
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //点击+按钮触发的segue
    if ([segue.identifier isEqualToString:@"NewColor"]) {
        //如果是添加新的颜色
        //就创建一个BNRColorDescription对象并将其添加到colors数组中
        BNRColorDescription *color = [[BNRColorDescription alloc] init];
        [self.colors addObject:color];
        
        //通过UIStoryboardSegue对象设置BNRColorViewController对象的颜色(colorDescription属性)
        //"NewColor"segue的destinationVC(目的地视图控制器)是UINavigationController
        UINavigationController *nc = (UINavigationController *)segue.destinationViewController;
        //导航视图控制器的最顶层的视图控制器为BNRColorVC对象的指针
        BNRColorVC *mvc = (BNRColorVC *)[nc topViewController];
        
        mvc.colorDescription = color;
    
    }else if ([segue.identifier isEqualToString:@"ExistingColor"]) {
        
        //对于push样式的UIStoryboardSegue对象,sender是UITableViewCell对象
        NSIndexPath *ip = [self.tableView indexPathForCell:sender];
        BNRColorDescription *color = self.colors[ip.row];
        
        //设置BNRColorViewController对象的颜色,同时设置其existingColor属性为YES(该颜色已经存在)
        //"ExistingColor"segue的destinationVC(目的地视图控制器)是BNRColorVC
        BNRColorVC *cvc = (BNRColorVC *)segue.destinationViewController;
        cvc.colorDescription = color;
        cvc.existingColor = YES; //yes代表颜色已经存在
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.colors count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //在SB中的属性检查器中设置(注册)了可重用的cell的可重用的标识符
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    //测试2-2:
    BNRColorDescription *color = self.colors[indexPath.row];
    cell.textLabel.text = color.name;
    
    cell.backgroundColor = UIColor.redColor;
    
    
    
    return cell;
}

//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    BNRColorVC *colorVC = [[BNRColorVC alloc] init];
//    [self.navigationController pushViewController:colorVC animated:YES];
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
