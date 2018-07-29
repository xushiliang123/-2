//
//  MY_TTLToBeNobilityViewController.m
//  VTIME
//
//  Created by MadridLee on 2017/9/13.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLToBeNobilityViewController.h"
#import "MY_TTLPriceBtn.h"
#import "ParallelButton.h"
#import "MY_LYMessageInfoModel.h"
@interface MY_TTLToBeNobilityViewController ()
{
    NSInteger _typePar;     //支付宝默认tag
    NSInteger _typeGui;     //选择支付的价格种类
    NSMutableDictionary* _dict; //获取的贵族信息
    NSInteger _nobleLevel;
    
    NSArray* _arrayPrice;    //支付金额
    NSArray* _arrayItemId;  //物品ID'
    NSArray* _arrayTime;
}
@end

@implementation MY_TTLToBeNobilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavBtn:nil isLeft:YES target:self action:@selector(backClick) bgImageName:@"icon_back"];
    self.view.backgroundColor = [UIColor blackColor];
    [LQProgressHud showLoading:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WXPAYSuccess:) name:@"WXPAYSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WXPAYERROR:) name:@"WXPAYERROR" object:nil];
    [TLHTTPRequest MY_getWithBaseUrl:GetNobleInfoUrl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            [LQProgressHud hide];
            _dict = [data objectForKey:@"info"];
            [self headerCreate];
        }
        else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"ret"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"获取失败"];
    }];
    
    
}
#pragma MARK ---微信回调
-(void)WXPAYSuccess:(NSNotification *)notificaiton
{
    [LQProgressHud showMessage:@"支付成功"];
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *uModel = arry.firstObject;
    
//    MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    uModel.available = 1;
    uModel.isNoble = 1;
//    [[MessageInfoModel sharedManager] insertModelWith:uModel];
    [[MY_LLDBManager sharedManager] updateModel:uModel withWhere:where];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)WXPAYERROR:(NSNotification *)not {
    [LQProgressHud showMessage:@"支付失败"];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//    self.tabBarController.tabBar.hidden = YES;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.translucent = YES;
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:0];
    [self.navigationController.navigationBar setShadowImage:nil];
    self.navigationController.navigationBar.translucent = NO;
}


