//
//  MY_TTLSendMessageRedEnvelopView.m
//  VTIME
//
//  Created by 听听 on 2017/12/4.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLSendMessageRedEnvelopView.h"
#define kSMAlertWidth     320
#define kSMAlertHeight    410
@interface MY_TTLSendMessageRedEnvelopView ()
{
    UIButton* _btnBack;
    NSInteger _price;
    UIButton * _oldBtn;
    UIButton * _oldSexBtn;
}
@property (nonatomic, strong) UIView        * backImageView;

@property (nonatomic, strong) UILabel       * titleLabel;
@property (nonatomic, strong) UILabel       * detailLabel;
@property (nonatomic, strong) UITextField   * moneyTextField;
@property (nonatomic, strong) UILabel   * priceLbl;
@end

@implementation MY_TTLSendMessageRedEnvelopView
-(instancetype)init
{
    
    if (self = [super init])
    {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    self.backgroundColor = [Utility colorWithHexString:@"#272729" alpha:1.0];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 15/2;
    
    
    UIView * blackView = [[UIView alloc] init];
    blackView.backgroundColor = [Utility colorWithHexString:@"#272729" alpha:1.0];
    blackView.alpha = 0.8;
    [self addSubview:blackView];
    
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.text = @"和附近的十个小伙伴打招呼";
    [self addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).mas_offset(0);
        make.left.equalTo(self.mas_left);
        make.width.equalTo(self.mas_width);
        make.height.mas_equalTo(44);
    }];
    UIColor * lineColor = [Utility colorWithHexString:@"5c5c5d" alpha:1.0];
    UIView * toplineView = [[UIView alloc] init];
    toplineView.backgroundColor = lineColor;
    [self addSubview:toplineView];
    
    [toplineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.titleLabel.mas_bottom).mas_offset(2);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(1);
    }];
    
    
    UIView * bottomlineView = [[UIView alloc] init];
    bottomlineView.backgroundColor = [Utility colorWithHexString:@"5c5c5c" alpha:1.0];
    [self addSubview:bottomlineView];
    
    [bottomlineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).mas_offset(-42);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(1);
    }];
    
    self.moneyTextField = [[UITextField alloc] init];
    self.moneyTextField.textAlignment = NSTextAlignmentCenter;
    self.moneyTextField.backgroundColor = [Utility colorWithHexString:@"#F0F0F0" alpha:1.0];
    self.moneyTextField.font = [UIFont systemFontOfSize:16];
    self.moneyTextField.layer.masksToBounds = YES;
    self.moneyTextField.layer.cornerRadius = 3;
    //    self.moneyTextField.layer.borderColor = [Utility colorWithHexString:@"f0f0f0" alpha:1.0].CGColor;
    //    self.moneyTextField.layer.borderWidth = 1.0;
    self.moneyTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.moneyTextField.delegate = self;
    [self addSubview:self.moneyTextField];
    
    NSString *holderText = @"美女们都在干嘛呢？";
    
    NSMutableAttributedString * placeholder = [[NSMutableAttributedString alloc] initWithString:holderText];
    
    [placeholder addAttribute:NSForegroundColorAttributeName
                        value:[Utility colorWithHexString:@"#aaaaaa" alpha:1.0]
                        range:NSMakeRange(0, holderText.length)];
    
    [placeholder addAttribute:NSFontAttributeName
                        value:[UIFont systemFontOfSize:13]
                        range:NSMakeRange(0, holderText.length)];
    
    self.moneyTextField.attributedPlaceholder = placeholder;
    
    [self.moneyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(toplineView.mas_bottom).mas_offset(24+84+30+38+15 +30);
        make.centerX.equalTo(self.mas_centerX);
        make.height.mas_equalTo(62);
        make.width.mas_equalTo(275);
    }];
    
    self.detailLabel = [[UILabel alloc] init];
