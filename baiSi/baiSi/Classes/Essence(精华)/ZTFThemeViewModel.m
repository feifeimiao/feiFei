//
//  ZTFThemeViewModel.m
//  baiSi
//
//  Created by feifei on 16/6/27.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFThemeViewModel.h"

#import "ZTFAllItem.h"

@implementation ZTFThemeViewModel

- (void)setItem:(ZTFAllItem *)item
{
    _item = item;
    //topView的frame
    CGFloat topX = 0;
    CGFloat topY = 0;
    CGFloat topW = ZTFScreenW;
    
    CGFloat originY = 68;
    
    CGFloat margin = 10;
    
    //text高度计算
    
    CGFloat textH  = [item.text sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(ZTFScreenW - 2*margin, MAXFLOAT)].height;
    CGFloat topH = originY  + textH;
    
    _topViewFrame = CGRectMake(topX, topY, topW,topH );
    
    _cellH = CGRectGetMaxY(_topViewFrame) + margin;
    
    if (item.type != ZTFThemeTypeText) {
        
        CGFloat pictX = margin;
        
        CGFloat pictY = _cellH;
        
        CGFloat pictW = ZTFScreenW - 2*margin;
        
        CGFloat pictH = pictW / item.width * item.height;
        
        if (pictH > ZTFScreenH) {
            
            pictH = 300;
            
            item.is_big = YES;
        }
        
        _pictureViewFrame = CGRectMake(pictX, pictY, pictW, pictH);
        
        _cellH = CGRectGetMaxY(_pictureViewFrame) + margin;
        
    }
    
}

@end
