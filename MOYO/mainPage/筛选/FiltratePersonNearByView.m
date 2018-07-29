//
//  FiltratePersonNearByView.m
//  TogetherLu
//
//  Created by gll on 2017/6/20.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "FiltratePersonNearByView.h"
@interface FiltratePersonNearByView()
{
    
//    NSInteger   _indexPathFirst;
    NSInteger   _indexPathSecond;
    NSInteger   _indexPathThird;
    UIView      *_bgView;
}


@end

@implementation FiltratePersonNearByView

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
    
    _bgView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 317)*0.5, (SCREEN_HEIGHT - 247) * 0.5, 317, 290)];
    _bgView.backgroundColor = [Utility colorWithHexString:@"FFFFFF" alpha:1.0];
    _bgView.layer.cornerRadius = 5.0;
    [self addSubview:_bgView];
    
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, _bgView.frame.size.width, 30)];
    titleLabel.text = @"筛选";
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1.0];
    [titleLabel setTextAlignment:(NSTextAlignmentCenter)];
    [_bgView addSubview:titleLabel];
    
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(titleLabel.frame)+10, _bgView.frame.size.width-10, 1)];
//    lineView.backgroundColor = [UIColor colorWithRed:71/255 green:71/255 blue:71/255 alpha:1.0];
    lineView.backgroundColor = GOLDCOLOR;
    [_bgView addSubview:lineView];
    
    CGFloat spaceH = 16 + 40 + 10; // 每个标题之间的距离 btn 上下间距+ btn的高
    NSString * titleArray[]={@"性别",@"身高"};
//    标题
    for (NSInteger index = 0 ; index < 2; index ++) {
//        33：顶部的距离 14：标题的高
        UILabel * sectionLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 60 + (spaceH + 14)* index  , _bgView.frame.size.width - 40, 16)];
        sectionLabel.text = titleArray[index];
        sectionLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1.0];
        sectionLabel.font = [UIFont systemFontOfSize:15];
        [_bgView addSubview:sectionLabel];
    }
    
    UIFont      * font = [UIFont systemFontOfSize:13];
    UIColor     * titleColor = GOLDCOLOR;   // 未选择 文字
    UIColor     * selectedTitleColor = [UIColor blackColor];// 已选择文字

    UIImage     * bgImg = [Utility createImageWithColor:titleColor];// 未选择 背景
//    UIColor     * selectwdBgColor = COlOR333; // 已选择背景
    
    NSString * sexArray[]={@"全部",@"男",@"女"};
    NSString * heightAry[]={@"全部",@"160cm+",@"170cm+",@"180cm+"};
    CGFloat spaceY = 60 + 14 + 14;
    //  用户类型  子标题
//    for (NSInteger index1 = 0 ; index1 < 2; index1 ++) {
//        
//        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setFrame:CGRectMake(20 + (10 + 60) * index1, spaceY, 60, 25)];
//        
//        [btn setTitleColor:titleColor forState:(UIControlStateNormal)];
//        [btn setTitle:userKind[index1] forState:(UIControlStateNormal)];
//        btn.tag = 1700 + index1;
//        [btn setBackgroundColor:bgColor];
//        [btn addTarget:self action:@selector(selectedUserStyleIndex1ClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
//        btn.layer.cornerRadius = 3.0;
//        [btn.layer setMasksToBounds:YES];
//        btn.titleLabel.font = font;
//        [_bgView addSubview:btn];
//        
//        if (0 == index1) {
//            
//            [btn setTitleColor:selectedTitleColor forState:(UIControlStateNormal)];
//            [btn setBackgroundColor:selectwdBgColor];
//        }
//    }
    
//    性别  子标题
    for (NSInteger index2 = 0 ; index2 < 3; index2 ++) {
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(20 + (10 + 60) * index2, spaceY, 60, 35)];
        
//        [btn setTitleColor:titleColor forState:(UIControlStateNormal)];
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = GOLDCOLOR.CGColor;
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        [btn setBackgroundImage:[UIImage xq_imageWithColor:GOLDCOLOR] forState:UIControlStateSelected];

        [btn setTitle:sexArray[index2] forState:(UIControlStateNormal)];
        btn.tag = 1800 + index2;
