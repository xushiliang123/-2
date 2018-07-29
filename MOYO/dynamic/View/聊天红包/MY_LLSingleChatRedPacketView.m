//
//  MY_LLSingleChatRedPacketView.m
//  VTIME
//
//  Created by 听听 on 2017/11/16.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLSingleChatRedPacketView.h"
#define kSAlertWidth     320
#define kSAlertHeight    287

@interface MY_LLSingleChatRedPacketView()<UITextFieldDelegate>
{
    UIButton* _btnBack;
    NSInteger _price;
    UIButton * _oldBtn;
}
@property (nonatomic, strong) UIView        * backImageView;

@property (nonatomic, strong) UILabel       * titleLabel;
@property (nonatomic, strong) UILabel       * detailLabel;
@property (nonatomic, strong) UITextField   * moneyTextField;
@property (nonatomic, assign) CGFloat  balance;   //我的余额

@end

@implementation MY_LLSingleChatRedPacketView

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
    self.titleLabel.text = @"为了愉快的聊天，发个红包";
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
        make.bottom.equalTo(self.mas_bottom).mas_offset(-37);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(1);
    }];
    
    self.moneyTextField = [[UITextField alloc] init];
    self.moneyTextField.textAlignment = NSTextAlignmentCenter;
    self.moneyTextField.backgroundColor = [Utility colorWithHexString:@"f0f0f0" alpha:1.0];
    self.moneyTextField.font = [UIFont systemFontOfSize:16];
    self.moneyTextField.layer.masksToBounds = YES;
    self.moneyTextField.layer.cornerRadius = 3;
//    self.moneyTextField.layer.borderColor = [Utility colorWithHexString:@"f0f0f0" alpha:1.0].CGColor;
//    self.moneyTextField.layer.borderWidth = 1.0;
    self.moneyTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.moneyTextField.delegate = self;
    [self addSubview:self.moneyTextField];
    
    NSString *holderText = @"壕随意，金额必须大于100";
    
    NSMutableAttributedString * placeholder = [[NSMutableAttributedString alloc] initWithString:holderText];
    
    [placeholder addAttribute:NSForegroundColorAttributeName
                        value:[Utility colorWithHexString:@"#aaaaaa" alpha:1.0]
                        range:NSMakeRange(0, holderText.length)];
    
    [placeholder addAttribute:NSFontAttributeName
                        value:[UIFont systemFontOfSize:13]
                        range:NSMakeRange(0, holderText.length)];
    
    self.moneyTextField.attributedPlaceholder = placeholder;
    
    [self.moneyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bottomlineView.mas_top).mas_offset(-39);
        make.centerX.equalTo(self.mas_centerX);
        make.height.mas_equalTo(31);
        make.width.mas_equalTo(275);
    }];
    
    self.detailLabel = [[UILabel alloc] init];
    self.detailLabel.textColor = [Utility colorWithHexString:@"878787" alpha:1.0];
    self.detailLabel.font = [UIFont systemFontOfSize:12];
    self.detailLabel.numberOfLines = 2;
    self.detailLabel.layer.masksToBounds = YES;
    //    self.detailLabel.layer.borderColor = lineColor.CGColor;
    //    self.detailLabel.layer.borderWidth = 0.5;
    self.detailLabel.layer.cornerRadius = 4.0;
    [self addSubview:self.detailLabel];
    
    self.detailLabel.text = @"若对方12小时未回应 红包全额退还";
    //
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.moneyTextField.mas_bottom).mas_offset(5);
        make.left.equalTo(self.moneyTextField.mas_left);
        make.width.mas_equalTo(265);
        make.height.mas_equalTo(15);
    }];
    
//    NSArray * redPaceketBtns = @[@"10", @"50", @"100"];
    CGFloat space = (kSAlertWidth - 22 * 2 - 84 * 3) / 2;
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
    
//    UILabel * yuanLabel = [[UILabel alloc] init];
//    yuanLabel.textColor = COlOR333;
//    yuanLabel.textAlignment = NSTextAlignmentLeft;
//    yuanLabel.font = [UIFont systemFontOfSize:17];
//    yuanLabel.text = @"元";
//    [self addSubview:yuanLabel];
//
//    [yuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.centerY.equalTo(self.moneyTextField.mas_centerY);
//        make.left.equalTo(self.moneyTextField.mas_right).mas_offset(5);
//        make.height.mas_equalTo(50);
//        make.width.mas_equalTo(20);
//    }];
    
    CGFloat bottomWidth = kSAlertWidth;
   
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"确认" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.centerX.equalTo(self.mas_centerX);
        make.height.mas_equalTo(37);
        make.width.mas_equalTo(bottomWidth);
    }];
    
