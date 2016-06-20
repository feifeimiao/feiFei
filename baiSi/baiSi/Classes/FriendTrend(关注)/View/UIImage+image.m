//
//  UIImage+image.m
//  03-带有边框的图片裁剪
//
//  Created by xiaomage on 16/5/16.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)


+ (UIImage *)imageWithBorderW:(CGFloat)borderW borderColor:(UIColor *)borderColor image:(UIImage *)image{
    
    //1.加载原始图片
    //UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    //2.确定边框宽度
    //CGFloat borderW = 5;
    //3.开启一个位图上下文(宽度= 原始图片宽度+ 2 * 边框宽度 ,原始图片高度+ 2 * 边框宽度)
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContext(size);
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);

    //4.绘制一个大圆,(宽高跟上下文宽高一样)
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [borderColor set];
    [path fill];
    //5.绘制一个小圆(x,y = boderW ,宽高 = 原始图片的宽高)
    UIBezierPath *smallPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    //6.把小圆设置为裁剪区域
    [smallPath addClip];
    //7.把原始图片绘制到上下文当中
    [image drawAtPoint:CGPointMake(borderW, borderW)];
    //8.从上下文当中生成图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //9.关闭上下文
    UIGraphicsEndImageContext();
    return newImage;
}


@end
