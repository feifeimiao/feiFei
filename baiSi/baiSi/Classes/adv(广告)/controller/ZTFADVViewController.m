//
//  ZTFADVViewController.m
//  baiSi
//
//  Created by feifei on 16/6/18.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFADVViewController.h"


@interface ZTFADVViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *adImageView;

@end

@implementation ZTFADVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

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
