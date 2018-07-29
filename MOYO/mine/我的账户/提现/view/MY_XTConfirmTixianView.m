//
//  MY_XTConfirmTixianView.m
//  VTIME
//
//  Created by tingting on 2017/11/3.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTConfirmTixianView.h"

@interface MY_XTConfirmTixianView()
{
    UIView *_contentView;
}

@end

@implementation MY_XTConfirmTixianView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame])
    {
        [self initContent];
    }
    
    return self;
}

- (void)initContent
{
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    //alpha 0.0  白色   alpha 1 ：黑色   alpha 0～1 ：遮罩颜色，逐渐
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];
    
    if (_contentView == nil)
    {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(44 * SCREEN_WIDTH/375, 187 * SCREEN_HEIGHT/667, 288 * SCREEN_WIDTH/375, 208 * SCREEN_HEIGHT/667)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
        
        self.WayTixianLabel = [[UILabel alloc]initWithFrame:CGRectMake(34 * SCREEN_WIDTH/375, 19* SCREEN_HEIGHT/667, 200 * SCREEN_WIDTH/375, 17* SCREEN_HEIGHT/667)];
        self.WayTixianLabel.text = @"提现方式:微信";
        self.WayTixianLabel.font = [UIFont systemFontOfSize:17* SCREEN_HEIGHT/667];
        self.WayTixianLabel.textColor = [Utility colorWithHexString:@"#000000" alpha:1.0f];
        self.WayTixianLabel.textAlignment = NSTextAlignmentLeft;
        [_contentView addSubview:self.WayTixianLabel];
        
        self.NumTixianLabel = [[UILabel alloc]initWithFrame:CGRectMake(34 * SCREEN_WIDTH/375, 49* SCREEN_HEIGHT/667, 200 * SCREEN_WIDTH/375, 17* SCREEN_HEIGHT/667)];
        self.NumTixianLabel.text = @"账号:12345663254";
        self.NumTixianLabel.font = [UIFont systemFontOfSize:17* SCREEN_HEIGHT/667];
        self.NumTixianLabel.textColor = [Utility colorWithHexString:@"#000000" alpha:1.0f];
        self.NumTixianLabel.textAlignment = NSTextAlignmentLeft;
        [_contentView addSubview:self.NumTixianLabel];
        
        self.NameTixianLabel = [[UILabel alloc]initWithFrame:CGRectMake(34 * SCREEN_WIDTH/375, 78* SCREEN_HEIGHT/667, 200 * SCREEN_WIDTH/375, 17* SCREEN_HEIGHT/667)];
        self.NameTixianLabel.text = @"姓名:微信";
        self.NameTixianLabel.font = [UIFont systemFontOfSize:17* SCREEN_HEIGHT/667];
        self.NameTixianLabel.textColor = [Utility colorWithHexString:@"#000000" alpha:1.0f];
        self.NameTixianLabel.textAlignment = NSTextAlignmentLeft;
        [_contentView addSubview:self.NameTixianLabel];
        
        self.MoneyTixianLabel = [[UILabel alloc]initWithFrame:CGRectMake(34 * SCREEN_WIDTH/375, 106* SCREEN_HEIGHT/667, 200 * SCREEN_WIDTH/375, 17* SCREEN_HEIGHT/667)];
        self.MoneyTixianLabel.text = @"金额:10000元";
        self.MoneyTixianLabel.font = [UIFont systemFontOfSize:17* SCREEN_HEIGHT/667];
        self.MoneyTixianLabel.textColor = [Utility colorWithHexString:@"#000000" alpha:1.0f];
        self.MoneyTixianLabel.textAlignment = NSTextAlignmentLeft;
        [_contentView addSubview:self.MoneyTixianLabel];
        
        UIButton *_getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _getCodeBtn.frame = CGRectMake(33* SCREEN_WIDTH/375,143* SCREEN_HEIGHT/667,78* SCREEN_WIDTH/375, 44* SCREEN_HEIGHT/667);
        [_getCodeBtn setTitleColor:[Utility colorWithHexString:@"#FFFFFF" alpha:1] forState:UIControlStateNormal];
        [_getCodeBtn setTitle:@"取消" forState:UIControlStateNormal];
        _getCodeBtn.layer.cornerRadius = 5.0;
        _getCodeBtn.clipsToBounds = YES;
        _getCodeBtn.backgroundColor = [Utility colorWithHexString:@"#28272B" alpha:1.0f];
        _getCodeBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_getCodeBtn addTarget:self action:@selector(disMissView) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:_getCodeBtn];
        
        UIButton *_yesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _yesBtn.frame = CGRectMake(177* SCREEN_WIDTH/375,143* SCREEN_HEIGHT/667,78* SCREEN_WIDTH/375, 44* SCREEN_HEIGHT/667);
        [_yesBtn setTitleColor:[Utility colorWithHexString:@"#28272B" alpha:1] forState:UIControlStateNormal];
        [_yesBtn setTitle:@"确认" forState:UIControlStateNormal];
        _yesBtn.layer.cornerRadius = 5.0;
        _yesBtn.clipsToBounds = YES;
        _yesBtn.backgroundColor = [Utility colorWithHexString:@"#DAB878" alpha:1.0f];
        _yesBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_yesBtn addTarget:self action:@selector(confirmClick) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:_yesBtn];
        
//        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerTapped:)];
//
//        [_contentView addGestureRecognizer:singleTap];
        
    }
}

- (void)showInView:(UIView *)view
{
    if (!view)
    {
        return;
    }
    
    [view addSubview:self];
    [view addSubview:_contentView];
    
    [_contentView setFrame:CGRectMake(44 * SCREEN_WIDTH/375, SCREEN_HEIGHT, 288 * SCREEN_WIDTH/375, SCREEN_HEIGHT - 208 * SCREEN_HEIGHT/667)];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 1.0;
        
        [_contentView setFrame:CGRectMake(44 * SCREEN_WIDTH/375, 187 * SCREEN_HEIGHT/667, 288 * SCREEN_WIDTH/375, 208 * SCREEN_HEIGHT/667)];
        
    } completion:nil];
}

- (void)disMissView
{
    [_contentView setFrame:CGRectMake(44 * SCREEN_WIDTH/375, 187 * SCREEN_HEIGHT/667, 288 * SCREEN_WIDTH/375, 208 * SCREEN_HEIGHT/667)];
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.alpha = 0.0;
                         
                         [_contentView setFrame:CGRectMake(44 * SCREEN_WIDTH/375, SCREEN_HEIGHT, 288 * SCREEN_WIDTH/375, SCREEN_HEIGHT - 208 * SCREEN_HEIGHT/667)];
                     }
                     completion:^(BOOL finished){
                         
                         [self removeFromSuperview];
                         [_contentView removeFromSuperview];
                         
                     }];
    
}

-(void)confirmClick
{
    [LQProgressHud showLoading:nil];
    
    [TLHTTPRequest MY_postWithBaseUrl:SubmitVXorZFBMoneyURL parameters:self.TiXianDic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {

        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TiXianSuccess" object:nil];
            
            
            [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            [self disMissView];

        }
        else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                [self disMissView];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"请求失败，请检查网络"];
    }];
    
}


@end
