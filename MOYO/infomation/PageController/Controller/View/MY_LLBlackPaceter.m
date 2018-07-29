//
//  MY_LLBlackPaceter.m
//  VTIME
//
//  Created by Louie on 2017/9/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLBlackPaceter.h"

#define kAlertWidth     (SCREEN_WIDTH - 80)
#define kAlertHeight    210

@interface MY_LLBlackPaceter()

@property (nonatomic, strong) UIView        * backImageView;

@property (nonatomic, strong) UITextField   * moneyTextField;

@end



@implementation MY_LLBlackPaceter


-(instancetype)init
{
    
    if (self = [super init])
    {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    
    UIColor * lineColor = [Utility colorWithHexString:@"e5e5e5" alpha:1.0];
    
    UIView * lineView = [[UIView alloc] init];
    lineView.backgroundColor = lineColor;
    [self addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.mas_bottom).mas_offset(-90);
        make.left.equalTo(self.mas_left).mas_offset(60);
        make.right.equalTo(self.mas_right).mas_offset(-60);
        make.height.mas_equalTo(1);
    }];
    
    UIImageView *img = [[UIImageView alloc] init];
    img.image = [UIImage imageNamed:@"icon_blackMoney"];
    [self addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).mas_offset(27);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(87);
        make.height.mas_equalTo(29);
    }];
    
    self.moneyTextField = [[UITextField alloc] init];
    self.moneyTextField.textAlignment = NSTextAlignmentCenter;
    self.moneyTextField.font = [UIFont systemFontOfSize:17];
    self.moneyTextField.borderStyle = UITextBorderStyleNone;
//    self.moneyTextField.layer.masksToBounds = YES;
//    self.moneyTextField.layer.cornerRadius = 6;
//    self.moneyTextField.layer.borderColor = [Utility colorWithHexString:@"999999" alpha:1.0].CGColor;
//    self.moneyTextField.layer.borderWidth = 1.0;
    self.moneyTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:self.moneyTextField];
    
    NSString *holderText = @"金额必须大于2500元";
    
    NSMutableAttributedString * placeholder = [[NSMutableAttributedString alloc] initWithString:holderText];
    
    [placeholder addAttribute:NSForegroundColorAttributeName
                        value:[Utility colorWithHexString:@"#999999" alpha:1.0]
                        range:NSMakeRange(0, holderText.length)];
    
    [placeholder addAttribute:NSFontAttributeName
                        value:[UIFont systemFontOfSize:16]
                        range:NSMakeRange(0, holderText.length)];
    
    self.moneyTextField.attributedPlaceholder = placeholder;
    
    [self.moneyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(lineView.mas_bottom);
        make.centerX.equalTo(self.mas_centerX);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(kAlertWidth);
    }];
    
    
    UILabel * yuanLabel = [[UILabel alloc] init];
    yuanLabel.textColor = COlOR333;
    yuanLabel.textAlignment = NSTextAlignmentLeft;
    yuanLabel.font = [UIFont systemFontOfSize:17];
    yuanLabel.text = @"元";
    [self addSubview:yuanLabel];
    
    [yuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.moneyTextField.mas_centerY);
        make.left.equalTo(self.moneyTextField.mas_right).mas_offset(5);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(20);
    }];
    
    NSArray * bottomBtns = @[@"取消", @"确认"];
    CGFloat bottomWidth = 67;
    for (NSInteger i = 0; i < bottomBtns.count; ++i) {
        
        NSString * title = bottomBtns[i];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:title forState:UIControlStateNormal];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        btn.titleLabel.font = [UIFont systemFontOfSize:17];
        [btn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        btn.tag = 2000 + i;
        
        if (i == 0) {
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[Utility colorWithHexString:@"#28272B" alpha:1.0]];
        }else{
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[Utility colorWithHexString:@"#DAB878" alpha:1.0]];
        }
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(self.mas_bottom).mas_offset(-25);
            make.left.equalTo(self.mas_left).mas_offset(kAlertWidth/2 *i + (kAlertWidth- bottomWidth*2)/4);
            make.height.mas_equalTo(37);
            make.width.mas_equalTo(bottomWidth);
        }];
    }
}


- (void)show
{
    UIViewController *topVC = [self appRootViewController];
    [topVC.view addSubview:self];
}


- (UIViewController *)appRootViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}


- (void)removeFromSuperview
{
    [self.backImageView removeFromSuperview];
    self.backImageView = nil;
    
    UIViewController *topVC = [self appRootViewController];
    CGRect afterFrame = CGRectMake(40 ,( CGRectGetHeight(topVC.view.bounds) - kAlertHeight) * 0.5, kAlertWidth, kAlertHeight);
    
    self.frame = afterFrame;
    [super removeFromSuperview];
}



- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview == nil) {
        return;
    }
    UIViewController *topVC = [self appRootViewController];
    
    if (!self.backImageView) {
        self.backImageView = [[UIView alloc] initWithFrame:topVC.view.bounds];
        self.backImageView.backgroundColor = [UIColor blackColor];
        self.backImageView.alpha = 0;
        self.backImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        //        _btnBack = [UIButton buttonWithType:UIButtonTypeSystem];
        //        _btnBack.frame = self.backImageView.bounds;
        //        _btnBack.backgroundColor = [UIColor clearColor];
        //        [_btnBack addTarget:self action:@selector(hideViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [topVC.view addSubview:self.backImageView];
    //    [self.backImageView addSubview:_btnBack];
    
    
    
    CGRect afterFrame = CGRectMake(40, (SCREEN_HEIGHT - kAlertHeight) / 2, kAlertWidth, kAlertHeight);
    self.frame = afterFrame;
    
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.backImageView.alpha = 0.6f;
        self.frame = afterFrame;
        
    } completion:^(BOOL finished) {
        
    }];
    [super willMoveToSuperview:newSuperview];
}



//-(void)hideViewClick:(UIButton *)btn
//{
//    [self dismissAlert];
//}



- (void)dismissAlert
{
    [UIView animateWithDuration:0.2 animations:^{
        [self removeFromSuperview];
    }];
}


//  底部按钮 tag 2000+
- (void)bottomBtnClick:(UIButton *)btn {
    
    NSInteger index = btn.tag - 2000;
    
    switch (index) {
        case 1:
        {
            if (self.affirmBtnblock) {
            
                if (self.moneyTextField.text.integerValue >= 2500) {
                    self.affirmBtnblock(self.moneyTextField.text.integerValue);
                    [self dismissAlert];
                }
                else {
                    [LQProgressHud showMessage:@"请输入大于2500"];
                }
            }
        }
            break;
        default:
            [self dismissAlert];
            break;
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
