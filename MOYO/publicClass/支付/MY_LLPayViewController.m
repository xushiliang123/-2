//
//  MY_LLPayViewController.m
//  VTIME
//
//  Created by Louie on 2017/9/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLPayViewController.h"

typedef enum : NSUInteger {
    SenderSingleRedPacketNotication,   // 小红包
    SenderdynamicRedPacketNotication,   //招呼红包
} PayRedHongBaoType;
@interface MY_LLPayViewController ()<WXApiManagerDelegate>
{
    NSString *_tradeNo;
}

@property (weak, nonatomic) IBOutlet UIImageView *headIcon;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *redPacketType;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

//  微信
@property (weak, nonatomic) IBOutlet UIView *weichatView;
@property (weak, nonatomic) IBOutlet UIButton *weichatPayBtn;

//  支付宝
@property (weak, nonatomic) IBOutlet UIView *AlipayView;
@property (weak, nonatomic) IBOutlet UIButton *alipayBtn;

//  余额
@property (weak, nonatomic) IBOutlet UIView *balanceView;
@property (weak, nonatomic) IBOutlet UIButton *balancePayBtn;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;

//  尾部
@property (weak, nonatomic) IBOutlet UILabel *footLabel;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@property (nonatomic, assign)NSInteger  currentIndexPath;        //  记录选定的cell

@property (nonatomic, strong) NSMutableDictionary * parameters;
@property (nonatomic, strong) NSString * furl;
@property (nonatomic, strong) NSString * hid;

@property (nonatomic, strong) MBProgressHUD *HUD;
@property (nonatomic, assign)PayRedHongBaoType RedHongBaoType;
@end

@implementation MY_LLPayViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WXPAYSuccess:) name:@"WXPAYSuccess" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WXPAYERROR:) name:@"WXPAYERROR" object:nil];
    }
    return self;
}

-(BOOL)hidesBottomBarWhenPushed{
    
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _parameters = [NSMutableDictionary dictionary];
    [WXApiManager sharedManager].delegate = self;

    [self.weichatPayBtn setBackgroundImage:[UIImage imageNamed:@"PayNormal"] forState:UIControlStateNormal];
    [self.weichatPayBtn setBackgroundImage:[UIImage imageNamed:@"paySelect"] forState:UIControlStateSelected];
    
    [self.alipayBtn setBackgroundImage:[UIImage imageNamed:@"PayNormal"] forState:UIControlStateNormal];
    [self.alipayBtn setBackgroundImage:[UIImage imageNamed:@"paySelect"] forState:UIControlStateSelected];
    
    [self.balancePayBtn setBackgroundImage:[UIImage imageNamed:@"PayNormal"] forState:UIControlStateNormal];
    [self.balancePayBtn setBackgroundImage:[UIImage imageNamed:@"paySelect"] forState:UIControlStateSelected];
    
    //  尾部赋值
    NSMutableAttributedString * attributeString = [[NSMutableAttributedString alloc] init];
    NSAttributedString *att = [[NSAttributedString alloc] initWithString:@" 该服务资金安全由MOYO提供全程担保"];
    NSTextAttachment * imageAttachment = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
    
    imageAttachment.image = [UIImage imageNamed:@"PaySafety"];
    
    imageAttachment.bounds = CGRectMake(0, -1.5, 10, 12);
    
    NSAttributedString * imageAtt = [NSAttributedString attributedStringWithAttachment:imageAttachment];
    
    [attributeString appendAttributedString:imageAtt];
    [attributeString appendAttributedString:att];
    
    self.footLabel.attributedText = attributeString;
    
    
    UITapGestureRecognizer * panGuest1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectWayOfweichat:)];
    [self.weichatView addGestureRecognizer:panGuest1];
    
    
    UITapGestureRecognizer * panGuest2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectWayOfAliPay:)];
    [self.AlipayView addGestureRecognizer:panGuest2];
    
    
    UITapGestureRecognizer * panGuest3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectWayOfPay:)];
    [self.balanceView addGestureRecognizer:panGuest3];
    self.headIcon.layer.cornerRadius = self.headIcon.mj_w/2;
    self.headIcon.layer.masksToBounds = YES;
