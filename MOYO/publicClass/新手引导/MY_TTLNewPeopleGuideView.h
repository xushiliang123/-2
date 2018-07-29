//
//  MY_TTLNewPeopleGuideView.h
//  VTIME
//
//  Created by Allen on 2017/12/22.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_TTLNewPeopleGuideView : UIView

typedef NS_ENUM (NSInteger, imageType)   {
    
    creteNewImage = 0,//创建按钮显示原图
    
    createClearImage = 1,//创建按钮透明
    
};

@property (nonatomic, copy) void(^actionBlock)();

/*
 * btnFrame: 透明显示区域坐标
 * btnName:  透明图片
 * imgFrame: 箭头指示坐标
 * imgName:  箭头指示图片
 * promptString 提示文字
 * radius:   透明区域切缘弧度
 */
- (instancetype)initWithButtonFrame:(CGRect)btnFrame
                      buttonImgName:(NSString *)btnName
                           imgFrame:(CGRect)imgFrame
                       guideImgName:(NSString *)imgName
                       promptString:(NSString *)promptStr
                        corneRadius:(NSUInteger)radius
                              Alpha:(CGFloat)Alpha;

//显示
- (void)show;
//隐藏
- (void)dismiss;

@end
