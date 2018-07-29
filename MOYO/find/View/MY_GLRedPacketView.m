//
//  MY_GLRedPacketView.m
//  VTIME
//
//  Created by gll on 2017/10/14.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLRedPacketView.h"

#import "RechargeViewController.h"

@interface MY_GLRedPacketView()<UITextViewDelegate,UITextFieldDelegate>
{
    NSInteger _indexPathLast;
}
@property(nonatomic, strong)UIImageView* navBar;
@property(nonatomic, strong)UIButton   * backButton;
@property(nonatomic, strong)UILabel    * titleLabel;
@property(nonatomic,strong)UITextField * inputTextField;
@property(nonatomic,strong)UITextField * moneyTextField;
@property(nonatomic,strong)UITextView  * desTextView;
@property(nonatomic,strong)UILabel     * placeholderLable;
@property(nonatomic,strong)UILabel     * redPacketMoneyLable;// 红包金额
@property(nonatomic,strong)UILabel     * moneyLogoLable;// 红包金额LOGO
@property(nonatomic,strong)UIView      * payTypeView;// 支付方式
@property(nonatomic,strong)UILabel     * tipLable;// 红包金额LOGO
@property(nonatomic,strong)UILabel     *alertLab;// 输入提示
@end

@implementation MY_GLRedPacketView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WXPAYSuccess:) name:@"WXPAYSuccess" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WXPAYERROR:) name:@"WXPAYERROR" object:nil];


//        self.clubPersonalNum = @(2);
        
        [self drawUI];
    }
    return self;
}


-(void)drawUI{
    self.backgroundColor = BGCOLOR;
    
    UIFont * font = [UIFont systemFontOfSize:15];
    _backButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _backButton.frame = CGRectMake(6,  24, 50, 35);
    [_backButton setTitle:@"取消" forState:(UIControlStateNormal)];
    [_backButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [_backButton.titleLabel setFont:font];
    [_backButton addTarget:self action:@selector(clickBackButton:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self addSubview:_backButton];
    
    CGFloat width = self.frame.size.width - 2*(_backButton.frame.origin.x + _backButton.frame.size.width);
    CGRect frame = CGRectMake((self.frame.size.width - width)/2, 28, width, 24);
    _titleLabel = [[UILabel alloc]initWithFrame:frame];
    //    _titleLabel.adjustsFontSizeToFitWidth = YES;
    //    _titleLabel.minimumScaleFactor = .5;
    _titleLabel.font = font;
    _titleLabel.text = @"发红包";
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    
    self.titleLabel.textColor = [UIColor blackColor];
    
    // 警告
    self.alertLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH , 36)];
    self.alertLab.backgroundColor = GOLDCOLOR;
    self.alertLab.textColor = ERDCOLOR;
    self.alertLab.font = [UIFont systemFontOfSize:13];
    self.alertLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.alertLab];
    self.alertLab.hidden = YES;
    // 总金额
    UIView * redMoneyView = [[UIView alloc]initWithFrame:CGRectMake(14, CGRectGetMaxY(self.alertLab.frame) + 4, SCREEN_WIDTH - 30, 49)];
    redMoneyView.backgroundColor = [UIColor whiteColor];
    redMoneyView.layer.cornerRadius = 5;
    redMoneyView.clipsToBounds = YES;
    [self addSubview:redMoneyView];
    
    // 拼
    UILabel * moneyTypeLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 16, 16 , 18)];
    moneyTypeLab.backgroundColor = GOLDCOLOR;
    moneyTypeLab.textColor = [UIColor whiteColor];
    moneyTypeLab.font = [UIFont systemFontOfSize:14];
    moneyTypeLab.layer.cornerRadius = 3.0;
    moneyTypeLab.clipsToBounds = YES;
    moneyTypeLab.text = @"拼";
    moneyTypeLab.textAlignment = NSTextAlignmentCenter;
    [redMoneyView addSubview:moneyTypeLab];
    
    //  红包金额
    UILabel * redMoneyLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(moneyTypeLab.frame) + 6, 0, 64 , 49)];
    redMoneyLab.textColor = [Utility  colorWithHexString:@"3c3c3c" alpha:1];
    redMoneyLab.font = [UIFont systemFontOfSize:16];
    redMoneyLab.text = @"总金额";
    [redMoneyView addSubview:redMoneyLab];
    
    //  元
    UILabel * aMoneyUnitLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(redMoneyView.frame) - 15 - 20, 0, 20 , 49)];
    aMoneyUnitLab.textColor =  [Utility colorWithHexString:@"3c3c3c" alpha:1.0];
    aMoneyUnitLab.font = [UIFont systemFontOfSize:15];
    aMoneyUnitLab.text = @"元";
    [redMoneyView addSubview:aMoneyUnitLab];
    
    //  红包金额 textfield
    CGFloat moneyWidth = CGRectGetWidth(redMoneyView.frame) - CGRectGetMaxX(redMoneyLab.frame) - 38;
    self.moneyTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(redMoneyLab.frame), 0, moneyWidth , 49)];
    self.moneyTextField.backgroundColor = [UIColor whiteColor];
    self.moneyTextField.keyboardType = UIKeyboardTypePhonePad;
    self.moneyTextField.textAlignment = NSTextAlignmentCenter;
    self.moneyTextField.placeholder = @"0.00";
    self.moneyTextField.font = [UIFont systemFontOfSize:15];
    //    self.moneyTextField.clearButtonMode = UITextFieldViewModeAlways;
    //  self.moneyTextField.clearsOnBeginEditing = YES;
    self.moneyTextField.delegate = self;
    self.moneyTextField.textColor = [Utility colorWithHexString:@"3c3c3c" alpha:1.0];
    [self.moneyTextField setTextAlignment:(NSTextAlignmentRight)];
    [self.moneyTextField addTarget:self action:@selector(moneyTextFieldTextChange:) forControlEvents:UIControlEventEditingChanged];
    [redMoneyView addSubview:self.moneyTextField];