//    self.submitBtn.layer.cornerRadius = self.submitBtn.mj_h/2;
//    self.submitBtn.layer.masksToBounds = YES;
    if(self.headIconStr.length == 0)
    {
        if(self.dic[@"img"])
        {
            [self.headIcon sd_setImageWithURL:[NSURL URLWithString:self.dic[@"img"]]];
        }
        else{
            self.headIcon.image = [UIImage imageWithData:[[self.dic objectForKey:@"fid"] objectAtIndex:0]];
        }
        
    }
    else
    {
        [self.headIcon sd_setImageWithURL:[NSURL URLWithString:self.headIconStr] placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates];
    }
    
    self.nameLabel.text = self.nickName;
    
    NSString * redPacket = nil;
    if (self.redSingleType == RedPacketDynamic) {
        self.redPacketType.text = @"动态红包";
    }else if(self.redType){
    /*
     RedPacket_sayHolle = 1 << 0,      //  招呼红包
     RedPacket_gold = 1 << 1,          //  黄金包
     RedPacket_platina = 1 << 2,       //  白金包
     RedPacket_blackGold = 1<< 3,      //  黑金包
     */
    switch (self.redType) {
        case RedPacket_sayHolle:
            redPacket = @"打招呼红包";
            break;
        case RedPacket_gold:
            redPacket = @"黄金包";
            break;
        case RedPacket_platina:
            redPacket = @"白金包";
            break;
        case RedPacket_blackGold:
            redPacket = @"黑金包";
            break;
        case RedPacket_dashang:
            redPacket = @"动态红包";
            break;
        default:
            redPacket = @"打招呼红包";
            break;
    }

    
       self.redPacketType.text = redPacket ? redPacket : @"";
    }else if (self.redSingleType == RedPacketRenwu) {
        self.redPacketType.text = @"任务红包";
    }else{
        NSArray *timeArr =  [NSArray arrayWithObjects:@"20",@"30",@"60",@"100",@"520", nil];
        self.redPacketType.text = [NSString stringWithFormat:@"%@秒",[timeArr objectAtIndex:[[self.dic objectForKey:@"itemId"] integerValue] - 20001]];
    }
    
    
    self.priceLabel.text = [NSString stringWithFormat:@"%@元", self.price];
    
    //  加载数据
    [self downloadData];
}




//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.translucent = YES;
//    
//}
//
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}

