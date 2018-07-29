//
//  MY_GLAlphaLabel.m
//  VTIME
//
//  Created by gll on 2017/9/23.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLAlphaLabel.h"

@implementation MY_GLAlphaLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        //背景
        self.bgView = [[UIView alloc]initWithFrame:self.bounds];
        [self addSubview:self.bgView];
        
        //圆点
        self.circularView = [[UIView alloc]initWithFrame:CGRectMake(6, 6, 6, 6)];
        [self addSubview:self.circularView];
        
        //title
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.circularView.frame) + 2, 0, 100, 18)];
        [self addSubview:self.titleLabel];
        
    }
    return self;
}

-(CGFloat)setViewTitle:(NSString*)string withFont:(UIFont*)font{
    
    //透明图层
    if (self.bgViewColor) {
        
        self.bgView.backgroundColor = [Utility colorWithHexString:self.bgViewColor alpha:0.5];
    }else{
        self.bgView.backgroundColor = [Utility colorWithHexString:@"ffffff" alpha:0.5];
    }
    
    if (self.bgCorRauis) {
        self.bgView.layer.cornerRadius = self.bgCorRauis;
    }else{
        self.bgView.layer.cornerRadius = 9;
    }
    
    if (self.bgAlpha) {
        self.bgView.alpha = self.bgAlpha;
    }else{
        self.bgView.alpha = self.bgAlpha;
    }
    
    
    // 前面的圆点
    if (self.circularColor) {
        
        self.circularView.backgroundColor = [Utility colorWithHexString:self.circularColor alpha:1.0];
    }else{
        self.circularView.backgroundColor = [Utility colorWithHexString:@"30ee2d" alpha:1.0];
    }
    
    self.circularView.layer.cornerRadius = self.circularView.frame.size.width * 0.5;
    self.circularView.clipsToBounds = YES;
    
    
    // title
    if (self.shadowColor) {
        //.layer
        self.titleLabel.shadowColor = [Utility colorWithHexString:self.shadowColor alpha:1.0];//.CGColor;//shadowColor阴影颜色
    }else{
        //.layer
        self.titleLabel.shadowColor = nil; //.CGColor;
    }
    
    if (self.titleColor) {
        
        self.titleLabel.textColor = [Utility colorWithHexString:self.titleColor alpha:1.0];
    }else{
        self.titleLabel.textColor = [Utility colorWithHexString:@"30ee2d" alpha:1.0];
    }
    
    if (self.titleFont) {
        
        self.titleLabel.font = [UIFont systemFontOfSize:self.titleFont];
    }else{
        self.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    
    self.titleLabel.text = string;
    
    // 计算title的长度
    CGSize size = [Utility stringSizeWithString:string textSize:font.pointSize width:0 height:18];
    CGRect titleRect = self.titleLabel.frame;
    titleRect.size.width = size.width + 4;
    self.titleLabel.frame = titleRect;
    
    // 计算self 总长度
    titleRect.size.width = size.width + 6 + CGRectGetMinX(self.titleLabel.frame);
    
    // 把self.width 给 bgView.width
    CGRect bgRect = self.bgView.frame;
    bgRect.size.width = titleRect.size.width;
    bgRect.origin.x = 0;
    bgRect.origin.y = 0;
    bgRect.size.height = 18;
    self.bgView.frame = bgRect;
    
    return bgRect.size.width;
}


@end
