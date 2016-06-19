//
//  ZTFAD.h
//  baiSi
//
//  Created by feifei on 16/6/18.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTFAD : NSObject
@property (nonatomic, strong) NSString *w_picurl;

@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;
/**
 *  点击广告跳转到网页地址
 */
@property (nonatomic, strong) NSString *ori_curl;

@end
