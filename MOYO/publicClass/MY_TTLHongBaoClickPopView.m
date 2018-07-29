//
//  MY_TTLHongBaoClickPopView.m
//  VTIME
//
//  Created by 听听 on 2018/2/1.
//  Copyright © 2018年 MadridLee. All rights reserved.
//

#import "MY_TTLHongBaoClickPopView.h"
#import "YYLabel.h"
@interface MY_TTLHongBaoClickPopView ()
{

    NSInteger   _indexPathSecond;
    NSInteger   _indexPathThird;
    UIView      *_bgView;
}
@end

@implementation MY_TTLHongBaoClickPopView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        UIView * blackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        blackView.backgroundColor = [Utility colorWithHexString:@"000000" alpha:.5];
        [self addSubview:blackView];
        
        //        _indexPathFirst = 1700;
        _indexPathSecond = 1800;
        _indexPathThird = 1900;
        
        [self initUI];
        
    }
    return self;
}
//  初始化 UI
-(void)initUI{
    
    //    高 538 /2
    //    宽 SCREEN_WIDTH - 58
     UIColor     * titleColor = [Utility colorWithHexString:@"DAB878" alpha:1.0];//  文字
    _bgView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 317)*0.5, (SCREEN_HEIGHT - 247) * 0.5, 317, 215)];
    _bgView.backgroundColor = [Utility colorWithHexString:@"272729" alpha:1.0];
    _bgView.layer.cornerRadius = 5.0;
    [self addSubview:_bgView];
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, _bgView.frame.size.width, 30)];
    titleLabel.text = @"恭喜您领取成功";
    titleLabel.font = [UIFont systemFontOfSize:24];
    titleLabel.textColor = titleColor;
    [titleLabel setTextAlignment:(NSTextAlignmentCenter)];
    [_bgView addSubview:titleLabel];
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(titleLabel.frame)+10, _bgView.frame.size.width-10, 1)];
    //    lineView.backgroundColor = [UIColor colorWithRed:71/255 green:71/255 blue:71/255 alpha:1.0];
    lineView.backgroundColor = [Utility colorWithHexString:@"#4f4f50" alpha:1.0];
    [_bgView addSubview:lineView];

    UILabel * detaLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(lineView.frame)+10, _bgView.frame.size.width, 30)];
    detaLabel.text = @"邀请好友加入，赚取更多现金";
    detaLabel.font = [UIFont systemFontOfSize:20];
    detaLabel.textColor = titleColor;
    [detaLabel setTextAlignment:(NSTextAlignmentCenter)];
    [_bgView addSubview:detaLabel];
    
    UILabel *underlineLabel = [[UILabel alloc]initWithFrame:CGRectMake((_bgView.frame.size.width-120)/2, CGRectGetMaxY(detaLabel.frame)+5, 120, 30)];
    underlineLabel.font = [UIFont systemFontOfSize:20];
    underlineLabel.textColor = [UIColor redColor];
    underlineLabel.textAlignment = NSTextAlignmentCenter;
    NSString *textStr = @"邀请详情";
    // 下划线
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSStrokeColorAttributeName:[UIColor redColor]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:textStr attributes:attribtDic];
        //赋值
    underlineLabel.attributedText = attribtStr;
    
    [_bgView addSubview:underlineLabel];
    
    UIButton * fbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fbtn setFrame:CGRectMake((_bgView.frame.size.width-120)/2, CGRectGetMaxY(detaLabel.frame)+5, 120, 30)];
    [fbtn addTarget:self action:@selector(fbtnClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    [_bgView addSubview:fbtn];
    
    UIButton * filtratebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [filtratebtn setFrame:CGRectMake((_bgView.frame.size.width-120)/2 , _bgView.frame.size.height - 12 - 46, 120, 45)];
    
    [filtratebtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [filtratebtn setTitle:@"邀请好友" forState:(UIControlStateNormal)];
    [filtratebtn setBackgroundColor:[Utility colorWithHexString:@"DAB878" alpha:1.0]];
    [filtratebtn addTarget:self action:@selector(filtrateClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    filtratebtn.layer.cornerRadius = 5.0;
    [filtratebtn.layer setMasksToBounds:YES];
    
    filtratebtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_bgView addSubview:filtratebtn];
    
}
-(void)fbtnClickMethod:(UIButton*)sender{
    self.blockDeatailFiltrate();
    [self removeFromSuperview];
}
//  筛选
-(void)filtrateClickMethod:(UIButton*)sender{
    self.blockFiltrate();
    [self removeFromSuperview];
    
}

//  选择身高标签
-(void)selectedUserStyleIndex3ClickMethod:(UIButton*)sender{
    
    if (_indexPathThird == sender.tag) {
        return;
    }
    
    UIButton * lastClickbtn = [_bgView viewWithTag:_indexPathThird];
    lastClickbtn.selected = NO;
    //    [lastClickbtn setTitleColor:COlOR999 forState:(UIControlStateNormal)];
    //    [lastClickbtn setBackgroundColor:[Utility colorWithHexString:@"f1f1f1" alpha:1.0]];
    
    UIButton *  currentClicbtn = [_bgView viewWithTag:sender.tag];
    currentClicbtn.selected = YES;
    //    [currentClicbtn setTitleColor:GOLDCOLOR forState:(UIControlStateNormal)];
    //    [currentClicbtn setBackgroundColor:COlOR333];
    _indexPathThird = sender.tag;
    
}

//  选择性别标签
-(void)selectedUserStyleIndex2ClickMethod:(UIButton*)sender{
    
    if (_indexPathSecond== sender.tag) {
        
        return;
    }
    
    UIButton * lastClickbtn = [_bgView viewWithTag:_indexPathSecond];
    lastClickbtn.selected = NO;
    //    [lastClickbtn setTitleColor:COlOR666 forState:(UIControlStateNormal)];
    //    [lastClickbtn setBackgroundColor:[Utility colorWithHexString:@"f1f1f1" alpha:1.0]];
    //
    UIButton *  currentClicbtn = [_bgView viewWithTag:sender.tag];
    currentClicbtn.selected = YES;
    //    [currentClicbtn setTitleColor:GOLDCOLOR forState:(UIControlStateNormal)];
    //    [currentClicbtn setBackgroundColor:COlOR333];
    
    _indexPathSecond = sender.tag;
    
}

////  选择cp标签
//-(void)selectedUserStyleIndex1ClickMethod:(UIButton*)sender{
//
//    if (_indexPathFirst == sender.tag) {
//
//        return;
//    }
//
//    UIButton * lastClickbtn = [_bgView viewWithTag:_indexPathFirst];
//    [lastClickbtn setTitleColor:COlOR666 forState:(UIControlStateNormal)];
//    [lastClickbtn setBackgroundColor:[Utility colorWithHexString:@"f5f5f5" alpha:1.0]];
//
//    UIButton *  currentClicbtn = [_bgView viewWithTag:sender.tag];
//    [currentClicbtn setTitleColor:[Utility colorWithHexString:@"ffffff" alpha:1.0] forState:(UIControlStateNormal)];
//    [currentClicbtn setBackgroundColor:GOLDCOLOR];
//
//    _indexPathFirst = sender.tag;
//
//}

// self加在window上
-(void)addWindowForView{
    
    if (nil == self.superview) {
        
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
    }
}

-(void)removeView{
    
    if (self.superview) {
        [self removeFromSuperview];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UIView * view = [touches anyObject].view;
    if (![view isEqual:_bgView]) {

        [self removeView];

    }
    
}

@end
