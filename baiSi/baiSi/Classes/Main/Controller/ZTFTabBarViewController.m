//
//  ZTFTabBarViewController.m
//  baiSi
//
//  Created by feifei on 16/6/15.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//
#import "ZTFEssenceViewController.h"
#import "ZTFTabBarViewController.h"

#import "ZTFNaviViewController.h"

#import "ZTFMyViewController.h"

#import "ZTFPublicViewController.h"

#import "ZTFNewViewController.h"

#import "ZTFFriendTrendViewController.h"

@interface ZTFTabBarViewController ()

@end

@implementation ZTFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self addAllChildViewController];
    
}

- (void)addAllChildViewController
{
    ZTFEssenceViewController *es = [[ZTFEssenceViewController alloc]init];
    
    [self addOneChildView:es];
    
    
    ZTFNewViewController *new = [[ZTFNewViewController alloc]init];
    
    [self addOneChildView:new];
    
    ZTFPublicViewController *pub = [[ZTFPublicViewController alloc]init];
    [self addOneChildView:pub];
    
    ZTFFriendTrendViewController *frind = [[ZTFFriendTrendViewController alloc]init];
    [self addOneChildView:frind];
    
    ZTFMyViewController *my = [[ZTFMyViewController alloc]init];
    [self addOneChildView:my];
    
}

- (void) addOneChildView:(UIViewController *)vc
{
    ZTFNaviViewController *nvc = [[ZTFNaviViewController alloc]initWithRootViewController:vc];
    
    
    nvc.tabBarItem.

    [self addChildViewController:nvc];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
