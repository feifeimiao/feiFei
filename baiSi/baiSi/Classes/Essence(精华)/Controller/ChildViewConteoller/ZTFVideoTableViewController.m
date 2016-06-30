//
//  ZTFVideoTableViewController.m
//  baiSi
//
//  Created by feifei on 16/6/22.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFVideoTableViewController.h"
#import "ZTFAllItem.h"

@interface ZTFVideoTableViewController ()

@end

@implementation ZTFVideoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.tableView.contentInset = UIEdgeInsetsMake(44+20+35, 0, 49, 0);


    [self loadData:ZTFThemeTypeVideo];
}
@end
