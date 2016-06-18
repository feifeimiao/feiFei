//
//  ZTFADViewController.m
//  baiSi
//
//  Created by feifei on 16/6/18.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFADViewController.h"

#import <AFNetworking/AFNetworking.h>
@interface ZTFADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *adImageView;
@property (weak, nonatomic) IBOutlet UIView *adView;
@property (weak, nonatomic) IBOutlet UIButton *jump;

@end

@implementation ZTFADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setAdimageView];
    
    [self loadAD];
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
        
        NSLog(@"%@",responseObject);
        [responseObject writeToFile:@"/Users/zhao/Desktop/ad.plist" atomically:YES];
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

