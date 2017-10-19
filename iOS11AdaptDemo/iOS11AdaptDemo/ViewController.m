//
//  ViewController.m
//  iOS11AdaptDemo
//
//  Created by DeLongYang on 2017/10/18.
//  Copyright © 2017年 DeLongYang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setNaviBarStyle];
}

#pragma mark ----  设置 导航栏的 样式

/**
 设置之后整个
 */
- (void)setNaviBarStyle
{
    self.navigationController.navigationBar.prefersLargeTitles = true;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
