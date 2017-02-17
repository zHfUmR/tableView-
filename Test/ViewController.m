//
//  ViewController.m
//  Test
//
//  Created by GES-iMac on 17/2/13.
//  Copyright © 2017年 GES-iMac. All rights reserved.
//

#import "ViewController.h"

#import "SingleSelectionViewController.h"
#import "MoreSelectionViewController.h"


@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //single selection button
    UIButton *singleBtn = [UIButton new];
    singleBtn.frame = CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 44);
    [singleBtn setTitle:@"Single Selection tableView" forState:(UIControlStateNormal)];
    [singleBtn addTarget:self action:@selector(pushSingleVC) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:singleBtn];
    
    UIButton *MoreBtn = [UIButton new];
    MoreBtn.frame = CGRectMake(0, 154, CGRectGetWidth(self.view.bounds), 44);
    [MoreBtn setTitle:@"More Selection tableView" forState:(UIControlStateNormal)];
    [MoreBtn addTarget:self action:@selector(pushMoreVC) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:MoreBtn];
    
   
    
}

- (void)pushSingleVC {
    SingleSelectionViewController *singleVC = [[SingleSelectionViewController alloc] init];
    [self.navigationController pushViewController:singleVC animated:YES];
}

- (void)pushMoreVC {
    MoreSelectionViewController *moreVC = [[MoreSelectionViewController alloc] init];
    [self.navigationController pushViewController:moreVC animated:YES];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
