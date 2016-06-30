//
//  ZTFTextTableViewController.m
//  baiSi
//
//  Created by feifei on 16/6/22.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFTextTableViewController.h"
#import "ZTFAllItem.h"
@interface ZTFTextTableViewController ()

@end

@implementation ZTFTextTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.tableView.contentInset = UIEdgeInsetsMake(44+20+35, 0, 49, 0);

    [self loadData:ZTFThemeTypeText];
    
}



@end
