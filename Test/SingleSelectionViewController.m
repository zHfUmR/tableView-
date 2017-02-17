//
//  SingleSelectionViewController.m
//  Test
//
//  Created by GES-iMac on 17/2/13.
//  Copyright © 2017年 GES-iMac. All rights reserved.
//

#import "SingleSelectionViewController.h"

@interface SingleSelectionViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,assign) NSIndexPath *indexPath;//记录选中的当前行数

@property (nonatomic,strong) UITableView *tableView;
@end

@implementation SingleSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Single Selection";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)+64) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%zi列,第%zi行",indexPath.section,indexPath.row];
    
    //复用处理 -- 单选
    if (_indexPath == indexPath) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *celled = [tableView cellForRowAtIndexPath:_indexPath];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (_indexPath == indexPath) {
        celled.accessoryType = UITableViewCellAccessoryNone;
        cell.accessoryType = UITableViewCellAccessoryNone;
        _indexPath = nil;
    }else{
        //之前选中的取消选中
        celled.accessoryType = UITableViewCellAccessoryNone;
        //记录当前选中的位置索引
        _indexPath = indexPath;
        //当前选择的打勾
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    [tableView reloadData];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 50;
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
