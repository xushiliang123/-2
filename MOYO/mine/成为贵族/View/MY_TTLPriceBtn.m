//
//  MY_TTLPriceBtn.m
//  VTIME
//
//  Created by MadridLee on 2017/9/13.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLPriceBtn.h"

@implementation MY_TTLPriceBtn

+ (void)initialize
{
    // UIAppearance Proxy Defaults
    
//    MY_TTLPriceBtn *btn = [self appearance];
}


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self createBtn];
    }
    return self;
}


//用xib创建视图对象
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self createBtn];
    }
    return self;
}

-(void)createBtn
{
    _imgvBack = [[UIImageView alloc]init];
    [self addSubview:_imgvBack];
    [_imgvBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).mas_offset(0);
        make.bottom.equalTo(self.mas_bottom).mas_offset(0);
        make.left.equalTo(self.mas_left).mas_offset(0);
        make.right.equalTo(self.mas_right).mas_offset(0);
    }];
    
    
    _labelPrice = [[UILabel alloc]init];
    _labelPrice.font = [UIFont systemFontOfSize:21];
    _labelPrice.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
    _labelPrice.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_labelPrice];
    [_labelPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).mas_offset(23);
        make.left.equalTo(self.mas_left).mas_offset(0);
        make.right.equalTo(self.mas_right).mas_offset(0);
        make.height.mas_equalTo(21);
    }];
    
    _labelDanwei = [[UILabel alloc]init];
    _labelDanwei.font = [UIFont systemFontOfSize:11];
    _labelDanwei.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
    _labelDanwei.textAlignment = NSTextAlignmentCenter;
     [self addSubview:_labelDanwei];
    [_labelDanwei mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_labelPrice.mas_bottom).mas_offset(8);
        make.left.equalTo(self.mas_left).mas_offset(0);
        make.right.equalTo(self.mas_right).mas_offset(0);
        make.height.mas_equalTo(11);
    }];
    
    _labelTime = [[UILabel alloc]init];
    _labelTime.font = [UIFont systemFontOfSize:12];
    _labelTime.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
    _labelTime.textAlignment = NSTextAlignmentCenter;
     [self addSubview:_labelTime];
    [_labelTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_labelDanwei.mas_bottom).mas_offset(12);
        make.left.equalTo(self.mas_left).mas_offset(0);
        make.right.equalTo(self.mas_right).mas_offset(0);
        make.height.mas_equalTo(12);
    }];
}

//-(void)setSelected:(BOOL)selected
//{
//    if (selected == YES) {
//        _labelPrice.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
//        _labelDanwei.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
//        _labelTime.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
////        [self setBackgroundImage:[UIImage imageNamed:@"chooseBack"] forState:UIControlStateNormal];
//    }
//    else{
//        _labelPrice.textColor = [Utility colorWithHexString:@"e2c04e" alpha:1];
//        _labelDanwei.textColor = [Utility colorWithHexString:@"e2c04e" alpha:1];
//        _labelTime.textColor = [Utility colorWithHexString:@"e2c04e" alpha:1];
////        [self setBackgroundImage:[UIImage imageNamed:@"borderBack"] forState:UIControlStateNormal];
//    }
//}

-(void)showPrice:(NSNumber *)price withTime:(NSString *)month{
    _labelPrice.text = [NSString stringWithFormat:@"%.0f",[price floatValue]];
    _labelDanwei.text = @"元";
    _labelTime.text = month;
}

@end
