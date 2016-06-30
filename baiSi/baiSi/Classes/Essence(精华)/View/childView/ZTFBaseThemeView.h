//
//  ZTFBaseThemeView.h
//  baiSi
//
//  Created by feifei on 16/6/28.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZTFAllItem;
@interface ZTFBaseThemeView : UIView

@property (strong , nonatomic) ZTFAllItem *item;
+ (instancetype)topTheme;
@end