//    self.detailLabel.textColor = [Utility colorWithHexString:@"878787" alpha:1.0];
//    self.detailLabel.font = [UIFont systemFontOfSize:12];
//    self.detailLabel.numberOfLines = 2;
//    self.detailLabel.layer.masksToBounds = YES;
    //    self.detailLabel.layer.borderColor = lineColor.CGColor;
    //    self.detailLabel.layer.borderWidth = 0.5;
    self.detailLabel.layer.cornerRadius = 4.0;
     self.detailLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:10];
    self.detailLabel.textColor = [Utility colorWithHexString:@"#FFC470" alpha:1.0];
    [self addSubview:self.detailLabel];
    
    self.detailLabel.text = @"发送淫秽色情信息将会被封号";
    //
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.moneyTextField.mas_bottom).mas_offset(5);
        make.left.equalTo(self.moneyTextField.mas_left);
        make.width.mas_equalTo(265);
        make.height.mas_equalTo(15);
    }];
    //    NSArray * redPaceketBtns = @[@"10", @"50", @"100"];
    CGFloat space = (kSMAlertWidth - 22 * 2 - 84 * 3) / 2;
    for (NSInteger i = 0; i < 3; i++) {
        //        NSString * title = redPaceketBtns[i];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [btn setTitle:title forState:UIControlStateNormal];
        //        [btn setTitleColor:[Utility colorWithHexString:@"feff00" alpha:1.0] forState:UIControlStateNormal];
        //        btn.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22];
        if (i == 0) {
            [btn setBackgroundImage:[UIImage imageNamed:@"10redP"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"10redPS"] forState:UIControlStateSelected];
            btn.selected = YES;
            _oldBtn = btn;
        }else if(i == 1){
            [btn setBackgroundImage:[UIImage imageNamed:@"50redP"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"50redPS"] forState:UIControlStateSelected];
        }else{
            [btn setBackgroundImage:[UIImage imageNamed:@"100redP"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"100redPS"] forState:UIControlStateSelected];
        }
        //        [btn setBackgroundImage:[UIImage imageNamed:@"sayRedPacketN"] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(redPaceketBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        btn.titleEdgeInsets = UIEdgeInsetsMake(8, -2, 0, 0);
        btn.tag = 1000 + i;
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(toplineView.mas_bottom).mas_offset(24);
            make.left.equalTo(self.mas_left).mas_offset(22 + space * i + 84 * i);
            make.height.mas_equalTo(84);
            make.width.mas_equalTo(84);
        }];
    }
     CGFloat spaceSex = (kSMAlertWidth - (55 * 2 + 70)) / 4;
    for (NSInteger i = 0; i < 3; i++) {
        //        NSString * title = redPaceketBtns[i];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.layer.borderColor = [Utility colorWithHexString:@"#A07B48" alpha:1.0].CGColor;
        btn.layer.borderWidth = 1.0;
        [btn setBackgroundColor:[UIColor clearColor]];
        btn.layer.cornerRadius = 3;
        btn.layer.masksToBounds = YES;
//        [btn setTintColor:[Utility colorWithHexString:@"#B88D51" alpha:1.0]];
        [btn setTitleColor:[Utility colorWithHexString:@"#B88D51" alpha:1.0] forState:UIControlStateNormal];
        [btn setTitleColor:[Utility colorWithHexString:@"#FFFEFE" alpha:1.0] forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:18];
    
        if (i == 0) {
            [btn setBackgroundColor:[Utility colorWithHexString:@"#B88D51" alpha:1.0]];
//            [btn setTitleColor:[Utility colorWithHexString:@"##FFFEFE" alpha:1.0] forState:UIControlStateNormal];
            [btn setTitle:@"女" forState:UIControlStateNormal];
            btn.selected = YES;
            _oldSexBtn = btn;
        }else if(i == 1){
              [btn setTitle:@"男" forState:UIControlStateNormal];
        }else{
              [btn setTitle:@"不限" forState:UIControlStateNormal];
        }
        //        [btn setBackgroundImage:[UIImage imageNamed:@"sayRedPacketN"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(sexBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
//        btn.titleEdgeInsets = UIEdgeInsetsMake(8, -2, 0, 0);
        btn.tag = 1000 + i;
        
        CGFloat w = 55;
        CGFloat marg = spaceSex +(spaceSex + w) *i;
        if (i == 2) {
//            marg = spaceSex +(spaceSex + w) *i+ 15;
            w = 70;
        }
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(toplineView.mas_bottom).mas_offset(24+84+20);
            make.left.equalTo(self.mas_left).mas_offset(marg);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(w);
        }];
    }
    
    _price = 10;
    UILabel * yuanLabel = [[UILabel alloc] init];
    yuanLabel.textColor = [Utility colorWithHexString:@"#FFFEFE" alpha:1.0];
    yuanLabel.textAlignment = NSTextAlignmentCenter;
    yuanLabel.font =  [UIFont systemFontOfSize:18];
    yuanLabel.text = @"共100元";
    [self addSubview:yuanLabel];
    [yuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(toplineView.mas_bottom).mas_offset(24+84+20+38+5);
        make.left.equalTo(self.moneyTextField.mas_left);
        make.right.equalTo(self.moneyTextField.mas_right);
        make.height.mas_equalTo(30);
    }];
    self.priceLbl =  yuanLabel;
    
    CGFloat bottomWidth = kSMAlertWidth;
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"确认" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).mas_offset(-5);
        make.centerX.equalTo(self.mas_centerX);
        make.height.mas_equalTo(37);
        make.width.mas_equalTo(bottomWidth);
    }];
