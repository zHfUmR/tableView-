//
//  MoreSelectionViewController.m
//  Test
//
//  Created by GES-iMac on 17/2/13.
//  Copyright © 2017年 GES-iMac. All rights reserved.
//

#import "MoreSelectionViewController.h"

@interface MoreSelectionViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *selectIndexArray;

@end

@implementation MoreSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"More Selection";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)+64) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%zi列,第%zi行",indexPath.section,indexPath.row];
    
    //设置勾选
    cell.accessoryType = UITableViewCellAccessoryNone;
    for (NSIndexPath *index in self.selectIndexArray) {
        if (index == indexPath) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            break;
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //获取点击的cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {//如果选中
        cell.accessoryType = UITableViewCellAccessoryNone;//切换为未选中
        [self.selectIndexArray removeObject:indexPath];//数据移除
    }else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;//切换为未选中
        [self.selectIndexArray addObject:indexPath];//数据移除
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 50;
}

- (NSMutableArray *)selectIndexArray {
    if (!_selectIndexArray) {
        _selectIndexArray = [NSMutableArray array];
    }
    return _selectIndexArray;
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
