//
//  ViewControllerOne.m
//  iOS11AdaptDemo
//
//  Created by DeLongYang on 2017/10/18.
//  Copyright © 2017年 DeLongYang. All rights reserved.
/*
     我们试下 UITableView  的适配看下是否会出现这种情况
 */

#import "ViewControllerOne.h"

@interface ViewControllerOne ()

@end

@implementation ViewControllerOne

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    //  这句话 只会影响后面的navi  不会影响前面的出栈的ViewController
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
