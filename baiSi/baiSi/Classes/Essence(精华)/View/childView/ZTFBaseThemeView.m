//
//  ZTFBaseThemeView.m
//  baiSi
//
//  Created by feifei on 16/6/28.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFBaseThemeView.h"

@implementation ZTFBaseThemeView

+ (instancetype)topTheme
{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]firstObject];
}


@end
