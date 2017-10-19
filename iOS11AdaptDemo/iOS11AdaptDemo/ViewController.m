//
//  ViewController.m
//  iOS11AdaptDemo
//
//  Created by DeLongYang on 2017/10/18.
//  Copyright © 2017年 DeLongYang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setNaviBarStyle];
}

#pragma mark ----  设置 导航栏的 样式

/**
 设置之后整个 navigation 里面的viewControllers 导航栏的style 都是可以的
 并不是整个APP的 所有 navigation 都会出现改变
 */
- (void)setNaviBarStyle
{
    self.navigationController.navigationBar.prefersLargeTitles = true;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---- UISearchBarController Delegate
/*
   但是效果不太 理想 
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    return cell;
}


@end
