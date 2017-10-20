//
//  ViewControllerThree.m
//  iOS11AdaptDemo
//
//  Created by DeLongYang on 2017/10/19.
//  Copyright © 2017年 DeLongYang. All rights reserved.
/*
    是为了验证 在iOS11 上 UITableView  和 UIScrollView  是否会出现滑动的现象
 */

#import "ViewControllerThree.h"
#import "TableViewCell.h"
#import "Mode.h"

@interface ViewControllerThree ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataSource;




@end

@implementation ViewControllerThree

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i = 0;i<30; i++)
    {
        Mode *mode = [[Mode alloc] init];
        [self.dataSource addObject:mode];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ---- getter
- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


#pragma mark ---- UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-  (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //  我们标记 第一行的
    return  nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.dataSource.count;
}


#pragma mark ----  UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}








@end
