//
//  UIImage+image.h
//  03-带有边框的图片裁剪
//
//  Created by xiaomage on 16/5/16.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)

/**
 *  返回一个带有边框的圆形图片
 *
 *  @param borderW     边框大小
 *  @param borderColor 边框颜色
 *  @param image       加裁剪的图片
 *
 *  @return 带有边框的圆形图片
 */
+ (UIImage *)imageWithBorderW:(CGFloat)borderW borderColor:(UIColor *)borderColor image:(UIImage *)image;

@end
