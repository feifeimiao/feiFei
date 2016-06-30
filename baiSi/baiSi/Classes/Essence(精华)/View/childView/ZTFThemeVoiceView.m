//
//  ZTFThemeVoiceView.m
//  baiSi
//
//  Created by feifei on 16/6/30.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFThemeVoiceView.h"
#import "ZTFAllItem.h"
#import <UIImageView+WebCache.h>
@interface ZTFThemeVoiceView ()
@property (weak, nonatomic) IBOutlet UIImageView *voiceVIew;
@property (weak, nonatomic) IBOutlet UIButton *palycount;
@property (weak, nonatomic) IBOutlet UIButton *time;

@end
@implementation ZTFThemeVoiceView

- (void)setItem:(ZTFAllItem *)item
{
    [super setItem:item];
    
    [_voiceVIew sd_setImageWithURL:[NSURL URLWithString:item.image0]];
    _palycount.titleLabel.text = [NSString stringWithFormat:@"%ld播放",item.playcount];
    _time.titleLabel.text = [NSString stringWithFormat:@"%02ld:%02ld",item.voicetime / 60,item.voicetime % 60];
}

@end
