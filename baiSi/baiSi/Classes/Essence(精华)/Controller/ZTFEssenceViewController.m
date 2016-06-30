//
//  ZTFEssenceViewController.m
//  baiSi
//
//  Created by feifei on 16/6/15.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFEssenceViewController.h"
@interface ZTFEssenceViewController()
@end

@implementation ZTFEssenceViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNB];
    
    
}
#pragma mark - 设置导航条
-(void)setNB{

    //导航条中间
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //导航条left
  self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_icon"] highImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(ClicLeftButten)];

    //right
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandom"] highImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(ClickRight)];
    
}


- (void)ClickRight
{
    NSLog(@"Right");
}
- (void)ClicLeftButten
{
    NSLog(@"dsfasd");
}

@end
