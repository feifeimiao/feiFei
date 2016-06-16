//
//  ZTFMyViewController.m
//  baiSi
//
//  Created by feifei on 16/6/15.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFMyViewController.h"

#import "ZTFSetTableViewController.h"

@interface ZTFMyViewController ()

@end

@implementation ZTFMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    
    [self setnb];
}

- (void)setnb{
    
    
    self.navigationItem.title = @"个人中心";
    
    UIBarButtonItem *item0 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] highImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(setting)];
    
    UIBarButtonItem *item1 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] selImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(night:)];

    
    self.navigationItem.rightBarButtonItems = @[item0,item1];


}

- (void)night:(UIButton *)but{

    but.selected = !but.selected;

}

- (void)setting{
    
    ZTFSetTableViewController *set = [[ZTFSetTableViewController alloc]init];
    
    [self.navigationController pushViewController:set animated:YES];

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
