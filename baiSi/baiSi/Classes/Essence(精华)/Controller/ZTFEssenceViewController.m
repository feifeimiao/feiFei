//
//  ZTFEssenceViewController.m
//  baiSi
//
//  Created by feifei on 16/6/15.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFEssenceViewController.h"

@interface ZTFEssenceViewController ()

@end

@implementation ZTFEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setNB];
    
    self.view.backgroundColor = [UIColor redColor];
    
}

-(void)setNB{

    //导航条中间
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //导航条left
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"nav_item_game_icon"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"nav_item_game_click_icon"] forState:UIControlStateHighlighted];
    [leftBtn sizeToFit];
    [leftBtn addTarget:self action:@selector(ClicLeftButten) forControlEvents:UIControlEventTouchUpOutside];


    UIView *vi = [[UIView alloc]initWithFrame:leftBtn.bounds];
    [vi addSubview:leftBtn];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:vi];
    

    
}

- (void)ClicLeftButten
{
    NSLog(@"left");
}
@end