- (void)downloadData {
    
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    
    [TLHTTPRequest MY_getWithBaseUrl:BalanceURL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            NSDictionary * infoDict = data[@"info"];
            
            CGFloat balance = [infoDict[@"totalMoney"] floatValue];
            
            self.balanceLabel.text = [NSString stringWithFormat:@"(余额:%.2f)", balance];
            
            if (balance > self.price.integerValue) {
                
                self.weichatPayBtn.selected = NO;
                self.alipayBtn.selected = NO;
                self.balancePayBtn.selected = YES;
                
                self.currentIndexPath = 2;
            }else {
                
                self.weichatPayBtn.selected = NO;
                self.alipayBtn.selected = YES;
                self.balancePayBtn.selected = NO;
                
                self.currentIndexPath = 1;
            }
            
            [self.tableView reloadData];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}



//
//- (void)setModel:(MY_LLSenderSkinModel *)model {
//    _model = model;
//
//    [self.headIcon sd_setImageWithURL:[NSURL URLWithString:self.model.headIcon] placeholderImage:[UIImage imageNamed:@"占位_头像"] options:SDWebImageAllowInvalidSSLCertificates];
//
//    self.nameLabel.text = self.model.nickName;
//
//    switch (self.model.gameId.integerValue) {
//        case 100:
//            self.gameName.text = @"英雄联盟";
//            break;
//        case 200:
//            self.gameName.text = @"王者荣耀";
//            break;
//    }
//
//    self.skinName.text = self.model.skinName;
//
//    self.priceLabel.text = [NSString stringWithFormat:@"%@元", self.model.skinPrice];
//
//    self.balanceLabel.text = [NSString stringWithFormat:@"余额:%@", self.model.balance];
//
//
//    //
//    if (_model.skinPrice.integerValue <= _model.balance.integerValue) {
//        //余额  > 支付金额   默认余额支付
//        self.currentIndexPath = 1;
//
//        self.AlipaySelectImgV.hidden = NO;
//        self.blanceSelectImgV.hidden = YES;
//    }else{
//        //                    余额 < 支付金额 默认支付宝支付
//        self.currentIndexPath = 0;
//        self.AlipaySelectImgV.hidden = YES;
//        self.blanceSelectImgV.hidden = NO;
//    }
//}


- (IBAction)confirmBtnClick:(UIButton *)sender {
    
    [_parameters setObject:self.userId forKey:@"userId"];
    [_parameters setObject:self.price forKey:@"money"];
    [_parameters setObject:@(self.payType) forKey:@"type"];
    
    switch (self.currentIndexPath) {
        case 0:
            [_parameters setObject:@(2001) forKey:@"payMode"];
            [self.dic setObject:@(2001) forKey:@"payMode"];//  微信
            break;
        case 1:
            [_parameters setObject:@(1001) forKey:@"payMode"];
            [self.dic setObject:@(1001) forKey:@"payMode"]; //  支付宝
            break;
        default:
            [_parameters setObject:@(0) forKey:@"payMode"];
            [self.dic setObject:@(0) forKey:@"payMode"]; //  余额
            break;
    }
    if ( self.redSingleType == RedPacketRenwu ) {//任务红包
        [self.renwuDic setObject:_parameters[@"payMode"] forKey:@"payMode"];
        [self sendRedPacketRenwu:self.renwuDic];
    }else if ( self.redSingleType == RedPacketDynamic ) { //发动态红包
        [_parameters setObject:self.did forKey:@"did"];
        [self sendRedPacketDynamic:_parameters];
        
    }else if( self.redSingleType == RedPacketSM){//发小红包
         [self sendLittleRedPacket:_parameters];
    }else if( self.redSingleType == RedPacketSayHolle){//发招呼红包
        [self sendSayHelloHongBao:_parameters];
    }
    else if([self.dic count] == 0){
        [LQProgressHud showLoading:@"正在提交..."];
        [TLHTTPRequest MY_postWithBaseUrl:SenderRedPacketURL parameters:_parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            
            if ([data[@"ret"] integerValue] == 0) {
               
                if ([_parameters[@"payMode"] integerValue] == 0) {
                    NSDictionary *infoDict = data[@"info"];
                    self.hid = infoDict[@"hid"];
                    [LQProgressHud showMessage:@"支付成功"];
                    
//                    if ([self.delegate respondsToSelector:@selector(paySucessForViewController:withPrice:)]) {
//                        [self.delegate paySucessForViewController:self withPrice:self.price];
//                    }
//                    [self pushChatVCWithDictionary:data];
                    [self.navigationController popViewControllerAnimated:YES];
            
                }
                else if ([_parameters[@"payMode"] integerValue] == 1001) {
                    
                    // NOTE: 调用支付宝 支付结果开始支付
                    [[AlipaySDK defaultService] payOrder:data[@"info"][@"zfbstr"] fromScheme:AlipayScheme callback:^(NSDictionary *resultDic) {
                        
//                        if ([_parameters[@"type"] integerValue] == 1) {
                        
                            if ([[resultDic objectForKey:@"resultStatus"] integerValue] == 9000) {
                                
                                [LQProgressHud showMessage:@"支付成功"];
                                if ([self.delegate respondsToSelector:@selector(paySucessForViewController:withPrice:)]) {
                                    [self.delegate paySucessForViewController:self withPrice:self.price];
                                }
                                [self.navigationController popViewControllerAnimated:YES];
//                                [self pushChatVCWithDictionary:data];
        
                            }else{
                                [LQProgressHud showMessage:@"支付失败"];
                                if ([self.delegate respondsToSelector:@selector(payFailForViewController:)]) {
                                    [self.delegate payFailForViewController:self];
                                }
                            }
//                        }else{
//                             [LQProgressHud hide];
//                        }
                        
                    }];
                }
                else if ([_parameters[@"payMode"] integerValue] == 2001) {
            
                     [LQProgressHud hide];
                    // NOTE: 调用微信支付 支付结果开始支付
                    if ([data[@"info"] isKindOfClass:[NSDictionary class]]) {
                        
                        NSDictionary * infoDict = data[@"info"];
                        PayReq *request = [[PayReq alloc] init];
                        request.partnerId = infoDict[@"partnerid"];
                        request.prepayId = infoDict[@"prepayid"];
                        request.package = infoDict[@"packagestr"];
                        request.nonceStr = infoDict[@"noncestr"];
                        request.timeStamp = [infoDict[@"timestamp"] integerValue];
                        request.sign= infoDict[@"sign"];
                        [WXApi sendReq:request];
                    }
                }
                else {
                    
//                    [self.navigationController popViewControllerAnimated:YES];
                }
            }
            else {
                [LQProgressHud showMessage:data[@"msg"]];
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {

            [LQProgressHud showMessage:@"支付失败"];
        }];
    }else{
        [self bpRequest];   //霸屏
    }

}
//发小红包
- (void)sendLittleRedPacket:(NSDictionary*)parameters{
    [LQProgressHud showLoading:@"正在提交..."];
    [TLHTTPRequest MY_postWithBaseUrl:SenderRedPacketURL parameters:_parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([data[@"ret"] integerValue] == 0) {
            NSDictionary *infoDict = data[@"info"];
            
            if ([_parameters[@"payMode"] integerValue] == 0) {
                self.hid = infoDict[@"hid"];
                [LQProgressHud showMessage:@"支付成功"];
//                [self pushChatVCWithDictionary:data];
                [self.navigationController popViewControllerAnimated:YES];
                [[NSNotificationCenter defaultCenter] postNotificationName:KNoticationSenderSingleRedPacket object:nil userInfo:@{@"hid": self.hid,@"totalMoney":self.price}];
            }
            else if ([_parameters[@"payMode"] integerValue] == 1001) {
                 [LQProgressHud hide];
                _tradeNo = infoDict[@"v_order_no"];
                // NOTE: 调用支付宝 支付结果开始支付
                [[AlipaySDK defaultService] payOrder:data[@"info"][@"zfbstr"] fromScheme:AlipayScheme callback:^(NSDictionary *resultDic) {
                    
//                    if ([_parameters[@"type"] integerValue] == 1) {
                        if ([[resultDic objectForKey:@"resultStatus"] integerValue] == 9000) {
//                           [LQProgressHud showMessage:@"支付成功"];
                            
                            [TLHTTPRequest MY_getWithBaseUrl:GetPayStatusURL parameters:@{@"orderNo":_tradeNo} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                                if ([data[@"ret"] integerValue] == 0) {
                                    NSDictionary *dict = data[@"info"];
                                    [LQProgressHud showMessage:@"支付成功"];
//                                        [self pushChatVCWithDictionary:nil];
                                    [self.navigationController popViewControllerAnimated:YES];
                                    [[NSNotificationCenter defaultCenter] postNotificationName:KNoticationSenderSingleRedPacket object:nil userInfo:@{@"hid": dict[@"hid"],@"totalMoney":self.price}];
            
                                }else{
                                    [LQProgressHud showMessage:data[@"msg"]];
                                }
                            } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                                [LQProgressHud showMessage:@"支付失败"];
                            }];
                     
                           
                        }else{
                            [LQProgressHud showMessage:@"支付失败"];
                        }
//                    }else{
//                        [LQProgressHud hide];
//                    }
                    
                }];
            }
            else if ([_parameters[@"payMode"] integerValue] == 2001) {
                self.RedHongBaoType = SenderSingleRedPacketNotication;
                 _tradeNo = infoDict[@"v_order_no"];
                [LQProgressHud hide];
                // NOTE: 调用微信支付 支付结果开始支付
                if ([data[@"info"] isKindOfClass:[NSDictionary class]]) {
                    
                    NSDictionary * infoDict = data[@"info"];
                    
                    PayReq *request = [[PayReq alloc] init];
                    request.partnerId = infoDict[@"partnerid"];
                    request.prepayId = infoDict[@"prepayid"];
                    request.package = infoDict[@"packagestr"];
                    request.nonceStr = infoDict[@"noncestr"];
                    request.timeStamp = [infoDict[@"timestamp"] integerValue];
                    request.sign= infoDict[@"sign"];
                    [WXApi sendReq:request];
                }
            }
            else {
                
                //                    [self.navigationController popViewControllerAnimated:YES];
            }
        }
        else {
            [LQProgressHud showMessage:data[@"msg"]];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        [LQProgressHud showMessage:@"支付失败"];
    }];
}
//任务红包
- (void)sendRedPacketRenwu:(NSDictionary*)parameters{
    [LQProgressHud showLoading:@"正在提交..."];
    [TLHTTPRequest MY_postWithBaseUrl:TaskPublishURL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([data[@"ret"] integerValue] == 0) {
            
            if ([_parameters[@"payMode"] integerValue] == 0) {
                NSDictionary *infoDict = data[@"info"];
                self.hid = infoDict[@"hid"];
                [LQProgressHud hide];
                [self pushRenwuVCWithDictionary];
//                if ([self.delegate respondsToSelector:@selector(paySucessForViewController:withPrice:)]) {
//                    [self.delegate paySucessForViewController:self withPrice:self.price];
//                }
            }
            else if ([_parameters[@"payMode"] integerValue] == 1001) {
                 [LQProgressHud hide];
                // NOTE: 调用支付宝 支付结果开始支付
                [[AlipaySDK defaultService] payOrder:data[@"info"][@"zfbstr"] fromScheme:AlipayScheme callback:^(NSDictionary *resultDic) {
                    
                    if ([[resultDic objectForKey:@"resultStatus"] integerValue] == 9000) {
                        [LQProgressHud showMessage:@"支付成功"];
                        [self pushRenwuVCWithDictionary];
//                        if ([self.delegate respondsToSelector:@selector(paySucessForViewController:withPrice:)]) {
//                            [self.delegate paySucessForViewController:self withPrice:self.price];
//                        }
//
//                        [self.navigationController popViewControllerAnimated:YES];
                    }else{
                        [LQProgressHud showMessage:@"支付失败"];
                        if ([self.delegate respondsToSelector:@selector(payFailForViewController:)]) {
                            [self.delegate payFailForViewController:self];
                        }
                    }
                    
                }];
            }
            else if ([_parameters[@"payMode"] integerValue] == 2001) {
                [LQProgressHud hide];
                // NOTE: 调用微信支付 支付结果开始支付
                if ([data[@"info"] isKindOfClass:[NSDictionary class]]) {
                    
                    NSDictionary * infoDict = data[@"info"];
                    
                    PayReq *request = [[PayReq alloc] init];
                    request.partnerId = infoDict[@"partnerid"];
                    request.prepayId = infoDict[@"prepayid"];
                    request.package = infoDict[@"packagestr"];
                    request.nonceStr = infoDict[@"noncestr"];
                    request.timeStamp = [infoDict[@"timestamp"] integerValue];
                    request.sign= infoDict[@"sign"];
                    [WXApi sendReq:request];
                }
            }
            else {
                
            }
        }
        else {
            [LQProgressHud showMessage:data[@"msg"]];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        [LQProgressHud showMessage:@"支付失败"];
    }];
}
//发招呼红包
- (void)sendSayHelloHongBao:(NSDictionary*)parameters{
    [TLHTTPRequest MY_postWithBaseUrl:SenderRedPacketURL parameters:_parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([data[@"ret"] integerValue] == 0) {
             NSDictionary *infoDict = data[@"info"];
            
            if ([_parameters[@"payMode"] integerValue] == 0) {
                self.hid = infoDict[@"hid"];
                [LQProgressHud showMessage:@"支付成功"];
                [self.navigationController popViewControllerAnimated:NO];
                if ([self.delegate respondsToSelector:@selector(paySucessForViewController:withPrice:)]) {
                    [self.delegate paySucessForViewController:self withPrice:self.price];
                }
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [[NSNotificationCenter defaultCenter] postNotificationName:KNoticationSenderdSayHellowRedPacket object:nil userInfo:@{@"hid":self.hid,@"totalMoney":self.price}];
                });
                
            }
            else if ([_parameters[@"payMode"] integerValue] == 1001) {
                _tradeNo = infoDict[@"v_order_no"];
                 [LQProgressHud hide];
                // NOTE: 调用支付宝 支付结果开始支付
                [[AlipaySDK defaultService] payOrder:data[@"info"][@"zfbstr"] fromScheme:AlipayScheme callback:^(NSDictionary *resultDic) {
                    
                    if ([_parameters[@"type"] integerValue] == 1) {
                        
                        if ([[resultDic objectForKey:@"resultStatus"] integerValue] == 9000) {
                            [self.navigationController popViewControllerAnimated:NO];
                            if ([self.delegate respondsToSelector:@selector(paySucessForViewController:withPrice:)]) {
                                [self.delegate paySucessForViewController:self withPrice:self.price];
                            }
                              dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                        [[NSNotificationCenter defaultCenter]postNotificationName:KNoticationSenderdSayHellowRedPacket object:nil userInfo:@{@"totalMoney":self.price}];
                                });
                            
                        }else{
                            [LQProgressHud showMessage:@"支付失败"];
                            if ([self.delegate respondsToSelector:@selector(payFailForViewController:)]) {
                                [self.delegate payFailForViewController:self];
                            }
                        }
                    }else{
                        [LQProgressHud hide];
                        if ([self.delegate respondsToSelector:@selector(payFailForViewController:)]) {
                            [self.delegate payFailForViewController:self];
                        }
                    }
                    
                }];
            }
            else if ([_parameters[@"payMode"] integerValue] == 2001) {
                  self.RedHongBaoType = SenderdynamicRedPacketNotication;
                [LQProgressHud hide];
                 _tradeNo = infoDict[@"v_order_no"];
                // NOTE: 调用微信支付 支付结果开始支付
                if ([data[@"info"] isKindOfClass:[NSDictionary class]]) {
                    NSDictionary * infoDict = data[@"info"];
                    PayReq *request = [[PayReq alloc] init];
                    request.partnerId = infoDict[@"partnerid"];
                    request.prepayId = infoDict[@"prepayid"];
                    request.package = infoDict[@"packagestr"];
                    request.nonceStr = infoDict[@"noncestr"];
                    request.timeStamp = [infoDict[@"timestamp"] integerValue];
                    request.sign= infoDict[@"sign"];
                    [WXApi sendReq:request];
                }
            }
            else {
                
                //                    [self.navigationController popViewControllerAnimated:YES];
            }
        }
        else {
            [LQProgressHud showMessage:data[@"msg"]];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        [LQProgressHud showMessage:@"支付失败"];
    }];
    
    


}
//动态发送红包
- (void)sendRedPacketDynamic:(NSDictionary*)parameters{
    [LQProgressHud showLoading:@"正在提交..."];
    [TLHTTPRequest MY_postWithBaseUrl:SenderdynamicRedPacketURL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([data[@"ret"] integerValue] == 0) {
            
            if ([_parameters[@"payMode"] integerValue] == 0) {
                NSDictionary *infoDict = data[@"info"];
    
                [LQProgressHud showMessage:@"支付成功"];
                [self.navigationController popViewControllerAnimated:YES];
                if ([self.delegate respondsToSelector:@selector(paySucessForViewController:withPrice:)]) {
                    [self.delegate paySucessForViewController:self withPrice:self.price];
                }
                
            }
            else if ([_parameters[@"payMode"] integerValue] == 1001) {
                [LQProgressHud hide];
                // NOTE: 调用支付宝 支付结果开始支付
                [[AlipaySDK defaultService] payOrder:data[@"info"][@"zfbstr"] fromScheme:AlipayScheme callback:^(NSDictionary *resultDic) {
                    
                    if ([_parameters[@"type"] integerValue] == 1) {
                        
                        if ([[resultDic objectForKey:@"resultStatus"] integerValue] == 9000) {
                           
                            //                                [LQProgressHud showMessage:@"支付成功"];
                            if ([self.delegate respondsToSelector:@selector(paySucessForViewController:withPrice:)]) {
                                [self.delegate paySucessForViewController:self withPrice:self.price];
                            }
                            
                            [self.navigationController popViewControllerAnimated:YES];
                        }else{
                            [LQProgressHud showMessage:@"支付失败"];
                            if ([self.delegate respondsToSelector:@selector(payFailForViewController:)]) {
                                [self.delegate payFailForViewController:self];
                            }
                        }
                    }
                    
                }];
            }
            else if ([_parameters[@"payMode"] integerValue] == 2001) {
                [LQProgressHud hide];
                // NOTE: 调用微信支付 支付结果开始支付
                if ([data[@"info"] isKindOfClass:[NSDictionary class]]) {
                    
                    NSDictionary * infoDict = data[@"info"];
                    
                    PayReq *request = [[PayReq alloc] init];
                    request.partnerId = infoDict[@"partnerid"];
                    request.prepayId = infoDict[@"prepayid"];
                    request.package = infoDict[@"packagestr"];
                    request.nonceStr = infoDict[@"noncestr"];
                    request.timeStamp = [infoDict[@"timestamp"] integerValue];
                    request.sign= infoDict[@"sign"];
                    [WXApi sendReq:request];
                }
            }
            else {
                [LQProgressHud showMessage:data[@"msg"]];
            }
        }
        else {
            [LQProgressHud showMessage:data[@"msg"]];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        [LQProgressHud showMessage:@"支付失败"];
    }];
}
//霸屏
- (void)bpRequest{
    
    __weak typeof(self) weakSelf = self;
    
    self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:self.HUD];
    self.HUD.mode = MBProgressHUDModeIndeterminate;
    [self.HUD show:YES];
    
    
    if(self.dic[@"img"]){
        [TLHTTPRequest MY_postWithBaseUrl:BuyBupingUrl parameters:self.dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            
            if ([data[@"ret"] integerValue] == 0) {
                
                if ([self.dic[@"payMode"] integerValue] == 0) {
                    
                    [LQProgressHud hide];
                    [self.HUD showAnimated:YES whileExecutingBlock:^{
                        self.HUD.mode = MBProgressHUDModeText;
                        self.HUD.labelText = @"支付成功";
                    }
                   completionBlock:^{
//                       [LQProgressHud showMessage:@"支付成功"];
                       [[NSNotificationCenter defaultCenter] postNotificationName:@"PAYSUC" object:weakSelf.dic];
                       [weakSelf.navigationController popViewControllerAnimated:YES];
                   }];
//
                }
                else if ([self.dic[@"payMode"] integerValue] == 1001) {
                     [LQProgressHud hide];
                    // NOTE: 调用支付宝 支付结果开始支付
                    [[AlipaySDK defaultService] payOrder:data[@"info"][@"zfbstr"] fromScheme:AlipayScheme callback:^(NSDictionary *resultDic) {
                        
                        
                            if ([[resultDic objectForKey:@"resultStatus"] integerValue] == 9000) {
                                
                               
                                
                                [self.HUD showAnimated:YES whileExecutingBlock:^{
                                    self.HUD.mode = MBProgressHUDModeText;
                                    self.HUD.labelText = @"支付成功";
                                }
                                       completionBlock:^{
                                           //                       [LQProgressHud showMessage:@"支付成功"];
                                           [[NSNotificationCenter defaultCenter] postNotificationName:@"PAYSUC" object:weakSelf.dic];
                                           [weakSelf.navigationController popViewControllerAnimated:YES];
                                       }];
                                
                                
//                                [LQProgressHud showMessage:@"支付成功"];
//
//                                //                                    [self.dic setObject:self.furl forKey:@"furl"];
//                                [[NSNotificationCenter defaultCenter] postNotificationName:@"PAYSUC" object:self.dic];
//                                                                    [self.navigationController popViewControllerAnimated:YES];
                            }else{

                                self.HUD.hidden = YES;

                                [LQProgressHud showMessage:@"支付失败"];
                            }
                        
                    }];
                }
                else if ([self.dic[@"payMode"] integerValue] == 2001) {
                    [LQProgressHud hide];
                    // NOTE: 调用微信支付 支付结果开始支付
                    if ([data[@"info"] isKindOfClass:[NSDictionary class]]) {
                        
                        NSDictionary * infoDict = data[@"info"];
                        
                        PayReq *request = [[PayReq alloc] init];
                        request.partnerId = infoDict[@"partnerid"];
                        request.prepayId = infoDict[@"prepayid"];
                        request.package = infoDict[@"packagestr"];
                        request.nonceStr = infoDict[@"noncestr"];
                        request.timeStamp = [infoDict[@"timestamp"] integerValue];
                        request.sign= infoDict[@"sign"];
                        [WXApi sendReq:request];
                    }
                }
                else {
                     [LQProgressHud hide];
                    [self.navigationController popViewControllerAnimated:YES];
                }
            }
            else {
                self.HUD.hidden = YES;
                [LQProgressHud showMessage:data[@"msg"]];
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            self.HUD.hidden = YES;
            [LQProgressHud showMessage:@"支付失败"];
        }];
        
    }
    else{
        [LQProgressHud showLoading:@"正在提交..."];
        [TLHTTPRequest MY_postDataAndImageRequest:UploadFileURL parameters:nil imageDataArr:[self.dic objectForKey:@"fid"] success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] integerValue] == 0)
            {
                NSMutableDictionary* dictFid = [NSMutableDictionary dictionaryWithDictionary:self.dic];
                [dictFid setObject:[[data objectForKey:@"info"]objectForKey:@"fid"] forKey:@"fid"];
                self.furl = [[data objectForKey:@"info"] objectForKey:@"furl"];
                
                
                [TLHTTPRequest MY_postWithBaseUrl:BuyBupingUrl parameters:dictFid success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                    
                    if ([data[@"ret"] integerValue] == 0) {
                        
                        if ([self.dic[@"payMode"] integerValue] == 0) {
                            [LQProgressHud hide];
                            //                            [LQProgressHud showMessage:@"支付成功"];

                            [self.HUD showAnimated:YES whileExecutingBlock:^{
                                self.HUD.mode = MBProgressHUDModeText;
                                self.HUD.labelText = @"支付成功";
                            }
                                   completionBlock:^{
                                       [weakSelf.dic setObject:weakSelf.furl forKey:@"img"];
                                       [[NSNotificationCenter defaultCenter] postNotificationName:@"PAYSUC" object:weakSelf.dic];
                                       [weakSelf.navigationController popViewControllerAnimated:YES];
                                   }];
                            
                            
                        }
                        else if ([self.dic[@"payMode"] integerValue] == 1001) {
                            [LQProgressHud hide];
                            // NOTE: 调用支付宝 支付结果开始支付
                            [[AlipaySDK defaultService] payOrder:data[@"info"][@"zfbstr"] fromScheme:AlipayScheme callback:^(NSDictionary *resultDic) {
                                
//                                if ([_parameters[@"type"] integerValue] == 1) {
                                
                                    if ([[resultDic objectForKey:@"resultStatus"] integerValue] == 9000) {
                                        [LQProgressHud hide];
                                        
                                        [self.HUD showAnimated:YES whileExecutingBlock:^{
                                            self.HUD.mode = MBProgressHUDModeText;
                                            self.HUD.labelText = @"支付成功";
                                        }
                                               completionBlock:^{
                                                    [weakSelf.dic setObject:weakSelf.furl forKey:@"img"];
                                                   [[NSNotificationCenter defaultCenter] postNotificationName:@"PAYSUC" object:weakSelf.dic];
                                                   [weakSelf.navigationController popViewControllerAnimated:YES];
                                               }];
                                        
                                        
                                    }else{
                                         self.HUD.hidden = YES;
                                        [LQProgressHud showMessage:@"支付失败"];
                                    }
//                                }else{
//                                     [LQProgressHud showMessage:@"支付失败"];
//                                }
                                
                            }];
                        }
                        else if ([self.dic[@"payMode"] integerValue] == 2001) {
                            [LQProgressHud hide];
                            // NOTE: 调用微信支付 支付结果开始支付
                            if ([data[@"info"] isKindOfClass:[NSDictionary class]]) {
                                
                                NSDictionary * infoDict = data[@"info"];
                                
                                PayReq *request = [[PayReq alloc] init];
                                request.partnerId = infoDict[@"partnerid"];
                                request.prepayId = infoDict[@"prepayid"];
                                request.package = infoDict[@"packagestr"];
                                request.nonceStr = infoDict[@"noncestr"];
                                request.timeStamp = [infoDict[@"timestamp"] integerValue];
                                request.sign= infoDict[@"sign"];
                                [WXApi sendReq:request];
                            }
                        }
                        else {
                            [LQProgressHud hide];
                            [self.navigationController popViewControllerAnimated:YES];
                        }
                    }
                    else {
                        self.HUD.hidden = YES;
                        [LQProgressHud showMessage:data[@"msg"]];
                    
//                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                            [self.navigationController popViewControllerAnimated:NO];
//                        });
                    }
                } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//                    [self.navigationController popViewControllerAnimated:NO];
                    self.HUD.hidden = YES;
                    [LQProgressHud showMessage:@"支付失败"];
                    
                }];
                
                
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showMessage:@"图片上传失败"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [self.navigationController popViewControllerAnimated:YES];
            });
        }];
        
        
    }
}
//  微信支付成功
- (void)WXPAYSuccess:(NSNotification *)not {
    self.HUD.hidden = YES;
//    NSLog(@"%@",not.userInfo);
    
    if ( self.redSingleType == RedPacketRenwu ) {//任务红包
        [self pushRenwuVCWithDictionary];
    }else if ( self.redSingleType == RedPacketDynamic ) { //发动态红包
        if ([self.delegate respondsToSelector:@selector(paySucessForViewController:withPrice:)]) {
            [self.delegate paySucessForViewController:self withPrice:self.price];
        }
    }else if( self.redSingleType == RedPacketSM){//发小红包
        if ( self.RedHongBaoType == SenderSingleRedPacketNotication) {
            
            [TLHTTPRequest MY_getWithBaseUrl:GetPayStatusURL parameters:@{@"orderNo":_tradeNo} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                
                if ([data[@"ret"] integerValue] == 0) {
                    NSDictionary *dict = data[@"info"];
                        [LQProgressHud showMessage:@"支付成功"];
                        //                        [self pushChatVCWithDictionary:nil];
                        [self.navigationController popViewControllerAnimated:YES];
                        [[NSNotificationCenter defaultCenter] postNotificationName:KNoticationSenderSingleRedPacket object:nil userInfo:@{@"hid": dict[@"hid"],@"totalMoney":self.price}];
                }else{
                        [LQProgressHud showMessage:data[@"msg"]];
                    
                }
            } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                 [LQProgressHud showMessage:@"支付失败"];
            }];
            
        }else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else if( self.redSingleType == RedPacketSayHolle){//发招呼红包
        if( self.RedHongBaoType == SenderdynamicRedPacketNotication){
            [self.navigationController popViewControllerAnimated:YES];
            if ([self.delegate respondsToSelector:@selector(paySucessForViewController:withPrice:)]) {
                [self.delegate paySucessForViewController:self withPrice:self.price];
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:KNoticationSenderdSayHellowRedPacket object:nil userInfo:@{@"totalMoney":self.price}];
            });
            
        }else{
            if ([self.delegate respondsToSelector:@selector(paySucessForViewController:withPrice:)]) {
                [self.delegate paySucessForViewController:self withPrice:self.price];
            }
        }
    }else{
            if ([self.dic[@"type"] integerValue] == 1) {
                if(self.dic[@"img"])
                {
                    
                }
                else{
                    [self.dic setObject:self.furl forKey:@"img"];
                }
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"PAYSUC" object:self.dic];
                [self.navigationController popViewControllerAnimated:YES];
            }
        
    }
    
    
}

