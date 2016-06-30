//
//  ZTFThemeVideoVIew.m
//  baiSi
//
//  Created by feifei on 16/6/28.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFThemeVideoVIew.h"
#import "ZTFAllItem.h"
#import <UIImageView+WebCache.h>
@interface ZTFThemeVideoVIew ()

@property (weak, nonatomic) IBOutlet UIImageView *VideoView;
@property (weak, nonatomic) IBOutlet UILabel *playCountView;
@property (weak, nonatomic) IBOutlet UILabel *playTimeView;


@end

@implementation ZTFThemeVideoVIew

- (void)awakeFromNib
{
    [super awakeFromNib];
        self.autoresizingMask = UIViewAutoresizingNone;
}
- (void)setItem:(ZTFAllItem *)item
{
    [super setItem:item];
    
    [_VideoView sd_setImageWithURL:[NSURL URLWithString:item.image0]];
    _playCountView.text = [NSString stringWithFormat:@"%ld播放",item.playcount];
    _playTimeView.text = [NSString stringWithFormat:@"%02ld:%02ld",item.videotime / 60,item.videotime % 60];
    
}

@end
