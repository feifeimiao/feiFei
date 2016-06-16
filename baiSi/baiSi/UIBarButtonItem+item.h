//
//  UIBarButtonItem+item.h
//  baiSi
//
//  Created by feifei on 16/6/16.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (item)
+ (instancetype)itemWithImage:(UIImage *)image highImage:(UIImage *)hightImage target:( id)target action:(SEL)action;

+ (instancetype)itemWithImage:(UIImage *)image selImage:(UIImage *)selImage target:( id)target action:(SEL)action;
@end