//    if (![Utility isAuditEnvironment]) {
//        NSString * title = @"成为贵族可开启畅聊特权 >";
//        UIButton * gzbtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [gzbtn setTitle:title forState:UIControlStateNormal];
//        [gzbtn setTitleColor:[Utility colorWithHexString:@"ff3d30" alpha:1.0] forState:UIControlStateNormal];
//        gzbtn.titleLabel.font = [UIFont systemFontOfSize:14];
//        gzbtn.titleLabel.textAlignment = NSTextAlignmentRight;
//        [gzbtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:gzbtn];
//        gzbtn.tag = 3000 + 1;
//        [gzbtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.detailLabel.mas_bottom).mas_offset(10);
//            make.width.mas_equalTo(170);
//            make.height.mas_equalTo(30);
//            make.right.equalTo(self.moneyTextField.mas_right);
//        }];
//    }
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
    CGRect afterFrame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kSMAlertWidth) * 0.5,( CGRectGetHeight(topVC.view.bounds) - kSMAlertHeight) * 0.5, kSMAlertWidth, kSMAlertHeight);
    
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
        self.backImageView.alpha = 0.8;
        self.backImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        _btnBack = [UIButton buttonWithType:UIButtonTypeSystem];
        _btnBack.frame = self.backImageView.bounds;
        _btnBack.backgroundColor = [UIColor clearColor];
        [_btnBack addTarget:self action:@selector(dismissAlert) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [topVC.view addSubview:self.backImageView];
    [self.backImageView addSubview:_btnBack];
    
    
    
    CGRect afterFrame = CGRectMake((SCREEN_WIDTH - kSMAlertWidth) / 2, (SCREEN_HEIGHT - kSMAlertHeight) / 2, kSMAlertWidth, kSMAlertHeight);
    self.frame = afterFrame;
    
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.backImageView.alpha = 0.8f;
        self.frame = afterFrame;
        
    } completion:^(BOOL finished) {
        
    }];
    [super willMoveToSuperview:newSuperview];
}


- (void)dismissAlert
{
    [UIView animateWithDuration:0.2 animations:^{
        [self removeFromSuperview];
    }];
}
- (void)sexBtnClick:(UIButton*)sender{
    if (sender == _oldSexBtn) {
        return;
    }
    
    [_oldSexBtn setBackgroundColor:[UIColor clearColor]];
//    [_oldSexBtn setTitleColor:[Utility colorWithHexString:@"#B88D51" alpha:1.0] forState:UIControlStateNormal];
    _oldSexBtn.selected = NO;
    sender.selected = YES;
    _oldSexBtn = sender;
    [_oldSexBtn setBackgroundColor:[Utility colorWithHexString:@"B88D51" alpha:1.0]];
//    [_oldSexBtn setTitleColor:[Utility colorWithHexString:@"#FFFEFE" alpha:1.0] forState:UIControlStateNormal];
}

//  红包按钮 tag 1000+
- (void)redPaceketBtnClick:(UIButton *)btn {
    
    self.moneyTextField.text = @"";
    
    _oldBtn.selected = NO;
    btn.selected = YES;
    _oldBtn = btn;
    
    NSInteger index = btn.tag - 1000;
    
    switch (index) {
        case 1:
            _price = 50;
            break;
        case 2:
            _price = 100;
            break;
        default:
            _price = 10;
            break;
    }
    self.priceLbl.text = [NSString stringWithFormat:@"共%ld元",_price * 10];
    
}


//  底部按钮 tag 2000+
- (void)bottomBtnClick:(UIButton *)btn {
    if (self.affirmBtnblock) {
        
        if (_price) {
            self.affirmBtnblock(_price);
        }
        else {
            if (self.moneyTextField.text.integerValue >= 100) {
                self.affirmBtnblock(self.moneyTextField.text.integerValue);
            }
            else {
                [LQProgressHud showMessage:@"请输入大于100"];
                return;
            }
        }
    }
    
    [self dismissAlert];
}

//  底部按钮 tag 3000+
//- (void)btnClick:(UIButton *)btn {
//
//    [self dismissAlert];
//
//    NSInteger index = btn.tag - 3000;
////
//    if (self.GetNobilityBlock) {
//        self.GetNobilityBlock(index);
//    }
//}
- (void)setBigTitle:(NSString *)bigTitle{
    _bigTitle = bigTitle;
    self.titleLabel.text = bigTitle;
    
}
- (void)setDetailTitle:(NSString *)detailTitle{
    _detailTitle = detailTitle;
    self.detailLabel.text = detailTitle;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    _price = 0;
    _oldBtn.selected = NO;
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
