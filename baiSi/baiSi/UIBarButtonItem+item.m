//
//  UIBarButtonItem+item.m
//  baiSi
//
//  Created by feifei on 16/6/16.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "UIBarButtonItem+item.h"

#import "ZTFButton.h"

@implementation UIBarButtonItem (item)

+ (instancetype)itemWithImage:(UIImage *)image highImage:(UIImage *)hightImage target:(id)target action:(SEL)action
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [leftBtn setImage:image forState:UIControlStateNormal];
    
    [leftBtn setImage:hightImage forState:UIControlStateHighlighted];
    
    [leftBtn sizeToFit];
    
    [leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    UIView *vi = [[UIView alloc]initWithFrame:leftBtn.bounds];
    
    [vi addSubview:leftBtn];
    
    return  [[UIBarButtonItem alloc]initWithCustomView:vi];

}
+ (instancetype)itemWithImage:(UIImage *)image selImage:(UIImage *)selImage target:( id)target action:(SEL)action{

    ZTFButton *leftBtn = [ZTFButton buttonWithType:UIButtonTypeCustom];
    
    [leftBtn setImage:image forState:UIControlStateNormal];
    
    [leftBtn setImage:selImage forState:UIControlStateSelected];
    
    [leftBtn sizeToFit];
    
    [leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    UIView *vi = [[UIView alloc]initWithFrame:leftBtn.bounds];
    
    [vi addSubview:leftBtn];
    
    return  [[UIBarButtonItem alloc]initWithCustomView:vi];

}
@end
