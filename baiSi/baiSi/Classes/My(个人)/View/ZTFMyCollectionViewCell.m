//
//  ZTFMyCollectionViewCell.m
//  baiSi
//
//  Created by feifei on 16/6/20.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFMyCollectionViewCell.h"



#import "ZTFMyItem.h"

#import <UIImageView+WebCache.h>
@interface ZTFMyCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *name;

@end

@implementation ZTFMyCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setMyItem:(ZTFMyItem *)myItem
{
    _myItem = myItem;
    
    _name.text = myItem.name;
    [_icon sd_setImageWithURL:[NSURL URLWithString:myItem.icon]];
}

@end
