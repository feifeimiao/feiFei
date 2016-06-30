//
//  ZTFThemePictureView.h
//  baiSi
//
//  Created by feifei on 16/6/27.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZTFAllItem;
@interface ZTFThemePictureView : UIView

@property (strong , nonatomic) ZTFAllItem *item;

+ (instancetype)pictureTheme;
@end
