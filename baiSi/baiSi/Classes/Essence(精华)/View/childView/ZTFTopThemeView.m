//
//  ZTFTopThemeView.m
//  baiSi
//
//  Created by feifei on 16/6/25.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFTopThemeView.h"
#import "ZTFAllItem.h"
#import <UIImageView+WebCache.h>
@interface ZTFTopThemeView ()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *text;

@property (weak, nonatomic) IBOutlet UILabel *time;

@end


@implementation ZTFTopThemeView

- (void)setItem:(ZTFAllItem *)item
{
    _item = item;
    

    
    [_image sd_setImageWithURL:[NSURL URLWithString:item.profile_image]];
    
    _name.text = item.name;
    
    _time.text = item.passtime;
    
    _text.text = item.text;
    
    
}

+ (instancetype)topTheme
{

    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]firstObject];
}

@end
