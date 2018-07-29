//
//  MY_GLAlphaLabel.h
//  VTIME
//
//  Created by gll on 2017/9/23.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_GLAlphaLabel : UIView

@property (nonatomic, strong) UIView  * bgView;// 有透明度的图层

@property (nonatomic, assign) NSInteger bgAlpha;// 背景 Alpha

@property (nonatomic, strong) NSString * bgViewColor;// 背景色

@property (nonatomic, assign) NSInteger bgCorRauis;// 剪切长度


@property (nonatomic, strong) UIView  * circularView;//前面的圆

@property (nonatomic, strong) NSString * circularColor;// 背景色



@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) NSString * titleColor;
@property (nonatomic, assign) NSInteger   titleFont;
@property (nonatomic, strong) NSString * shadowColor;


-(CGFloat)setViewTitle:(NSString*)string withFont:(UIFont*)font;


@end
