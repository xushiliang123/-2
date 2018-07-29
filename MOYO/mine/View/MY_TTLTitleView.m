//
//  MY_TTLTitleView.m
//  VTIME
//
//  Created by MadridLee on 2017/9/11.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLTitleView.h"

@implementation MY_TTLTitleView
{
    UILabel* _labelTitle;
    UILabel* _labelDetail;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self uiConfig];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self uiConfig];
    }
    return self;
}



-(void)uiConfig
{
    _labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/2)];
    _labelTitle.textAlignment = NSTextAlignmentCenter;
    _labelTitle.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    _labelTitle.font = [UIFont systemFontOfSize:15];
    [self addSubview:_labelTitle];
    
    _labelDetail = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2)];
    _labelDetail.textAlignment = NSTextAlignmentCenter;
    _labelDetail.textColor = [Utility colorWithHexString:@"c9c9c9" alpha:1];
    _labelDetail.font = [UIFont systemFontOfSize:12];
    [self addSubview:_labelDetail];
}

-(void)showTitle:(NSString *)strTitle withDetail:(NSString *)detail
{
    _labelTitle.text = strTitle;
    _labelDetail.text = detail;
}

@end
