//
//  MY_GLHomeAddStatusView.m
//  VTIME
//
//  Created by gll on 2017/9/22.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLHomeAddStatusView.h"

@interface MY_GLHomeAddStatusView()
{
    UIImageView * imgStatus;
    NSInteger   _indexPathLast;
    UIView      *_bgView;
    NSArray     * statusAry;
    NSArray     * statusSectedAry;
    NSArray     * statusStringAry;

}

@end

@implementation MY_GLHomeAddStatusView


-(instancetype)initWithFrame:(CGRect)frame withInstroduce:(BOOL)isInstro{
    
    self = [super initWithFrame:frame];

    if (self) {
        
        
        self.backgroundColor = [UIColor clearColor];
        

        statusAry = @[@"status_wine",@"status_hungry",@"status_SingK",@"status_rejectionHand",@"status_dull",@"status_meeting"];
        statusSectedAry = @[@"status_selectedWine",@"status_selectedHungry",@"status_selectedSingK",@"status_selectedRejectionHand",@"status_selectedDull",@"status_selectedMeeting"];
        statusStringAry = @[@"想喝酒",@"有点饿",@"想唱K",@"去甩手",@"无聊中",@"求偶遇"];

        if (isInstro) {
            //介绍页
            [self setUpInstroUI];

        }else{
            
            [self setUpStatusUI];
        }
        
        
    }
    return self;
}

