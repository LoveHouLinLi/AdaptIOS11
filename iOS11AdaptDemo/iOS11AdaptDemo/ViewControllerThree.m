//
//  ViewControllerThree.m
//  iOS11AdaptDemo
//
//  Created by DeLongYang on 2017/10/19.
//  Copyright © 2017年 DeLongYang. All rights reserved.
/*
    1.0 是为了验证 在iOS11 上 UITableView  和 UIScrollView  是否会出现滑动的现象
    2.0 autoLayout 上出现选择 safeArea 和 边界的多个选项
    3.0 我们实验
 */

#import "ViewControllerThree.h"
#import "TableViewCell.h"
#import "Mode.h"
#import "TestXibViewController.h"

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
    
    /*
       为了验证 在iOS11 上是否会出现这些所谓的问题 我们先加载一个tableview 试试
     */
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"xibCell"];
    
    UIEdgeInsets insets = self.tableView.contentInset;
    NSLog(@"tableview insets is %@",NSStringFromUIEdgeInsets(insets));
    UIEdgeInsets safeAreaInsets = self.view.safeAreaInsets;
     NSLog(@"view safeArea insets is %@",NSStringFromUIEdgeInsets(safeAreaInsets));
    //
    UIEdgeInsets addtionalSafeAreaInsets = self.additionalSafeAreaInsets;
    NSLog(@"addtional safe area insets is %@",NSStringFromUIEdgeInsets(addtionalSafeAreaInsets));
    
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
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xibCell"];
//    NSInteger row = indexPath.row;
//    if (row<[self.dataSource count]) {
//        Mode *mode = self.dataSource[row];
//    }
    
    if (indexPath.row == 0) {
        cell.nameLable.textColor = [UIColor redColor];
    }else{
        cell.nameLable.textColor = [UIColor blackColor];
    }
    
    return  cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark ----  UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark ---- 点击改变 安全区域 点击
- (IBAction)changeAjustContentInsetClick:(id)sender
{
    // tableView 的adjustedContent 是只读属性
//    self.tableView.adjustedContentInset = UIEdgeInsetsMake(0, 50, 0, 0);
    TestXibViewController *tesxXibVC = [[TestXibViewController alloc] initWithNibName:@"TestXibViewController" bundle:nil];
    [self.navigationController pushViewController:tesxXibVC animated:YES];
    
}

#pragma mark ---- iOS11 新增tableView UISwipe 动作
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //删除
    if (@available(iOS 11.0, *)) {
        
        //
        /*
          这有个问题是 设置进去的图片都变成了白色
          然后就是 icon 和 name 都靠近顶部。
         */
        UIContextualAction *deleteRowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"delete" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
            
//            [self.titleArr removeObjectAtIndex:indexPath.row];
            [self.dataSource removeObjectAtIndex:indexPath.row];
            [self.tableView reloadData];
            completionHandler (YES);
        }];
        deleteRowAction.image = [UIImage imageNamed:@"icon_activity_press"];
        deleteRowAction.backgroundColor = [UIColor redColor];
        
        
        UIContextualAction *collectAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"collect" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
           
            //
            NSLog(@"collect indexPath row %ld",indexPath.row);
            
            completionHandler(YES);
        }];
        collectAction.image = [UIImage imageNamed:@"icon_regiment_press"];
        collectAction.backgroundColor = [UIColor brownColor];
        
        
        UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[deleteRowAction,collectAction]];
        return config;
    } else {
        // Fallback on earlier versions
        return nil;
    }
    
    
}









@end
