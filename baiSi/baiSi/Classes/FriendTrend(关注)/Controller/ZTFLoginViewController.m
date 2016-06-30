//
//  ZTFLoginViewController.m
//  baiSi
//
//  Created by feifei on 16/6/20.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFLoginViewController.h"

#import "ZTFLoginReView.h"

#import <UIView+AutoLayout.h>

#import "UIView+Frame.h"

@interface ZTFLoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *loView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *left;

@end

@implementation ZTFLoginViewController

- (IBAction)reClick:(UIButton *)sender {
      sender.selected = !sender.selected;
    _left.constant =_left.constant == 0 ? - ZTFScreenW : 0;
    
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (IBAction)backClick:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    ZTFLoginReView *lv = [ZTFLoginReView logView];

    
    [_loView addSubview:lv];
    
    ZTFLoginReView *lv2 = [ZTFLoginReView regisView];
    
    
    [_loView addSubview:lv2];
    
//    [lv autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    UIView *vie = _loView.subviews[0];
    
    vie.frame = CGRectMake(0,  0, _loView.width*0.5, _loView.heigth);
    
    UIView *vie2 = _loView.subviews[1];
    
    vie2.frame = CGRectMake(_loView.width*0.5, 0, _loView.width*0.5, _loView.heigth);
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
