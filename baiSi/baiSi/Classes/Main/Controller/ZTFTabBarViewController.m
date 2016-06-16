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

+ (void)load
{
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[ZTFTabBarViewController class]]];
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];

    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:14];
    
    [item setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    [item setTitleTextAttributes:dic forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.backgroundColor = [UIColor whiteColor];
    [self addAllChildViewController];
    
    [self addBut];
}

//添加tab中间item
-(void)addBut
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
    
    [btn sizeToFit];
    
    btn.center = CGPointMake(ZTFScreenW * 0.5, self.tabBar.frame.size.height * 0.5);
    
    [self.tabBar addSubview:btn];
    
}

//添加tab所有子控件
- (void)addAllChildViewController
{
    ZTFEssenceViewController *es = [[ZTFEssenceViewController alloc]init];
    
    [self addOneChildView:es image:[UIImage imageNamed:@"tabBar_essence_icon"] selImage:[UIImage imageNamed:@"tabBar_essence_click_icon"] name:@"精华"];
    
    
    ZTFNewViewController *new = [[ZTFNewViewController alloc]init];
    [self addOneChildView:new image:[UIImage imageNamed:@"tabBar_friendTrends_icon"] selImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] name: @"新的"];
    
    ZTFPublicViewController *pub = [[ZTFPublicViewController alloc]init];
     
     [self addChildViewController:pub];
    pub.tabBarItem.enabled = NO;
    
    ZTFFriendTrendViewController *frind = [[ZTFFriendTrendViewController alloc]init];
    [self addOneChildView:frind image:[UIImage imageNamed:@"tabBar_friendTrends_icon"] selImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] name:@"关注"];
    
    ZTFMyViewController *my = [[ZTFMyViewController alloc]init];
      [self addOneChildView:my image:[UIImage imageNamed:@"tabBar_me_icon"] selImage:[UIImage imageNamed:@"tabBar_me_click_icon"] name:@"个人"];
    
}
//  添加一个子控件
- (void) addOneChildView:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage name:(NSString *)name
{
    ZTFNaviViewController *nvc = [[ZTFNaviViewController alloc]initWithRootViewController:vc];
    
    
    nvc.tabBarItem.title = name;
    nvc.tabBarItem.image = image;
    
    nvc.tabBarItem.selectedImage = selImage;
    
    [self addChildViewController:nvc];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
