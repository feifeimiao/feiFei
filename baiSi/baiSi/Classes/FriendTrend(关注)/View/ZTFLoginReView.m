//
//  ZTFLoginReView.m
//  baiSi
//
//  Created by feifei on 16/6/20.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFLoginReView.h"
//#import "UIView+Frame.h"
@interface ZTFLoginReView ()
@property (weak, nonatomic) IBOutlet UIButton *logvtn;

//@property (strong, nonatomic) IBOutlet ZTFLoginReView *lrview;

@end

@implementation ZTFLoginReView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}

- (void)awakeFromNib
{
    
    
    UIImage *im = [_logvtn backgroundImageForState:UIControlStateNormal];
    
    im = [im stretchableImageWithLeftCapWidth:im.size.width * 0.5 topCapHeight:im.size.height * 0.5];
    
    [_logvtn setBackgroundImage:im forState:UIControlStateNormal];

}
+ (instancetype)logView{

    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]firstObject];

}


+ (instancetype)regisView
{
       return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}



@end