//    self.moneyTextField.text = @"100000";
    
    //  红包个数
    UIView * redCountView = [[UIView alloc]initWithFrame:CGRectMake(14, CGRectGetMaxY(redMoneyView.frame) + 22, SCREEN_WIDTH - 30, 49)];
    redCountView.backgroundColor = [UIColor whiteColor];
    redCountView.layer.cornerRadius = 5;
    redCountView.clipsToBounds = YES;
    [self addSubview:redCountView];
    
    UILabel * redCountLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 86 , 49)];
    redCountLab.textColor = [Utility colorWithHexString:@"3c3c3c" alpha:1.0];
    redCountLab.font = [UIFont systemFontOfSize:15];
    redCountLab.text = @"红包个数";
    [redCountView addSubview:redCountLab];
    
    //个
    UILabel * aCountUnitLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(redCountView.frame) - 15 - 20, 0, 20, 49)];
    aCountUnitLab.textColor = [Utility colorWithHexString:@"3c3c3c" alpha:1.0];
    aCountUnitLab.font = [UIFont systemFontOfSize:15];
    aCountUnitLab.text = @"个";
    [redCountView addSubview:aCountUnitLab];
    
    //  填写数量
    CGFloat inputWidth = CGRectGetWidth(redCountView.frame) - CGRectGetMaxX(redCountLab.frame) - 38;
    self.inputTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(redCountLab.frame),0, inputWidth, 49)];
    self.inputTextField.backgroundColor = [UIColor whiteColor];
    self.inputTextField.placeholder = @"填写个数";
    self.inputTextField.keyboardType = UIKeyboardTypePhonePad;
    self.inputTextField.font = [UIFont systemFontOfSize:15];
    //    self.inputTextField.clearButtonMode = UITextFieldViewModeAlways;
    //  self.inputTextField.clearsOnBeginEditing = YES;
    self.inputTextField.delegate = self;

    [self.inputTextField setTextAlignment:(NSTextAlignmentRight)];
    [redCountView addSubview:self.inputTextField];
