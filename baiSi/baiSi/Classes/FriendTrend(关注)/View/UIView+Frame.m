//
//  UIView+Frame.m
//  小码哥彩票
//
//  Created by xiaomage on 16/5/21.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
//加属性第一种方法,写@dynamic自动生成get,set方法
//@dynamic x;
//@dynamic y;
//@dynamic width;
//@dynamic heigth;

-(CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)heigth {
     return self.frame.size.height;
}

- (void)setHeigth:(CGFloat)heigth {
    CGRect frame = self.frame;
    frame.size.height = heigth;
    self.frame = frame;
}



@end
