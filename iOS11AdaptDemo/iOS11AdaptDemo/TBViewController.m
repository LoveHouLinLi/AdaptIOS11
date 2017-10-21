//
//  TBViewController.m
//  iOS11AdaptDemo
//
//  Created by DeLongYang on 2017/10/21.
//  Copyright © 2017年 DeLongYang. All rights reserved.
//

#import "TBViewController.h"

//屏幕宽高和宽
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface TBViewController ()

@end

@implementation TBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self adaptHeader];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----  适配UI

- (void)adaptHeader
{
    // 状态栏(statusbar)
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    NSLog(@"status width - %f", rectStatus.size.width); // 宽度
    NSLog(@"status height - %f", rectStatus.size.height);  // 高度
    
    
    // 导航栏（navigationbar）
    CGRect rectNav = self.navigationController.navigationBar.frame;
    NSLog(@"nav width - %f", rectNav.size.width); // 宽度
    NSLog(@"nav height - %f", rectNav.size.height);  // 高度
    
    //
    CGRect tabbarRect = self.tabBarController.tabBar.frame;
    NSLog(@"tabar width is - %f",tabbarRect.size.width);
    NSLog(@"tabbar height is - %f",tabbarRect.size.height);
    
    self.edgesForExtendedLayout= UIRectEdgeNone;
    //
    CGFloat headHeight = rectStatus.size.height+rectNav.size.height;
    CGFloat tailerHeight = 0.0f;
//    if (self.tabBarController.tabBar.isHidden == YES) {
////        NSLog(@"tabar is hide");
//        tailerHeight = tabbarRect.size.height;
//    }else{
//        tailerHeight = tabbarRect.size.height;
////        NSLog(@"tabbar no hide");
//    }
    
//    tailerHeight = 200;
    NSLog(@"tailer height is - %f",tailerHeight);
    CGRect rect = CGRectMake(0, headHeight,SCREEN_WIDTH, SCREEN_HEIGHT-headHeight-tailerHeight);
    self.view.frame=rect;
    self.view.backgroundColor = [UIColor redColor];
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
