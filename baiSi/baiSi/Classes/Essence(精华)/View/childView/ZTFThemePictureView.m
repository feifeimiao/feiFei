//
//  ZTFThemePictureView.m
//  baiSi
//
//  Created by feifei on 16/6/27.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFThemePictureView.h"

#import "ZTFAllItem.h"
#import <UIImageView+WebCache.h>

#import <DALabeledCircularProgressView.h>

@interface  ZTFThemePictureView ()
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UIButton *clBtn;
@property (weak , nonatomic)IBOutlet DALabeledCircularProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;

@end

@implementation ZTFThemePictureView

//从xib中加载
- (void)awakeFromNib
{
//    _pictureView.hidden = !_progressView.progress;
    _progressView.roundedCorners = 10;
    _progressView.progressTintColor = [UIColor whiteColor];
    _progressView.trackTintColor = [UIColor clearColor];
    _progressView.progressLabel.textColor = [UIColor whiteColor];
}
+ (instancetype)pictureTheme
{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]firstObject];
}

- (void)setItem:(ZTFAllItem *)item
{
    _item = item;
    
    NSURL *url = [NSURL URLWithString:item.gifFistFrame];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    [_pictureView sd_setImageWithURL:[NSURL URLWithString:item.image0] placeholderImage:[UIImage imageWithData:data] options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        CGFloat progress = 1.0 * receivedSize / expectedSize;
        _progressView.progress = progress;
        _progressView.progressLabel.text = [NSString stringWithFormat:@"%.1f%%",progress * 100];
        

        
        
        
    }  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!item.is_big)return ;
        //开启图形上下文
        UIGraphicsBeginImageContextWithOptions(_pictureView.bounds.size, NO, 0);
        
        CGFloat margin = 10;
        CGFloat w = ZTFScreenW - 2 * margin;
        CGFloat h = w / item.width * item.height;
        [image drawInRect:CGRectMake(0, 0, w, h)];
        
        // 获取图片
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        // 关闭上下文
        UIGraphicsEndImageContext();
        
        _pictureView.image = image;
        
    }] ;

    
    
    
//    
    if (item.is_big) {
        
        _clBtn.hidden = NO;
        _pictureView.layer.masksToBounds = YES;
        
        _pictureView.contentMode =   UIViewContentModeTop;
    }else
    {
        
        _clBtn.hidden = YES;
        _pictureView.layer.masksToBounds = NO;
        
        _pictureView.contentMode =   UIViewContentModeScaleToFill;

        
    }
    _gifView.hidden = !item.is_gif;
}



@end
