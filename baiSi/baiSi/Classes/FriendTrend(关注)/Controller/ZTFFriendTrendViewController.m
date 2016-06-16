//
//  ZTFFriendTrendViewController.m
//  baiSi
//
//  Created by feifei on 16/6/15.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFFriendTrendViewController.h"

@interface ZTFFriendTrendViewController ()

@end

@implementation ZTFFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor orangeColor];

    [self setnaB];
    
}

- (void)setnaB{
    
    

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] highImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:nil];


}

@end
