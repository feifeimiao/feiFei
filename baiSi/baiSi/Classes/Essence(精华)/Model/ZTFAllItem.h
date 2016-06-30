//
//  ZTFSubTagItem.h
//  baiSi
//
//  Created by feifei on 16/6/25.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ZTFThemeTypeAll = 1,
    ZTFThemeTypePicture = 10,
    ZTFThemeTypeVideo = 41,
    ZTFThemeTypeVoice = 31,
    ZTFThemeTypeText = 29

} ZTFThemeType;

@interface ZTFAllItem : NSObject
//top
@property (nonatomic, strong) NSString *profile_image;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *passtime;
@property (nonatomic, strong) NSString *text;


//picture
@property (nonatomic, strong) NSString *gifFistFrame;
@property (assign , nonatomic) ZTFThemeType type;
@property (nonatomic, strong) NSString *image0;
/** 大图 */
@property (nonatomic, strong) NSString *image1;
/** 中图 */
@property (nonatomic, strong) NSString *image2;

@property(nonatomic, assign) BOOL is_gif;

@property(nonatomic, assign) NSInteger playcount;
@property(nonatomic, assign) NSInteger videotime;

// 声音
@property(nonatomic, assign) NSInteger voicetime;

@property(nonatomic, assign) BOOL is_big;
@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;

@end