-(void)setUpInstroUI{
    
    UIView * blackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    blackView.backgroundColor = [Utility colorWithHexString:@"000000" alpha:.5];
    [self addSubview:blackView];
    
    CGFloat width ;
    if (SCREEN_WIDTH  == 320) {
        width = 300;
    }else{
        width = 335;
    }
    
    CGFloat space = (SCREEN_WIDTH - width)*0.5;

    
    imgStatus = [[UIImageView alloc]initWithFrame:CGRectMake(space, (SCREEN_HEIGHT - 310)*0.5 , width, 310)];
    imgStatus.userInteractionEnabled = YES;
    
    [imgStatus setImage:[UIImage imageNamed:@"home_addStatusBgImg"]];
    
    [self addSubview:imgStatus];
    
    //close btn
//    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setFrame:CGRectMake(imgStatus.bounds.size.width - 30, 0, 30, 30)];
//    [btn setImage:[UIImage imageNamed:@"home_statusCloseBtn"] forState:(UIControlStateNormal)];
//
//    btn.tag = 1100 ;
//    [btn addTarget:self action:@selector(selectedClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
//    [imgStatus addSubview:btn];

    
    //add status
    UIButton * addStatus = [UIButton buttonWithType:UIButtonTypeCustom];
    [addStatus setFrame:CGRectMake(24, imgStatus.bounds.size.height - 24 - 42, imgStatus.bounds.size.width - 48, 45)];
    
    [addStatus setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [addStatus setTitle:@"挂状态" forState:(UIControlStateNormal)];
    addStatus.tag = 1101;
    [addStatus setBackgroundColor:GOLDCOLOR];
    [addStatus addTarget:self action:@selector(selectedClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    addStatus.layer.cornerRadius = 5;
    [addStatus.layer setMasksToBounds:YES];
    addStatus.titleLabel.font = [UIFont systemFontOfSize:18];
    [imgStatus addSubview:addStatus];

}

-(void)setUpStatusUI{
    
    
    UIView * blackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    blackView.backgroundColor = [Utility colorWithHexString:@"000000" alpha:.5];
    [self addSubview:blackView];
    
    CGFloat width ;
    if (SCREEN_WIDTH  == 320) {
        width = 300;
    }else{
        width = 335;
    }
    
    CGFloat space = (SCREEN_WIDTH - width)*0.5;
    
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(space, (SCREEN_HEIGHT - 310)*0.5 , width, 323)];
    _bgView.backgroundColor = [Utility colorWithHexString:@"272729" alpha:1.0];
    _bgView.layer.cornerRadius = 5.0;
    [self addSubview:_bgView];
    
    
    //close btn
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(_bgView.bounds.size.width - 30, 0, 30, 30)];
    [btn setImage:[UIImage imageNamed:@"home_statusCloseBtnGray"] forState:(UIControlStateNormal)];
    
    btn.tag = 1100 ;
    [btn addTarget:self action:@selector(selectedClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    [_bgView addSubview:btn];
    
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 50)];
    titleLabel.text = @"选择你当前的状态";
    titleLabel.font = [UIFont systemFontOfSize:19];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [Utility colorWithHexString:@"ffffff" alpha:1.0 ];
    [_bgView addSubview:titleLabel];

    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(titleLabel.frame), _bgView.frame.size.width-10, 1)];
    lineView.backgroundColor = [Utility colorWithHexString:@"#4f4f50" alpha:1.0];
    [_bgView addSubview:lineView];

    CGFloat spaceY = CGRectGetMaxY(lineView.frame) + 24;
    CGFloat spaceX = 28;
    UIColor *cor = [Utility colorWithHexString:@"DAB878" alpha:1.0];
    for (NSInteger index1 = 0 ; index1 < 2; index1++) {

        for (NSInteger index2 = 0 ; index2 < 3; index2 ++) {
        
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:CGRectMake(spaceX + (26 + 75) * index2, spaceY + (33 +40) *index1, 75, 40)];
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = [Utility colorWithHexString:@"DAB878" alpha:1.0].CGColor;
            btn.layer.cornerRadius = 5;
            btn.layer.masksToBounds = YES;
            [btn setTitleColor:cor forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
            if (index1 < 1) {
                
                btn.tag = 1200 + index2;
//                [btn setImage:[UIImage imageNamed:statusAry[index2]] forState:(UIControlStateNormal)];
//                [btn setImage:[UIImage imageNamed:statusSectedAry[index2]] forState:(UIControlStateSelected)];
                [btn setTitle:statusStringAry[index2] forState:UIControlStateNormal];
            }else{
                
                btn.tag = 1200 + 3 + index2;
//                [btn setImage:[UIImage imageNamed:statusAry[3 + index2]] forState:(UIControlStateNormal)];
//                [btn setImage:[UIImage imageNamed:statusSectedAry[3 + index2]] forState:(UIControlStateSelected)];
                [btn setTitle:statusStringAry[3 + index2] forState:UIControlStateNormal];
            }
            
            [btn setBackgroundImage:[Utility createImageWithColor:cor] forState:UIControlStateSelected];
            
            [btn addTarget:self action:@selector(selectedUserStyleIndex2ClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];


            [_bgView addSubview:btn];
            
            if (0 == index1 && 0 == index2) {
                
                btn.selected = YES;
                _indexPathLast = 1200;
            }
        }
    }

    //add status
    UIButton * addStatus = [UIButton buttonWithType:UIButtonTypeCustom];
    [addStatus setFrame:CGRectMake(28, _bgView.bounds.size.height - 28 - 45, _bgView.bounds.size.width - 56, 45)];
    [addStatus setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [addStatus setTitle:@"确认" forState:(UIControlStateNormal)];
    [addStatus setBackgroundColor:[Utility colorWithHexString:@"DAB878" alpha:1.0 ]];
    [addStatus addTarget:self action:@selector(requestAddStatusClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    addStatus.layer.cornerRadius = 5;
    [addStatus.layer setMasksToBounds:YES];
    addStatus.titleLabel.font = [UIFont systemFontOfSize:18];
    [_bgView addSubview:addStatus];
    
}


-(void)selectedClickMethod:(UIButton*)sender{
    
    if (1100 == sender.tag) {
        
        [self removeFromSuperview];
        
    }else if(1101 == sender.tag){
        
        //从挂装态 跳转到选择状态页
        [UIView animateWithDuration:.2 animations:^{
            
            for (UIView * vi in self.subviews) {
                
                vi.alpha = 0.0;
            }
            
        } completion:^(BOOL finished) {
            
            for (UIView * vi in self.subviews) {
                
                [vi removeFromSuperview];
            }
            
            [self setUpStatusUI];
            
        }];
    }
}


//        发起状态请求
-(void)requestAddStatusClickMethod:(UIButton*)sender{

    if (_indexPathLast < 1200) {
        return;
    }
    
    NSInteger statusInteger = _indexPathLast - 1200 + 1;
    
    [TLHTTPRequest MY_postWithBaseUrl:AddStatementUrl parameters:@{@"statement":@(statusInteger)} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            [LQProgressHud showMessage:@"挂状态成功"];
            
            [self removeFromSuperview];

        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
    
    
    
}

// 选择按钮
-(void)selectedUserStyleIndex2ClickMethod:(UIButton*)sender{
    
    if (_indexPathLast == sender.tag) {
        
        return;
    }
    
    UIButton * lastClickbtn = [_bgView viewWithTag:_indexPathLast];
    lastClickbtn.selected = NO;
    
    UIButton *  currentClicbtn = [_bgView viewWithTag:sender.tag];
    currentClicbtn.selected = YES;

    
    _indexPathLast = sender.tag;

}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
