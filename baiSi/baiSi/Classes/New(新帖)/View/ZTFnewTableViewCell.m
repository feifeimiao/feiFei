//
//  ZTFnewTableViewCell.m
//  baiSi
//
//  Created by feifei on 16/6/19.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFnewTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "ZTFSubTagItem.h"

#import "UIImage+image.h"

@interface ZTFnewTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *Himage;

@property (weak, nonatomic) IBOutlet UILabel *num;

@property (weak, nonatomic) IBOutlet UILabel *name;



@end

@implementation ZTFnewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setSubTagItem:(ZTFSubTagItem *)subTagItem
{
    _subTagItem = subTagItem;
//         [UIImage imageWithBorderW:0 borderColor:nil image:_Himage.image];
//    [_Himage sd_setImageWithURL:[NSURL URLWithString:subTagItem.image_list]];
    [_Himage sd_setImageWithURL:[NSURL URLWithString:subTagItem.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
      image =  [UIImage imageWithBorderW:0 borderColor:nil image:_Himage.image];
        
        _Himage.image = image;
        
    }];

                     
    _num.text = subTagItem.sub_number;
    
    _name.text = subTagItem.theme_name;
    
}



@end