//        [btn setBackgroundColor:bgColor];
        [btn addTarget:self action:@selector(selectedUserStyleIndex2ClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
//        btn.layer.cornerRadius = 13;
//        [btn.layer setMasksToBounds:YES];
        btn.titleLabel.font = font;
        [_bgView addSubview:btn];
        
        if (0 == index2) {
            btn.selected = YES;
//            [btn setTitleColor:selectedTitleColor forState:(UIControlStateNormal)];
//            [btn setBackgroundColor:selectwdBgColor];
        }
    }
    
    spaceY = spaceY + 10 + 16 + 14 + 40;
    //   身高  子标题
    for (NSInteger index3 = 0 ; index3 < 4; index3 ++) {
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(20 + (10 + 60) * index3, spaceY, 60, 35)];
        
        
//        [btn setTitleColor:titleColor forState:(UIControlStateNormal)];
        [btn setTitle:heightAry[index3] forState:(UIControlStateNormal)];
        btn.tag = 1900 + index3;
        
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = GOLDCOLOR.CGColor;
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
         [btn setBackgroundImage:bgImg forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(selectedUserStyleIndex3ClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [btn setTitleColor:GOLDCOLOR forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        btn.titleLabel.font = font;
        [_bgView addSubview:btn];
        
        if (0 == index3) {
            
//            [btn setTitleColor:selectedTitleColor forState:(UIControlStateNormal)];
            btn.selected = YES;
//            [btn setBackgroundColor:selectwdBgColor];
        }
    }
    
    
    UIButton * filtratebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [filtratebtn setFrame:CGRectMake(25 , _bgView.frame.size.height - 12 - 46, (_bgView.frame.size.width - 50), 45)];
    
    [filtratebtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [filtratebtn setTitle:@"确认" forState:(UIControlStateNormal)];
    [filtratebtn setBackgroundColor:GOLDCOLOR];
    [filtratebtn addTarget:self action:@selector(filtrateClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    filtratebtn.layer.cornerRadius = 5.0;
    [filtratebtn.layer setMasksToBounds:YES];
    
    
    filtratebtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [_bgView addSubview:filtratebtn];
    
}
//  筛选
-(void)filtrateClickMethod:(UIButton*)sender{
    
//    请求筛选    移除self 释放self
//    选全部 是 -1
//    NSInteger god = _indexPathFirst -1700;
//    if (god == 0) {
//        god = -1;
//    }
    NSInteger sex = _indexPathSecond - 1800;
    if (sex == 0 ) {// 全部
        sex = -1;
    }else if (2 == sex){// 女
        sex = 0;
    }else{
        sex = 1;// 男
    }
    
    
    NSInteger cp = _indexPathThird - 1900;
    if (cp == 0) {
        cp = -1;
    }else if (cp == 1){
        cp = 160;
    }else if (cp == 2){
        cp = 170;
    }else if (cp == 3){
        cp = 180;
    }
    
    NSDictionary * parameter = @{@"sex":@(sex),@"height":@(cp),@"page":@"1"};//,@"page":@"1",@"filterPageNum":@"0"
    
    self.blockFiltrate(parameter);

    [self removeFromSuperview];
    
//    [TLHTTPRequest MY_postWithBaseUrl:PersonNearByUrl parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//        
//        if ( 0 == [[data objectForKey:@"ret"] integerValue]) {
//            
//            
//            if (self.blockFiltrate) {
//                
//                if (data[@"info"]) {
//                
//                    self.blockFiltrate(data[@"info"],parameter);
//                }
//            }
//        }else{
//            
//            if ([data objectForKey:@"msg"]) {
//                AutoHideAlert * alertView = [[AutoHideAlert alloc]initWithSuperView:self];
//                [alertView show:[data objectForKey:@"msg"]];
//
//            }
//        }
//        [self removeView];
//        
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//        
//        AutoHideAlert * alertView = [[AutoHideAlert alloc]initWithSuperView:self];
//        [alertView show:@"加载失败"];
//        
//    }];
    
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/





@end