-(void)headerCreate
{
    UIImageView* imgvBack = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imgvBack.image = [UIImage imageNamed:@"贵族背景.jpg"];
    [self.view addSubview:imgvBack];
    
    UILabel* label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:18];
    label.text = @"剩余天数";
    label.textColor = [Utility colorWithHexString:@"d7d7d7" alpha:1];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).mas_offset(47);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(18);
    }];
    
    UILabel* labelMoney = [[UILabel alloc]init];
    labelMoney.backgroundColor = [UIColor clearColor];
    labelMoney.font = [UIFont systemFontOfSize:36];
    if ([[_dict objectForKey:@"nobleLevel"] integerValue] > 0)  {
        labelMoney.text = [Utility getOvertime:[_dict objectForKey:@"leftTime"]];
    }
    else{
        labelMoney.text = @"0";
    }
    
    labelMoney.textColor = GOLDCOLOR;
    labelMoney.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labelMoney];
    [labelMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).mas_offset(28);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(36);
    }];
    
    
    UILabel* labelNoility = [[UILabel alloc]init];
    labelNoility.backgroundColor = [UIColor clearColor];
    labelNoility.font = [UIFont systemFontOfSize:18];
    labelNoility.text = @"贵族专享";
    labelNoility.textColor = [Utility colorWithHexString:@"d7d7d7" alpha:1];
    labelNoility.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labelNoility];
    [labelNoility mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelMoney.mas_bottom).mas_offset(31);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(18);
    }];
    
    UIImageView* imgv = [[UIImageView alloc]init];
    imgv.image = [UIImage imageNamed:@"threeLine"];
    [self.view addSubview:imgv];
    [imgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelNoility.mas_bottom).mas_offset(16);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(238*SCREEN_WIDTH/375);
        make.height.mas_equalTo(137/2);

    }];
    NSArray* array = @[@"免费无限畅聊",@"昵称为专属金色",@"资料保密"];
    for (int i = 0; i < 3; i ++) {
        UILabel* labelTitle = [[UILabel alloc]init];
        labelTitle.font = [UIFont systemFontOfSize:15];
        labelTitle.text = array[i];
        labelTitle.textAlignment = NSTextAlignmentCenter;
        labelTitle.textColor = [Utility colorWithHexString:@"d7d7d7" alpha:1];
        [self.view addSubview:labelTitle];
//        labelTitle.frame = CGRectMake(SCREEN_WIDTH/3*i, CGRectGetMaxY(imgv.frame) + 137/2 + 13, SCREEN_WIDTH/3, 15);
        [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imgv.mas_bottom).mas_offset(13);
            make.left.equalTo(self.view.mas_left).mas_offset(SCREEN_WIDTH/3*i);
            make.width.mas_equalTo(SCREEN_WIDTH/3);
            make.height.mas_equalTo(15);
            
        }];
    }
    NSArray* arrBoble = [_dict objectForKey:@"nobleList"];
    _arrayPrice = @[[arrBoble[0] objectForKey:@"showPrice"],[arrBoble[1] objectForKey:@"showPrice"],[arrBoble[2] objectForKey:@"showPrice"]];
    _arrayTime = @[[arrBoble[0] objectForKey:@"durationTime"],[arrBoble[1] objectForKey:@"durationTime"],[arrBoble[2] objectForKey:@"durationTime"]];
    _arrayItemId = @[[arrBoble[0] objectForKey:@"itemId"],[arrBoble[1] objectForKey:@"itemId"],[arrBoble[2] objectForKey:@"itemId"]];
    for (int i = 0; i < 3; i ++) {
        MY_TTLPriceBtn* btnPrice = [[MY_TTLPriceBtn alloc]init];
        [self.view addSubview:btnPrice];
        btnPrice.imgvBack.image = [UIImage imageNamed:@"borderBack"];
        if (i == 0) {
            btnPrice.imgvBack.image = [UIImage imageNamed:@"chooseBack"];
            btnPrice.labelPrice.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
            btnPrice.labelDanwei.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
            btnPrice.labelTime.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
        }
        else{
            btnPrice.labelPrice.textColor = GOLDCOLOR;
            btnPrice.labelDanwei.textColor = GOLDCOLOR;
            btnPrice.labelTime.textColor = GOLDCOLOR;
        }
        btnPrice.tag = 2001 + i;
        _typeGui = 2001;
        [btnPrice showPrice:_arrayPrice[i] withTime:_arrayTime[i]];
        [btnPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imgv.mas_bottom).mas_offset(13 + 23 + 15);
            make.left.equalTo(self.view.mas_left).mas_offset(59/2*SCREEN_WIDTH/375 + (178/2*SCREEN_WIDTH/375 + 37/2*SCREEN_WIDTH/375)*i);
            make.width.mas_equalTo(178/2*SCREEN_WIDTH/375);
            make.height.mas_equalTo(195/2);
        }];
        [btnPrice addTarget:self action:@selector(guiClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UILabel* labelDetail = [[UILabel alloc]init];
    labelDetail.backgroundColor = [UIColor clearColor];
    labelDetail.font = [UIFont systemFontOfSize:18];
    labelDetail.text = @"";//活动期间单月充值1折
    labelDetail.textColor = [Utility colorWithHexString:@"e2x04e" alpha:1];
    labelDetail.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labelDetail];
    [labelDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgv.mas_bottom).mas_offset(13 + 23 + 15 + 195/2 + 16);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(18);
    }];
    
    NSArray* arrayPay = @[@"支付宝",@"微信",@"余额支付"];
    for (int i = 0; i < 3; i ++) {
        ParallelButton* parBtn = [[ParallelButton alloc] init];
        parBtn.title = arrayPay[i];
        parBtn.leftImageView.image = [UIImage imageNamed:@"garyRound"];
        parBtn.imageWidth = 18;
        parBtn.imageHeight = 18;
        parBtn.tag = 1001 + i;
        _typePar = 1001;
        if (i == 0) {
            parBtn.leftImageView.image = [UIImage imageNamed:@"goldRound"];
        }
        [self.view addSubview:parBtn];
        [parBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(labelDetail.mas_bottom).mas_offset(26);
            make.left.equalTo(self.view.mas_left).mas_offset(SCREEN_WIDTH/6*i + SCREEN_WIDTH/4);
            make.height.mas_equalTo(45);
            make.width.mas_equalTo(SCREEN_WIDTH/3);
        }];
        [parBtn addTarget:self action:@selector(parClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    UIButton* btnPay = [UIButton buttonWithType:UIButtonTypeCustom];
    btnPay.backgroundColor = GOLDCOLOR;
    btnPay.titleLabel.font = [UIFont systemFontOfSize:18];
    [btnPay setTitle:@"立即支付" forState:UIControlStateNormal];
    [btnPay setTitleColor:[Utility colorWithHexString:@"42380e" alpha:1] forState:UIControlStateNormal];
    btnPay.layer.masksToBounds = YES;
    btnPay.layer.cornerRadius = 22;
    [self.view addSubview:btnPay];
    [btnPay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelDetail.mas_bottom).mas_offset(26 + 45 + 28);
        make.left.equalTo(self.view.mas_left).mas_offset(45);
        make.height.mas_equalTo(44);
        make.right.equalTo(self.view.mas_right).mas_offset(-45);
    }];
    [btnPay addTarget:self action:@selector(payClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)parClick:(UIButton *)btn
{
    if (_typePar == btn.tag) {
        
        return;
    }
    
    ParallelButton * lastClickbtn = [self.view viewWithTag:_typePar];
    lastClickbtn.leftImageView.image = [UIImage imageNamed:@"garyRound"];
    
    ParallelButton *  currentClicbtn = [self.view viewWithTag:btn.tag];
    currentClicbtn.leftImageView.image = [UIImage imageNamed:@"goldRound"];
    _typePar = btn.tag;
}
-(void)guiClick:(UIButton *)btn
{
    if (_typeGui == btn.tag) {
        
        return;
    }
    
    MY_TTLPriceBtn * lastClickbtn = [self.view viewWithTag:_typeGui];
    lastClickbtn.imgvBack.image = [UIImage imageNamed:@"borderBack"];
    lastClickbtn.labelPrice.textColor = GOLDCOLOR;
    lastClickbtn.labelDanwei.textColor = GOLDCOLOR;
    lastClickbtn.labelTime.textColor = GOLDCOLOR;
    
    
    MY_TTLPriceBtn *  currentClicbtn = [self.view viewWithTag:btn.tag];
    currentClicbtn.imgvBack.image = [UIImage imageNamed:@"chooseBack"];
    currentClicbtn.labelPrice.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
    currentClicbtn.labelDanwei.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
    currentClicbtn.labelTime.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
    _typeGui = btn.tag;
}


-(void)payClick
{
    if (_typePar == 1001) {
        NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
        [dict setObject:_arrayItemId[_typeGui-2001] forKey:@"itemId"];
        [dict setObject:@1 forKey:@"num"];
        [dict setObject:@1001 forKey:@"payMode"];
        __weak typeof (self) weakSelf = self;
        [TLHTTPRequest MY_postWithBaseUrl:BuyItemURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
                [[AlipaySDK defaultService] payOrder:data[@"info"][@"zfbstr"] fromScheme:AlipayScheme callback:^(NSDictionary *resultDic) {
                    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
                    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
                    MY_LYPersonInfoModel *uModel = arry.firstObject;
                    
//                    MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
                    uModel.available = 1;
                    uModel.isNoble = 1;
//                    [[MessageInfoModel sharedManager] insertModelWith:uModel];
                    [[MY_LLDBManager sharedManager] updateModel:uModel withWhere:where];
//                    NSLog(@"reslut = %@",resultDic);
                    [LQProgressHud showMessage:resultDic[@"memo"]];
                    [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                    
                }];
            }
            else{
                if ([data objectForKey:@"msg"]) {
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showMessage:@"支付失败，请检查网络"];
        }];
        
        
        
    }
    else if (_typePar == 1002){
        // NOTE: 调用微信支付 支付结果开始支付
        NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
        [dict setObject:_arrayItemId[_typeGui-2001] forKey:@"itemId"];
        [dict setObject:@1 forKey:@"num"];
        [dict setObject:@2001 forKey:@"payMode"];
        [TLHTTPRequest MY_postWithBaseUrl:BuyItemURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
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
            else{
                if ([data objectForKey:@"msg"]) {
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showMessage:@"支付失败，请检查网络"];
        }];
        
        
        
        
        
        
        
        
    }else{
        __weak typeof (self) weakSelf = self;
        [TLHTTPRequest MY_getWithBaseUrl:BalanceURL parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
                NSNumber* totleMoney = [[data objectForKey:@"info"] objectForKey:@"totalMoney"];
                if ([totleMoney floatValue] >= [_arrayPrice[_typeGui-2001] floatValue]) {
                    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
                    [dict setObject:_arrayItemId[_typeGui-2001] forKey:@"itemId"];
                    [dict setObject:@1 forKey:@"num"];
                    [dict setObject:@0 forKey:@"payMode"];
                    [TLHTTPRequest MY_postWithBaseUrl:BuyItemURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                        if ([[data objectForKey:@"ret"] integerValue] == 0) {
                            [LQProgressHud showMessage:@"支付成功"];
                            
                            NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
                            NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
                            MY_LYPersonInfoModel *uModel = arry.firstObject;
                            
//                            MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
                            uModel.available = 1;
                            uModel.isNoble = 1;
//                            [[MessageInfoModel sharedManager] insertModelWith:uModel];
                            [[MY_LLDBManager sharedManager] updateModel:uModel withWhere:where];
                           
                            
                            
                            
                            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                        }
                        else{
                            if ([data objectForKey:@"msg"]) {
                                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                            }
                        }
                    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                        [LQProgressHud showMessage:@"支付失败，请检查网络"];
                    }];
                }
                else{
                    [LQProgressHud showMessage:@"对不起，您的余额不足，请选择其他支付方式"];
                }
                
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showMessage:@"请检查网络"];
        }];
    }
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
