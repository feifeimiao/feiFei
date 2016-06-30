//
//  ZTFPictureTableViewController.m
//  baiSi
//
//  Created by feifei on 16/6/22.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFPictureTableViewController.h"
#import "ZTFAllItem.h"

@interface ZTFPictureTableViewController ()

@end

@implementation ZTFPictureTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.tableView.contentInset = UIEdgeInsetsMake(44+35, 0, 49, 0);

    
    [self loadData:ZTFThemeTypePicture];
}


@end
