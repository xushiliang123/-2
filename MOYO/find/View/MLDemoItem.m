//
//  MLDemoItem.m
//  MLPickerScrollView
//
//  Created by MelodyLuo on 15/8/14.
//  Copyright (c) 2015年 MelodyLuo. All rights reserved.
//

#define kITEM_WH 40
#define MLColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define kRGB220 MLColor(220, 220, 220, 1.0)
#define kRGB236 MLColor(236, 73, 73, 1.0)

#import "MLDemoItem.h"

@implementation MLDemoItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    _discount = [UIButton buttonWithType:UIButtonTypeCustom];
    _discount.enabled = NO;
    _discount.titleLabel.font = [UIFont systemFontOfSize:12];
    _discount.layer.borderWidth = 1.0f;
    _discount.layer.cornerRadius = kITEM_WH * 0.5;
    _discount.layer.masksToBounds = YES;
    CGFloat itemW = kITEM_WH;
    CGFloat itemH = kITEM_WH;
    CGFloat itemX = (self.frame.size.width - itemW)*0.5;
    CGFloat itemY = (self.frame.size.height - itemH) *0.5;
    _discount.frame = CGRectMake(itemX, itemY, itemW, itemH);
    
//    _pickview = [[UIView alloc]initWithFrame:CGRectMake((self.frame.size.width - 51)*0.5, (self.frame.size.height - 101) *0.5, 51, 101)];
    _week = [[UILabel alloc]initWithFrame:CGRectMake(0, 16, self.frame.size.width, 13)];
    _week.font = [UIFont systemFontOfSize:13];
    _week.textColor = [Utility colorWithHexString:@"#888888" alpha:1.0f];
    _week.textAlignment = NSTextAlignmentCenter;
//    [_pickview addSubview:_week];
    [self addSubview:_week];
    
    _day = [[UILabel alloc]initWithFrame:CGRectMake(0, 43, self.frame.size.width, 20)];
    _day.font = [UIFont boldSystemFontOfSize:25];
    _day.textColor = [Utility colorWithHexString:@"#888888" alpha:1.0f];
    _day.textAlignment = NSTextAlignmentCenter;
    _day.text = @"10";
    //    [_pickview addSubview:_week];
    [self addSubview:_day];
    
    _month = [[UILabel alloc]initWithFrame:CGRectMake(0, 79, self.frame.size.width, 11)];
    _month.font = [UIFont systemFontOfSize:12];
    _month.textColor = [Utility colorWithHexString:@"#888888" alpha:1.0f];
    _month.textAlignment = NSTextAlignmentCenter;
    _month.text = @"11月";
    //    [_pickview addSubview:_week];
    [self addSubview:_month];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _week.text = title;
}

- (void)setDayss:(NSString *)dayss
{
    _dayss = dayss;
    _day.text = dayss;
}

- (void)setMonthss:(NSString *)monthss
{
    _monthss = monthss;
    _month.text = [NSString stringWithFormat:@"%@月",monthss];
}

- (void)setRedTitle
{
//    _discount.layer.borderColor = kRGB236.CGColor;
//    [_discount setTitleColor:kRGB236 forState:UIControlStateNormal];
    _week.textColor = [Utility colorWithHexString:@"#FFFEFE" alpha:1.0f];
     _day.textColor = [Utility colorWithHexString:@"#FFFEFE" alpha:1.0f];
     _month.textColor = [Utility colorWithHexString:@"#FFFEFE" alpha:1.0f];
}

- (void)setGrayTitle
{
//    _discount.layer.borderColor = kRGB220.CGColor;
//    [_discount setTitleColor:kRGB220 forState:UIControlStateNormal];
    _week.textColor = [Utility colorWithHexString:@"#888888" alpha:1.0f];
     _day.textColor = [Utility colorWithHexString:@"#888888" alpha:1.0f];
     _month.textColor = [Utility colorWithHexString:@"#888888" alpha:1.0f];
    
}

/**
 *  改变item成红色. frame变大
 */
- (void)changeSizeOfItem
{
    [self setRedTitle];
//    CGFloat itemW = kITEM_WH + kITEM_WH*0.3;
//    CGFloat itemH = kITEM_WH + kITEM_WH*0.3;
//    CGFloat itemX = (self.frame.size.width - itemW)*0.5;
//    CGFloat itemY = (self.frame.size.height - itemH) *0.5;
//    _discount.layer.borderWidth = 1.0f;
//    _discount.layer.cornerRadius = itemW * 0.5;
//    _discount.layer.masksToBounds = YES;
//    _discount.frame = CGRectMake(itemX, itemY, itemW, itemH);
    [_pickview setBackgroundColor:[UIColor greenColor]];
}

/**
 *  改变item成灰色，frame变小
 */
- (void)backSizeOfItem
{
    [self setGrayTitle];
//    _discount.layer.borderWidth = 1.0f;
//    _discount.layer.cornerRadius = kITEM_WH * 0.5;
//    _discount.layer.masksToBounds = YES;
//    CGFloat itemW = kITEM_WH;
//    CGFloat itemH = kITEM_WH;
//    CGFloat itemX = (self.frame.size.width - itemW)*0.5;
//    CGFloat itemY = (self.frame.size.height - itemH) *0.5;
//    _discount.frame = CGRectMake(itemX, itemY, itemW, itemH);
    [_pickview setBackgroundColor:[UIColor clearColor]];
}

@end