//    self.inputTextField.text = @"10";
    
    //  人数
    UILabel * bestHighLab = [[UILabel alloc]initWithFrame:CGRectMake(14, CGRectGetMaxY(redCountView.frame), self.frame.size.width , 26)];
    bestHighLab.textColor =  [Utility colorWithHexString:@"b0b0b0" alpha:1.0];
    bestHighLab.font = [UIFont systemFontOfSize:12];
    bestHighLab.text = @"本俱乐部共XX人";
    [self addSubview:bestHighLab];
    
	self.desTextView = [[UITextView alloc]initWithFrame:CGRectMake(14, CGRectGetMaxY(bestHighLab.frame) + 32, SCREEN_WIDTH - 30, 64)];
    self.desTextView.backgroundColor = [UIColor whiteColor];
    self.desTextView.layer.cornerRadius = 5;
    self.desTextView.clipsToBounds = YES;
    self.desTextView.font = [UIFont systemFontOfSize:16];
    self.desTextView.delegate = self;
    [self addSubview:self.desTextView];

    self.placeholderLable = [[UILabel alloc]initWithFrame:CGRectMake(4, 10, 160 , 16)];
    self.placeholderLable.textColor =  [Utility colorWithHexString:@"c9c9c9" alpha:1.0];
    self.placeholderLable.font = [UIFont systemFontOfSize:16];
    self.placeholderLable.text = @"恭喜发财,大吉大利!";
    [self.desTextView addSubview:self.placeholderLable];

    // 金额
    self.redPacketMoneyLable = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.desTextView.frame) + 40, self.frame.size.width, 42)];
    self.redPacketMoneyLable.textColor =  [Utility colorWithHexString:@"3c3c3c" alpha:1.0];
    self.redPacketMoneyLable.font = [UIFont systemFontOfSize:40];
    self.redPacketMoneyLable.textAlignment =NSTextAlignmentCenter;
    self.redPacketMoneyLable.text = @"";
    [self addSubview:self.redPacketMoneyLable];
    
    self.moneyLogoLable = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2-20, CGRectGetMaxY(self.desTextView.frame) + 50, 21, 22)];
    self.moneyLogoLable.textColor =  [Utility colorWithHexString:@"3c3c3c" alpha:1.0];
    self.moneyLogoLable.font = [UIFont systemFontOfSize:20];
    self.moneyLogoLable.textAlignment =NSTextAlignmentCenter;
    self.moneyLogoLable.text = @"￥";
    [self addSubview:self.moneyLogoLable];
    
    // 选择支付方式 270
    self.payTypeView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 270)*0.5, CGRectGetMaxY(self.redPacketMoneyLable.frame) + 40, 270, 20)];
    self.payTypeView.backgroundColor = BGCOLOR;
    [self addSubview:self.payTypeView];
    
    
    
    NSArray * titleAry = @[@"支付宝",@"微信",@"余额支付"];
    
    CGFloat typeWidth =  ScaleWidth(270) * 0.33;
 	for (NSInteger index2 = 0 ; index2 < 3; index2 ++) {
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(typeWidth * index2, 0, typeWidth, 20)];
        btn.tag = index2 + 3000;
        [btn addTarget:self action:@selector(selectedUserStyleIndex2ClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
        [btn setImage:[UIImage imageNamed:@"redPacket_normal"] forState:(UIControlStateNormal)];
        [btn setImage:[UIImage imageNamed:@"redPacket_select"] forState:(UIControlStateSelected)];
        [btn setTitleColor:COlOR333 forState:(UIControlStateNormal)];
        [btn setTitle:titleAry[index2] forState:(UIControlStateNormal)];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 0);
        [self.payTypeView addSubview:btn];
            
        if ( 2 == index2) {
            
            btn.selected = YES;
            _indexPathLast = btn.tag;
        }
	}
    
    //add status
    UIButton * addStatus = [UIButton buttonWithType:UIButtonTypeCustom];
    [addStatus setFrame:CGRectMake(30, CGRectGetMaxY(self.payTypeView.frame) + 30, SCREEN_WIDTH - 60, 46)];
    [addStatus setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [addStatus setTitle:@"塞进钱包" forState:(UIControlStateNormal)];
    [addStatus setBackgroundColor:ERDCOLOR];
    [addStatus addTarget:self action:@selector(sendRedPacketButtonClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    addStatus.layer.cornerRadius = 46*0.5;
    [addStatus.layer setMasksToBounds:YES];
    addStatus.titleLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:addStatus];
    
}

-(void)requestAddStatusClickMethod:(UIButton*)seder{
    
}

#pragma mark - - 选择支付类型
-(void)selectedUserStyleIndex2ClickMethod:(UIButton*)sender{
    
    UIButton * lastBtn = [self.payTypeView viewWithTag:_indexPathLast];
    lastBtn.selected = NO;

    UIButton * btn = [self.payTypeView viewWithTag:sender.tag];
    btn.selected = YES;
    
    _indexPathLast = sender.tag;
}


// 没有发红包 直接退出
-(void)clickBackButton:(id)sender{
    
    if (self.backClickMethod) {
        
        self.backClickMethod(self,NO);
    }
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    [self.placeholderLable setHidden:YES];
}

-(void)textViewDidChange:(UITextView *)textView{
    if (0 == [textView.text length]) {
        [self.placeholderLable setHidden:NO];
    }else{
        [self.placeholderLable setHidden:YES];
    }
}

//  去充值
-(void)goToRechargeButtonClickMethod:(UIButton*)sender{
    
    if (self.backClickMethod) {
        
        self.backClickMethod(self ,YES);
    }
}

#pragma mark - - 红包支付
-(void)sendRedPacketButtonClickMethod:(UIButton*)sender{
    
    NSString * titleStr = nil;
    
    if ([self.inputTextField.text integerValue] < 1 || [self.inputTextField.text integerValue] > [self.clubPersonalNum integerValue]) {
        //  红包个数限制 1 - clubPersonalNum
        titleStr =  [NSString stringWithFormat:@"塞红包要1- %td 个哦！",[self.clubPersonalNum integerValue]];
        [LQProgressHud showMessage:titleStr];
        return;
    }
    
    // 红包金额
    if ([self.moneyTextField.text integerValue] < 500 || [self.moneyTextField.text integerValue] > 99999999) {
        //  红包金额限制 500 - 99999999
        titleStr = @"塞红包要500 - 99999999哦！";
        [LQProgressHud showMessage:titleStr];
        return;

    }

    NSString *  blessingWords = @"恭喜发财,大吉大利!";
    
    if ([self.desTextView.text length] > 50) {
        
        titleStr = @"祝福语建议50个字以内呢";
        [LQProgressHud showMessage:titleStr];

        return;
        
    }else if(0 == [self.desTextView.text length] ){
        
        blessingWords = @"恭喜发财,大吉大利!";
    }else{
        
        blessingWords = self.desTextView.text;
    }
    
    // 红包请求 REQ_HONGBAO_SEND
    
    /*
     clubId    必须    int    俱乐部id
     money    是    double    钱
     num    是    int    个数
     payMode    是    int    支付方式
     msg    是    string     说明
     */
    
//    [self.clubId stringValue]
    
    NSDictionary * chatDic = @{@"clubId":self.clubId,@"money":self.moneyTextField.text,@"num":self.inputTextField.text,@"msg":blessingWords};
    
    
//    _indexPathLast 0 支付宝 1 微信 2 余额（默认）
    NSMutableDictionary * diction = [NSMutableDictionary dictionaryWithDictionary:chatDic];
    switch (_indexPathLast - 3000 ) {
        case 0:
            [diction setObject:@(1001) forKey:@"payMode"];   //  支付宝
            break;
        case 1:
            [diction setObject:@(2001) forKey:@"payMode"];   //  微信
            break;
        default:
            [diction setObject:@(0) forKey:@"payMode"];      //  余额
            break;
    }
    
    [TLHTTPRequest MY_postWithBaseUrl:SendMultipleHongbao parameters:diction success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([data[@"ret"] integerValue] == 0) {
            
            if ([diction[@"payMode"] integerValue] == 0) {
                
//                [LQProgressHud showMessage:@"支付成功"];
                // 红包 余额 支付成功
                if (self.backClickMethod) {
                    
                    self.backClickMethod(self ,YES);
                }
            }
            else if ([diction[@"payMode"] integerValue] == 1001) {
                
                // NOTE: 调用支付宝 支付结果开始支付
                [[AlipaySDK defaultService] payOrder:data[@"info"][@"zfbstr"] fromScheme:AlipayScheme callback:^(NSDictionary *resultDic) {
                    
                    if ([[resultDic objectForKey:@"resultStatus"] integerValue] == 9000) {

                        [LQProgressHud showMessage:@"支付成功"];
                        if (self.backClickMethod) {

                            self.backClickMethod(self ,YES);
                        }

//                        [self pushChatVCWithDictionary:data];
                    }else{
                        [LQProgressHud showMessage:@"支付失败"];
                    }
                    
                }];
            }
            else if ([diction[@"payMode"] integerValue] == 2001) {
                
                // NOTE: 调用微信支付 支付结果开始支付
                if ([data[@"info"] isKindOfClass:[NSDictionary class]]) {
                    
                    NSDictionary * infoDict = data[@"info"];
                    
                    PayReq *request = [[PayReq alloc] init];
                    request.partnerId = infoDict[@"partnerid"];
                    request.prepayId = infoDict[@"prepayid"];
                    request.package = infoDict[@"packagestr"];
                    request.nonceStr = infoDict[@"noncestr"];
                    request.timeStamp = [infoDict[@"timestamp"] intValue];
                    request.sign= infoDict[@"sign"];
                    [WXApi sendReq:request];
                }
            }
        }else {
            
            if ([data[@"ret"] integerValue] == 15001) {
                
                //  余额不足
                UIViewController * showVC = [self topViewController];

                UIAlertAction * canAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
                
                UIAlertAction * payAction = [UIAlertAction actionWithTitle:@"充值" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    UIViewController * pushVC = [self topViewController];

                    RechargeViewController * recVC = [[RechargeViewController alloc] init];
//                    recVC.balanceString = [NSString stringWithFormat:@"%@", persentView.remainingBalance];
                    [pushVC.navigationController pushViewController:recVC animated:YES];
                    
                }];
                UIAlertController * alertCtr = [UIAlertController alertControllerWithTitle:@"提示" message:@"您的账户余额不足，请立即充值" preferredStyle:UIAlertControllerStyleAlert];
                [alertCtr addAction:canAction];
                [alertCtr addAction:payAction];
                
                [showVC presentViewController:alertCtr animated:YES completion:nil];
            }else{
                
                [LQProgressHud showMessage:data[@"msg"]];
                [self removeFromSuperview];
            }
            
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"支付失败"];
        [self removeFromSuperview];

    }];
}

