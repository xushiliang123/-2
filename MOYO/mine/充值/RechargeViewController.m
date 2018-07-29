//
//  RechargeViewController.m
//  TogetherLu
//
//  Created by gll on 2017/4/1.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "RechargeViewController.h"
#import "SelectMoneyView.h"
#import "PayScelectTableViewCell.h"


static NSString * titleStr[]  = {@"支付宝",@"微信"};
static NSString* imgTitle[]={@"alipay_fillet",@"wexin_fillet"};

@interface RechargeViewController ()
<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _currentSelectPaymentMethod;
    NSMutableDictionary * _parameters;
}
@property (nonatomic,strong)UITableView * tabView;
@property (nonatomic, assign) NSInteger currentIndexPath;
@end


@implementation RechargeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WXPAYSuccess:) name:@"WXPAYSuccess" object:nil];
         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WXPAYERROR:) name:@"WXPAYERROR" object:nil];
    }
    return self;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.translucent = NO;
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = YES;
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    
    //      右滑返回
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
   
    _parameters = [NSMutableDictionary dictionary];

    self.navigationItem.title = @"充值";
    _currentSelectPaymentMethod = 5502;
    self.currentIndexPath = 1;
    //  关闭自动布局
    
    self.tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 80) style:UITableViewStyleGrouped];
    self.tabView.showsVerticalScrollIndicator = NO;
    //    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    self.tabView.backgroundColor =  [Utility colorWithHexString:@"f8f8f8" alpha:1];//[UIColor redColor]; //
    [self.view addSubview:self.tabView];
    [self.tabView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    [self.tabView registerNib:[UINib nibWithNibName:NSStringFromClass([PayScelectTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"PayScelectTableViewCell"];
    [self.tabView registerClass:[SelectMoneyView class] forCellReuseIdentifier:@"SelectMoneyView"];
   
    if ([self.tabView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tabView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tabView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tabView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    UIView *view  = [self submitButton];
    [self.view addSubview:view];
    if ([phoneVersion integerValue] >= 11) {
        self.tabView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        //        self.tabView.insetsContentViewsToSafeArea = YES;
        //        self.tabView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tabView.estimatedSectionFooterHeight = 0;
        self.tabView.estimatedSectionHeaderHeight = 0;
        
    }else{
        self.automaticallyAdjustsScrollViewInsets = YES;
    }
    
    [self reLodaData];
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    return nil;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    return nil;
//}
#pragma mark ##  数据请求
-(void)reLodaData
{
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    
//    [dict setObject:USERKEY forKey:@"key"];
    [TLHTTPRequest MY_getWithBaseUrl:BalanceURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            NSDictionary * infoDict = data[@"info"];
            
            CGFloat balance = [infoDict[@"totalMoney"] floatValue];
            
            self.balanceString = [NSString stringWithFormat:@"%0.2f", balance];
            
            [self.tabView reloadData];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}



-(UIView*)submitButton{
    CGFloat tabfooerY;
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    if ([phoneVersion integerValue] >= 11) {
        tabfooerY = self.view.mj_h -140;
    }else{
         tabfooerY = self.view.mj_h -70;
    }
    UIView * tabFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, tabfooerY, SCREEN_WIDTH, 70)];
    tabFooterView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10,0,SCREEN_WIDTH - 20, 55);
    [btn setImage:[UIImage imageNamed:@"确认支付"] forState:0];
//    [btn setBackgroundImage:[UIImage imageNamed:@"button_bg"] forState:(UIControlStateNormal)];
//    [btn setTitleColor:[Utility colorWithHexString:@"000000" alpha:1] forState:UIControlStateNormal];
//    [btn setTitle:@"确认支付" forState:UIControlStateNormal];
//    btn.layer.cornerRadius = 5.0;
//    btn.clipsToBounds = YES;
//    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn addTarget:self action:@selector(submitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [tabFooterView addSubview:btn];
    return tabFooterView;
}

#pragma mark ## 提交充值
-(void)submitButtonClick:(UIButton*)sender{
    
    SelectMoneyView * cell1 = [self.tabView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    NSString * moneyString = cell1.payMoneyString;
    
    NSCharacterSet *set2 = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedString2 = [moneyString stringByTrimmingCharactersInSet:set2];
    
    if ([trimmedString2 isEqualToString:@""]) {
        
        [LQProgressHud showMessage:@"您还选择或者输入金额"];
        return;
    }else if (100 > moneyString.integerValue){
        [LQProgressHud showMessage:@"充值金额最小为100元"];
        return;
    }
    else{
        moneyString = [NSString stringWithFormat:@"%.02f",[moneyString doubleValue]];
    }
    
    [_parameters setObject:moneyString forKey:@"money"];
    
    [_parameters setObject:@(1001) forKey:@"type"];
    
    switch (self.currentIndexPath) {
        case 1:
            [_parameters setObject:@(1001) forKey:@"payMode"];   //  支付宝
            break;
        default:
            [_parameters setObject:@(2001) forKey:@"payMode"];   //  微信

            break;
    }
    
    [TLHTTPRequest MY_postWithBaseUrl:RechargeURL parameters:_parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([data[@"ret"] integerValue] == 0) {
                        
            if ([_parameters[@"payMode"] integerValue] == 1001) {
                
                // NOTE: 调用支付宝 支付结果开始支付
                [[AlipaySDK defaultService] payOrder:data[@"info"][@"zfbstr"] fromScheme:AlipayScheme callback:^(NSDictionary *resultDic) {
                    
                    if ([[resultDic objectForKey:@"resultStatus"] integerValue] == 9000) {

                        [LQProgressHud showMessage:@"充值成功"];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [self.navigationController popViewControllerAnimated:NO];
                        });
                        
                    }else{
                        [LQProgressHud showMessage:@"支付失败"];
                    }
//                    NSLog(@"reslut = %@",resultDic);
                }];
            }
            else if ([_parameters[@"payMode"] integerValue] == 2001) {
                
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
        }
        else {
            [LQProgressHud showMessage:data[@"msg"]];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}


//  微信支付成功
- (void)WXPAYSuccess:(NSNotification *)not {

    [LQProgressHud showMessage:@"充值成功"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:NO];
    });
    
}
//  微信支付失败
- (void)WXPAYERROR:(NSNotification *)not {
    [LQProgressHud showMessage:@"支付失败"];
}

- (void)backClick{
    
	[self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if ([touches anyObject].view == self.tabView) {
        [self.view endEditing:YES];
    }
}

#pragma mark ## tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ( 0 == indexPath.row) {
        return 54;
    }else if (1 == indexPath.row){
        return 230;
    }else{
        return 44;
    }
}

//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
//    headerView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1.0];
//    return headerView;
//}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    0row = 5500;
    if (1 >= indexPath.row) {
        return;
    }
    if (indexPath.row == _currentSelectPaymentMethod - 5502) {
        return;
        
    }
    //        last
    PayScelectTableViewCell * cell1 = [self.tabView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_currentSelectPaymentMethod - 5500 inSection:0]];
    cell1.selectLogoImgView.image = [UIImage imageNamed:@"recharge_selectImg"];
    
    //        current
    PayScelectTableViewCell * cell2 = [self.tabView cellForRowAtIndexPath:indexPath];
    cell2.selectLogoImgView.image = [UIImage imageNamed:@"paySelect"];
    
    _currentSelectPaymentMethod = 5500 + indexPath.row;
    
    if (indexPath.row == 2) {
        self.currentIndexPath = 1;
    }else if (indexPath.row == 3) {
        self.currentIndexPath = 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (0 == indexPath.row) {
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"rechargeCell"];
        if (nil == cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"giftCell"];
        }
        NSMutableAttributedString * attributeStr = [[NSMutableAttributedString alloc]initWithString:@"余额  " attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:COlOR333}];
        
        NSString * balanceStr = [NSString stringWithFormat:@"%.2f 元",self.balanceString.doubleValue];
        NSAttributedString * money = [[NSAttributedString alloc] initWithString:balanceStr attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:24],NSForegroundColorAttributeName:GOLDCOLOR}];
        [attributeStr appendAttributedString:money];
        cell.textLabel.attributedText = attributeStr;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if ( 1 ==  indexPath.row ){
        
        SelectMoneyView * cell = [tableView dequeueReusableCellWithIdentifier:@"SelectMoneyView"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //        __weak typeof(self) weakSelf = self;
        //
        //        cell.PayMoneyBlock=^(SelectMoneyView * payView,UIButton * sender){
        //
        //        };
        
        return cell;
        
    }else{
        PayScelectTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PayScelectTableViewCell"];
        cell.imgPayView.image = [UIImage imageNamed:imgTitle[indexPath.row - 2]];
        cell.labelPayLabel.text = titleStr[indexPath.row - 2];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (2 == indexPath.row) {
            cell.selectLogoImgView.image = [UIImage imageNamed:@"paySelect"];
            cell.imgPayView.image = [UIImage imageNamed:@"AlipayIcon"];
        }else{
            cell.selectLogoImgView.image = [UIImage imageNamed:@"recharge_selectImg"];
            cell.imgPayView.image = [UIImage imageNamed:@"weichatIcon"];
        }
        
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
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
