//
//  ZTFNaviViewController.m
//  baiSi
//
//  Created by feifei on 16/6/15.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFNaviViewController.h"

@interface ZTFNaviViewController ()

@end

@implementation ZTFNaviViewController

+(void)load
{
    UINavigationBar *nb = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[ZTFNaviViewController class]]];
    [nb setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