//  微信支付成功
- (void)WXPAYSuccess:(NSNotification *)not {
//    caseWXSuccess
//    NSLog(@"%@",not.userInfo);
    
    [LQProgressHud showMessage:@"支付成功"];

    if (self.backClickMethod) {
        
        self.backClickMethod(self ,YES);
    }
//    if ([_parameters[@"type"] integerValue] == 1) {
        // 支付成功
//    }
}
- (void)WXPAYERROR:(NSNotification *)not {
    //    caseWXSuccess
    
    [LQProgressHud showMessage:@"支付失败"];
    
//    if (self.backClickMethod) {
//
//        self.backClickMethod(self ,NO);
//    }
    
    //    if ([_parameters[@"type"] integerValue] == 1) {
    // 支付失败
    //    }
}

//self.alertLab

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.text)
    {
        
    }else{
        textField.text=@"";
    }
    
    if (textField == self.moneyTextField) {
        
        if ([self.moneyTextField.text integerValue] < 500 ) {
            
            self.alertLab.hidden = NO;
            self.alertLab.text =  [NSString stringWithFormat:@"红包金额不可小于500元，个数不可大于%td",[self.clubPersonalNum integerValue]];
        }else{
            self.alertLab.hidden = YES;
        }
        
    }else if (textField == self.inputTextField){
        
        if ([self.inputTextField.text integerValue] < 1 || [self.inputTextField.text integerValue] > [self.clubPersonalNum integerValue]) {

            self.alertLab.hidden = NO;
            self.alertLab.text =  [NSString stringWithFormat:@"红包金额不可小于500元，个数不可大于%td",[self.clubPersonalNum integerValue]];
        }else{
            self.alertLab.hidden = YES;
        }
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (textField == self.moneyTextField) {
        
        if ([self.moneyTextField.text integerValue] < 500 ) {
            
            self.alertLab.hidden = NO;
            self.alertLab.text =  [NSString stringWithFormat:@"红包金额不可小于500元，个数不可大于%td",[self.clubPersonalNum integerValue]];
        }else{
            self.alertLab.hidden = YES;
        }
        
    }else if (textField == self.inputTextField){
        
        if ([self.inputTextField.text integerValue] < 1 || [self.inputTextField.text integerValue] > [self.clubPersonalNum integerValue]) {
            
            self.alertLab.hidden = NO;
            self.alertLab.text =  [NSString stringWithFormat:@"红包金额不可小于500元，个数不可大于%td",[self.clubPersonalNum integerValue]];
        }else{
            self.alertLab.hidden = YES;
        }
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
  
    return YES;
}
- (void)moneyTextFieldTextChange:(UITextField*)txf{
    self.redPacketMoneyLable.text = txf.text;
    CGSize size = [Utility stringSizeWithString:txf.text textSize:40 width:0 height:self.frame.size.width];
    self.moneyLogoLable.mj_x = (self.frame.size.width - size.width)/2-20;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (![self.desTextView.text length]) {
        [self.placeholderLable setHidden:NO];
    }
    
    [self endEditing:YES];
    
}

- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(BaseNavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}



@end
