//
//  MY_XTItem.m
//  VTIME
//
//  Created by tingting on 2017/11/9.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTItem.h"

@implementation MY_XTItem

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

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
//    _discount = [UIButton buttonWithType:UIButtonTypeCustom];
//    _discount.enabled = NO;
//    _discount.titleLabel.font = [UIFont systemFontOfSize:12];
//    _discount.layer.borderWidth = 1.0f;
//    _discount.layer.cornerRadius = kITEM_WH * 0.5;
//    _discount.layer.masksToBounds = YES;
//    CGFloat itemW = kITEM_WH;
//    CGFloat itemH = kITEM_WH;
//    CGFloat itemX = (self.frame.size.width - itemW)*0.5;
//    CGFloat itemY = (self.frame.size.height - itemH) *0.5;
//    _discount.frame = CGRectMake(itemX, itemY, itemW, itemH);
    
    //    _pickview = [[UIView alloc]initWithFrame:CGRectMake((self.frame.size.width - 51)*0.5, (self.frame.size.height - 101) *0.5, 51, 101)];
    _week = [[UILabel alloc]initWithFrame:CGRectMake(0, 44, self.frame.size.width, 12)];
    _week.font = [UIFont systemFontOfSize:15];
    _week.textColor = [Utility colorWithHexString:@"#888888" alpha:1.0f];
    _week.textAlignment = NSTextAlignmentCenter;
    //    [_pickview addSubview:_week];
    
    [self addSubview:_week];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _week.text = title;
}

- (void)setRedTitle
{
    //    _discount.layer.borderColor = kRGB236.CGColor;
    //    [_discount setTitleColor:kRGB236 forState:UIControlStateNormal];
    _week.textColor = [Utility colorWithHexString:@"#FEFEFF" alpha:1.0f];
}

- (void)setGrayTitle
{
    //    _discount.layer.borderColor = kRGB220.CGColor;
    //    [_discount setTitleColor:kRGB220 forState:UIControlStateNormal];
    _week.textColor = [Utility colorWithHexString:@"#888888" alpha:1.0f];
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
//    [_pickview setBackgroundColor:[UIColor greenColor]];
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
//    [_pickview setBackgroundColor:[UIColor clearColor]];
}

@end
