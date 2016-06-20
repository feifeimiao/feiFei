//
//  ZTFFriendTrendViewController.m
//  baiSi
//
//  Created by feifei on 16/6/15.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFFriendTrendViewController.h"

#import "ZTFLoginViewController.h"

@interface ZTFFriendTrendViewController ()

@end

@implementation ZTFFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor lightGrayColor];

    [self setnaB];
    
}
- (IBAction)modaLogin:(id)sender {
    ZTFLoginViewController *log = [[ZTFLoginViewController alloc]init];
    
    [self presentViewController:log animated:YES completion:nil];
    
}

- (void)setnaB{
    
    

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] highImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:nil];


}

@end