- (void)WXPAYERROR:(NSNotification *)not {
    //    caseWXSuccess
    self.HUD.hidden = YES;
    [LQProgressHud showMessage:@"支付失败"];
}

- (void)backClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}
//  跳转任务列表
- (void)pushRenwuVCWithDictionary {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MY_XTActivityViewUpdate" object:nil];
    UIViewController *viewCtl = self.navigationController.viewControllers[1];
    [self.navigationController popToViewController:viewCtl animated:YES];
}
//  跳转聊天
//- (void)pushChatVCWithDictionary:(NSDictionary *)dict {
//    if (self.redSingleType == RedPacketSM) {
//        [self.navigationController popViewControllerAnimated:YES];
//        return;
//    }
//    MY_LLPersonInfoModel * model = [[MY_LLPersonInfoModel alloc] init];
//    model.userId = self.userId.integerValue;
//    model.nickName = self.nickName;
//    model.headIcon = self.headIconStr;
//
//    ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:self.userId conversationType:EMConversationTypeChat];
//
//    chatController.model = model;
//    chatController.isPayPush = YES;
//    if(self.pushfrom.length != 0)
//    {
//        chatController.isPayPush = NO;
//        chatController.pushfrom = self.pushfrom;
//    }
//
//    [chatController setHidesBottomBarWhenPushed:YES];
//    [self.navigationController pushViewController:chatController animated:YES];
//}


//  点击微信
-(void)selectWayOfweichat:(UITapGestureRecognizer*)gesture {
    
    self.weichatPayBtn.selected = YES;
    self.alipayBtn.selected = NO;
    self.balancePayBtn.selected = NO;
    
    self.currentIndexPath = 0;
}

//  点击支付宝
-(void)selectWayOfAliPay:(UITapGestureRecognizer*)gesture {
    
    self.weichatPayBtn.selected = NO;
    self.alipayBtn.selected = YES;
    self.balancePayBtn.selected = NO;
    
    self.currentIndexPath = 1;
}

//  点击余额支付
-(void)selectWayOfPay:(UITapGestureRecognizer*)gesture {
    
    self.weichatPayBtn.selected = NO;
    self.alipayBtn.selected = NO;
    self.balancePayBtn.selected = YES;
    
    self.currentIndexPath = 2;
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
