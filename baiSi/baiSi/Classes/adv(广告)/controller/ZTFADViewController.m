//
//  ZTFADViewController.m
//  baiSi
//
//  Created by feifei on 16/6/18.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFADViewController.h"

#import <AFNetworking/AFNetworking.h>

#import "ZTFTabBarViewController.h"

#import "ZTFAD.h"

#import <UIImageView+WebCache.h>

#import <MJExtension/MJExtension.h>
@interface ZTFADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *adImageView;
@property (weak, nonatomic) IBOutlet UIView *adView;
@property (weak, nonatomic) IBOutlet UIButton *jump;

@property (weak , nonatomic) NSTimer  *timt;

@end

@implementation ZTFADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setAdimageView];
    
    [self loadAD];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(change) userInfo:nil repeats:YES];
}

- (IBAction)jumpcl {
    
    
//    [UIView animateWithDuration:1 animations:^{
            [UIApplication sharedApplication].keyWindow.rootViewController = [[ZTFTabBarViewController alloc]init];
        
//    }];

    [_timt invalidate];
    
    
}

- (void)change
{
    static int i =3;
    
    i--;
    [_jump setTitle:[NSString stringWithFormat:@"跳过 (%d)",i] forState:UIControlStateNormal];
    
    if (i == -1) {
        // 广告界面结束
        
        [self jumpcl];
        
    }

}

//获取广告数据
- (void)loadAD
{
    //创建请求

    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //拼接
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"code2"] = ZTFCode2;
    
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
//
        //将写好的plist文件 转模型
        NSDictionary *dic = [responseObject[@"ad"] firstObject];
        
        ZTFAD *ad = [ZTFAD mj_objectWithKeyValues:dic];
        
        UIImageView *adView = [[UIImageView alloc] init];
        [self.adView addSubview:adView];
        
        CGFloat h = ZTFScreenW / ad.w * ad.h;
        
        if (h > ZTFScreenH * 0.8) {
            h = ZTFScreenH * 0.8;
        }
        
        adView.frame = CGRectMake(0, 0, ZTFScreenW, h);
        
        // 加载图片
        [adView sd_setImageWithURL:[NSURL URLWithString:ad.w_picurl]];
        

//        NSLog(@"%@",responseObject);
//        [responseObject writeToFile:@"/Users/zhao/Desktop/ad.plist" atomically:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
    
    
}
//屏幕适配
- (void)setAdimageView{
    
    UIImage *image = nil;
    if (iPhone6P) {
        image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (iPhone6) {
        image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iPhone5) {
        image = [UIImage imageNamed:@"LaunchImage-568h"];
    } else if (iPhone4) {
        image = [UIImage imageNamed:@"LaunchImage"];
    }
    
    _adImageView.image = image;
}
@end

