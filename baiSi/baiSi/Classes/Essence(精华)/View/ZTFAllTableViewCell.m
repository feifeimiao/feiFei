//
//  ZTFAllTableViewCell.m
//  baiSi
//
//  Created by feifei on 16/6/25.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFAllTableViewCell.h"
#import "ZTFTopThemeView.h"
#import "ZTFThemePictureView.h"
#import "ZTFThemeViewModel.h"
#import "ZTFAllItem.h"

#import "ZTFThemeVoiceView.h"

#import "ZTFThemeVideoVIew.h"
@interface ZTFAllTableViewCell ()


@property (weak , nonatomic) ZTFTopThemeView *topView;

@property (weak , nonatomic) ZTFThemePictureView *picture;

@property (weak , nonatomic) ZTFThemeVideoVIew *video;

@property (weak , nonatomic) ZTFThemeVoiceView *voice;


@end


@implementation ZTFAllTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //top
        ZTFTopThemeView *topTheme  = [ ZTFTopThemeView topTheme];
        
        [self.contentView addSubview:topTheme];
        
        _topView = topTheme;
        
        
        //pictureView
        ZTFThemePictureView *picture = [ZTFThemePictureView pictureTheme];
        
        [self.contentView addSubview:picture];
        
        _picture = picture;
        
        //video
        ZTFThemeVideoVIew *video = [ZTFThemeVideoVIew topTheme];
        
        [self.contentView addSubview:video];
        
        _video = video;
        
        
        //voice
        ZTFThemeVoiceView *voice = [ZTFThemeVoiceView topTheme];
        
        [self.contentView addSubview:voice];
        
        _voice = voice;
    }
    
    return self;

}


- (void)setItem:(ZTFThemeViewModel *)vm
{
    _item = vm;
    _topView.frame = vm.topViewFrame;
    _topView.item = vm.item;
    

    if (vm.item.type == ZTFThemeTypePicture) {
        
        _picture.hidden = NO;
        
        _video.hidden = YES;
         _voice.hidden = YES;
        
        _picture.frame = vm.pictureViewFrame;
        
        _picture.item = vm.item;
        
    } else if(vm.item.type == ZTFThemeTypeVideo){
        
        _video.hidden = NO;
        
        _picture.hidden = YES;
         _voice.hidden = YES;
        
        _video.frame = vm.pictureViewFrame;
        
        _video.item = vm.item;
        
        
    }else if (vm.item.type == ZTFThemeTypeVoice){
        
        _voice.hidden = NO;
           _picture.hidden = YES;
          _video.hidden = YES;
        
        _voice.frame = vm.pictureViewFrame;
        _voice.item = vm.item;
        
    
    }else{
    
        _picture.hidden = YES;
        _video.hidden = YES;
        _voice.hidden = YES;
    
    }
}

@end