//    if (![Utility isAuditEnvironment]) {
//        NSArray * btns = @[@"贵族享受畅聊特权", @"立即成为贵族 >"];
//        for (NSInteger i = 0; i < btns.count; ++i) {
//
//            NSString * title = btns[i];
//            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
//            [btn setTitle:title forState:UIControlStateNormal];
//            if ([title isEqualToString:@"贵族享受畅聊特权"]) {
//                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            }
//            else {
//                [btn setTitleColor:[Utility colorWithHexString:@"ff3d30" alpha:1.0] forState:UIControlStateNormal];
//            }
//            btn.titleLabel.font = [UIFont systemFontOfSize:17];
//            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
//            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//            [self addSubview:btn];
//
//            btn.tag = 3000 + i;
//
//            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//
//                make.bottom.equalTo(bottomlineView.mas_top);
//                make.left.equalTo(self.mas_left).mas_offset(bottomWidth * i);
//                make.height.mas_equalTo(59);
//                make.width.mas_equalTo(bottomWidth);
//            }];
//        }
//    }
    _price = 10;
    
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
    CGRect afterFrame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kSAlertWidth) * 0.5,( CGRectGetHeight(topVC.view.bounds) - kSAlertHeight) * 0.5, kSAlertWidth, kSAlertHeight);
    
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
    
    
    
    CGRect afterFrame = CGRectMake((SCREEN_WIDTH - kSAlertWidth) / 2, (SCREEN_HEIGHT - kSAlertHeight) / 2, kSAlertWidth, kSAlertHeight);
    self.frame = afterFrame;
    
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.backImageView.alpha = 0.8f;
        self.frame = afterFrame;
        
    } completion:^(BOOL finished) {
        
    }];
    [self getTotelMoneyRequest];
    [super willMoveToSuperview:newSuperview];
}
- (void)getTotelMoneyRequest{
    [LQProgressHud showLoading:nil];
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    __weak typeof(self)WeakSelf = self;
    [TLHTTPRequest MY_getWithBaseUrl:BalanceURL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        [LQProgressHud hide];
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            NSDictionary * infoDict = data[@"info"];
            WeakSelf.balance = [infoDict[@"totalMoney"] floatValue];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"请求失败，请检查网络连接"];
    }];
}

- (void)dismissAlert
{
    [UIView animateWithDuration:0.2 animations:^{
        [self removeFromSuperview];
    }];
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
    
}
//  底部按钮 tag 2000+
- (void)bottomBtnClick:(UIButton *)btn {

    if (self.affirmBtnblock) {
        CGFloat priceT;
        if (_price) {
            priceT = _price;
        }else{
            if (self.moneyTextField.text.integerValue < 100) {
                [LQProgressHud showMessage:@"请输入大于100"];
                return;
            }else{
                priceT = self.moneyTextField.text.integerValue;
            }
        }
        
        if (self.balance <= priceT) {
            self.affirmBtnblock(priceT);
        }else{
            [self sendHongBao:priceT];
        }
       
    }
    
    [self dismissAlert];
}
- (void)sendHongBao:(CGFloat)price{
    if (self.redPacketType == RedPacketVChat ) {
        [self sendChatHongBao:price]; //发小红包
    }else{
        [self sendRedPacketDynamic:price];  //发动态红包
    }
}
- (void)sendChatHongBao:(CGFloat)price{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:self.userId forKey:@"userId"];
    [parameters setObject:@(price) forKey:@"money"];
    [parameters setObject:@(self.payType) forKey:@"type"];
    [parameters setObject:@(0) forKey:@"payMode"];
    [LQProgressHud showLoading:@"正在提交..."];
    [TLHTTPRequest MY_postWithBaseUrl:SenderRedPacketURL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//        [LQProgressHud hide];
        if ([data[@"ret"] integerValue] == 0) {
            if ([self.delegate respondsToSelector:@selector(paySucessForChatRedPacketView:withPrice:)]) {
                [self.delegate paySucessForChatRedPacketView:self withPrice:[NSString stringWithFormat:@"%f",price]];
            }
            [LQProgressHud showMessage:@"发送成功"];
            [[NSNotificationCenter defaultCenter] postNotificationName:KNoticationSenderSingleRedPacket object:nil userInfo:@{ @"hid": data[@"info"][@"hid"],@"totalMoney":@(price)}];
        }
        else {
            [LQProgressHud showMessage:data[@"msg"]];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//        [LQProgressHud hide];
        [LQProgressHud showMessage:@"支付失败"];
    }];
}
//动态发送红包
- (void)sendRedPacketDynamic:(CGFloat)price{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:self.userId forKey:@"userId"];
    [parameters setObject:@(price) forKey:@"money"];
    [parameters setObject:@(self.payType) forKey:@"type"];

    [parameters setObject:@(0) forKey:@"payMode"];
    [parameters setObject:self.did forKey:@"did"];
    [LQProgressHud showLoading:@"正在提交..."];
    [TLHTTPRequest MY_postWithBaseUrl:SenderdynamicRedPacketURL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//        [LQProgressHud hide];
        if ([data[@"ret"] integerValue] == 0) {
            
//           if ([_parameters[@"payMode"] integerValue] == 0) {
//                NSDictionary *infoDict = data[@"info"];
//                self.hid = infoDict[@"hid"];
            
            if ([self.delegate respondsToSelector:@selector(paySucessForChatRedPacketView:withPrice:)]) {
                [self.delegate paySucessForChatRedPacketView:self withPrice:[NSString stringWithFormat:@"%f",price]];
            }
            [LQProgressHud showMessage:@"发送成功"];
           
//            }
        }else {
            [LQProgressHud showMessage:data[@"msg"]];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud hide];
        [LQProgressHud showMessage:@"支付失败"];
    }];
}

////  底部按钮 tag 3000+
//- (void)btnClick:(UIButton *)btn {
//
//    [self dismissAlert];
//
//    NSInteger index = btn.tag - 3000;
//
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



@end
