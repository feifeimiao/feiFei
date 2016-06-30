//
//  ZTFThemeViewModel.h
//  baiSi
//
//  Created by feifei on 16/6/27.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZTFAllItem;
@interface ZTFThemeViewModel : NSObject

@property (strong , nonatomic) ZTFAllItem *item;
//顶部视图的frame
@property (assign , nonatomic) CGRect  topViewFrame;
//picture
@property (assign , nonatomic) CGRect pictureViewFrame;
//cell整体的高度
@property (assign , nonatomic) CGFloat cellH;


@end
