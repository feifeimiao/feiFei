//
//  ZTFNewViewController.m
//  baiSi
//
//  Created by feifei on 16/6/15.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFNewViewController.h"

#import "ZTFnnnTableViewController.h"

@interface ZTFNewViewController ()

@end

@implementation ZTFNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self setnb];

}

- (void)setnb{

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(subtag)];


}

- (void)subtag{

    ZTFnnnTableViewController *nnn = [[ZTFnnnTableViewController alloc]init];
    
    nnn.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:nnn animated:YES];

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
