//
//  MY_XTTiXianViewController.m
//  VTIME
//
//  Created by tingting on 2017/11/2.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTTiXianViewController.h"
#import "SelectMoneyView.h"
#import "PayScelectTableViewCell.h"

#import "MY_XTBundWXViewController.h"
#import "MY_XTBundZFBViewController.h"
#import "MY_XTConfirmTixianView.h"

static NSString * titleStr[]  = {@"支付宝",@"微信"};
static NSString* imgTitle[]={@"alipay_fillet",@"wexin_fillet"};

@interface MY_XTTiXianViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    NSInteger _currentSelectPaymentMethod;
    NSMutableDictionary * _parameters;
    NSMutableDictionary * _detailDic;
    UITextField *TiXianMoney;
    UILabel *zfb;
    UILabel *wx;
}
@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic, assign) NSInteger currentIndexPath;

@end

@implementation MY_XTTiXianViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(BundSuccess:) name:@"BundSUccess" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(BundSuccess:) name:@"TiXianSuccess" object:nil];
        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    
    //      右滑返回
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    
    _parameters = [NSMutableDictionary dictionary];
    _detailDic = [NSMutableDictionary dictionary];
    self.navigationItem.title = @"提现";
    _currentSelectPaymentMethod = 5503;
    self.currentIndexPath = 1;
    //  关闭自动布局
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.showsVerticalScrollIndicator = NO;
    //    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled =NO;
    self.tableView.backgroundColor =  [Utility colorWithHexString:@"f8f8f8" alpha:1];//[UIColor redColor]; //
    [self.view addSubview:self.tableView];
    [self.tableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PayScelectTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"PayScelectTableViewCell"];
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    UIView *view  = [self submitButton];
    [self.view addSubview:view];
    if ([phoneVersion integerValue] >= 11) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        //        self.tableView.insetsContentViewsToSafeArea = YES;
        //        self.tableView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
    [self upLoadData];
    
    
}
    
-(UIView*)submitButton{
    CGFloat tabfooerY;
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    if ([phoneVersion integerValue] >= 11) {
        tabfooerY = self.view.mj_h -140;
    }else{
        tabfooerY = self.view.mj_h -70;
    }
    UIView * tabFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.mj_h - 91-64, SCREEN_WIDTH, 91)];
    tabFooterView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0,0,SCREEN_WIDTH, 41);
    [btn1 setBackgroundColor:[UIColor clearColor]];
    [btn1 setTitleColor:[Utility colorWithHexString:@"#B0B0B0" alpha:1] forState:UIControlStateNormal];
    [btn1 setTitle:@"提现规则" forState:UIControlStateNormal];
    //    btn.layer.cornerRadius = 5.0;
    //    btn.clipsToBounds = YES;
    btn1.titleLabel.font = [UIFont systemFontOfSize:13];
    [tabFooterView addSubview:btn1];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0,41,SCREEN_WIDTH, 50);
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn setTitleColor:[Utility colorWithHexString:@"#FFFFFF" alpha:1] forState:UIControlStateNormal];
    [btn setTitle:@"提交" forState:UIControlStateNormal];
//    btn.layer.cornerRadius = 5.0;
//    btn.clipsToBounds = YES;
    btn.backgroundColor = [Utility colorWithHexString:@"#FA4034" alpha:1.0f];
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn addTarget:self action:@selector(submitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [tabFooterView addSubview:btn];
    return tabFooterView;
}

-(void)upLoadData
{
    [TLHTTPRequest MY_getWithBaseUrl:GetVXorZFBMoneyDetailURL parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {

        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
            NSDictionary *d = [NSDictionary dictionaryWithDictionary:[data objectForKey:@"info"]];
            [_detailDic setDictionary:d];
            
           if([[data objectForKey:@"info"] objectForKey:@"alipayCardNo"])
           {
               zfb.text = [[data objectForKey:@"info"] objectForKey:@"alipayCardNo"];
           }
           else if([[data objectForKey:@"info"] objectForKey:@"vxNo"])
           {
               wx.text = [[data objectForKey:@"info"] objectForKey:@"vxNo"];
           }
            
            TiXianMoney.placeholder = [NSString stringWithFormat:@"可提现金额%@元",[[data objectForKey:@"info"] objectForKey:@"moneyBack"]];
            
        }else {
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"请检查网络"];
    }];
}

#pragma mark ## 提交充值
-(void)submitButtonClick:(UIButton*)sender{

    if ([TiXianMoney.text isEqualToString:@""]) {
        
        [LQProgressHud showMessage:@"请输入提取金额"];
        return;
    }
    else if(![self deptNumInputShouldNumber:TiXianMoney.text])
    {
        [LQProgressHud showMessage:@"请输入纯数字"];
        return;
    }
    else if (TiXianMoney.text.floatValue < 1000){
        [LQProgressHud showMessage:@"提现金额需大于1000元"];
        return;
    }
    else if([TiXianMoney.text rangeOfString:@"."].length>0)
    {
        [LQProgressHud showMessage:@"请输入整数"];
        return;
    }
    else if(TiXianMoney.text.floatValue > [NSString stringWithFormat:@"%@",_detailDic[@"moneyBack"]].floatValue)
    {
        [LQProgressHud showMessage:@"输入金额应小于可提现金额"];
        return;
    }
    else 
    {
        if([TiXianMoney.text intValue]%100==0)
        {
            [_parameters setObject:TiXianMoney.text forKey:@"money"];
        }
        else
        {
            [LQProgressHud showMessage:@"请输入100的整数"];
            return;
        }
    }
    
    [_parameters setObject:@(1) forKey:@"checkoutType"];

    switch (self.currentIndexPath) {
        case 1:
            [_parameters setObject:@(1) forKey:@"checkoutType"];   //  支付宝
            break;
        default:
            [_parameters setObject:@(2) forKey:@"checkoutType"];   //  微信

            break;
    }
    
//    NSLog(@"%@",_parameters);
    
    
    
    MY_XTConfirmTixianView *_PopView = [[MY_XTConfirmTixianView alloc]init];
    
    switch (self.currentIndexPath) {
        case 1:
            
            if(![_detailDic objectForKey:@"alipayCardNo"])
            {
                [LQProgressHud showMessage:@"请先绑定支付宝"];
                return;
            }
            
            else
            {
                _PopView.WayTixianLabel.text = @"提现方式:支付宝";   //  支付宝
                _PopView.NumTixianLabel.text = [NSString stringWithFormat:@"账号:%@",_detailDic[@"alipayCardNo"]];
                _PopView.NameTixianLabel.text = [NSString stringWithFormat:@"姓名:%@",_detailDic[@"alipayCardName"]];
            }
            
            break;
        default:
            if(![_detailDic objectForKey:@"vxNo"])
            {
                [LQProgressHud showMessage:@"请先绑定微信"];
                return;
            }
            else
            {
                _PopView.WayTixianLabel.text = @"提现方式:微信";   //  微信
                _PopView.NumTixianLabel.text = [NSString stringWithFormat:@"账号:%@",_detailDic[@"vxNo"]];
                _PopView.NameTixianLabel.text = [NSString stringWithFormat:@"姓名:%@",_detailDic[@"vxName"]];
            }
            
            break;
    }
    _PopView.TiXianDic = [NSDictionary dictionaryWithDictionary:_parameters];
    _PopView.MoneyTixianLabel.text = [NSString stringWithFormat:@"金额:%@元",TiXianMoney.text];
    [_PopView showInView:self.view];
    
}

//判断是否为整形：
- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形：
- (BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

- (BOOL)deptNumInputShouldNumber:(NSString *)str
{
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}


- (void)backClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if ([touches anyObject].view == self.tableView) {
        [self.view endEditing:YES];
    }
}

#pragma mark ## tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 2)
    {
        return 74;
    }
    return 44;
}

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
    if (0 == indexPath.row) {
        MY_XTBundZFBViewController* inVc = [[MY_XTBundZFBViewController alloc]init];
        [self.navigationController pushViewController:inVc animated:YES];
    }
    else if (indexPath.row == 1) {
        MY_XTBundWXViewController* inVc = [[MY_XTBundWXViewController alloc]init];
        [self.navigationController pushViewController:inVc animated:YES];
        
    }
    else if (indexPath.row == 2) {
        return;
        
    }
    else
    {
    
        //        last
        PayScelectTableViewCell * cell1 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_currentSelectPaymentMethod - 5500 inSection:0]];
        cell1.selectLogoImgView.image = [UIImage imageNamed:@"recharge_selectImg"];
    
        //        current
        PayScelectTableViewCell * cell2 = [self.tableView cellForRowAtIndexPath:indexPath];
        cell2.selectLogoImgView.image = [UIImage imageNamed:@"paySelect"];
    
        _currentSelectPaymentMethod = 5500 + indexPath.row;
    
        if (indexPath.row == 3) {
            self.currentIndexPath = 1;
        }
        else if (indexPath.row == 4) {
            self.currentIndexPath = 0;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (0 == indexPath.row) {
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"rechargeCell"];
        if (nil == cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"giftCell"];
        }
        
        UILabel *textLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 14.5, 120, 15)];
        textLabel1.text = @"提现支付宝账号";
        textLabel1.font = [UIFont systemFontOfSize:16];
        textLabel1.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        textLabel1.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:textLabel1];
        
        
        zfb = [[UILabel alloc]initWithFrame:CGRectMake(300 * SCREEN_WIDTH / 375, 14.5, 43 * SCREEN_WIDTH / 375, 15)];
        
        zfb.text = @"设置";
        zfb.font = [UIFont systemFontOfSize:16];
        zfb.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        zfb.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:zfb];
        
//        NSMutableAttributedString * attributeStr = [[NSMutableAttributedString alloc]initWithString:@"余额  " attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:COlOR333}];
//
//        NSString * balanceStr = [NSString stringWithFormat:@"%.2f 元",self.balanceString.doubleValue];
//        NSAttributedString * money = [[NSAttributedString alloc] initWithString:balanceStr attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:24],NSForegroundColorAttributeName:GOLDCOLOR}];
//        [attributeStr appendAttributedString:money];
//        cell.textLabel.attributedText = attributeStr;
//        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if ( 1 ==  indexPath.row ){
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"rechargeCell"];
        if (nil == cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"giftCell"];
        }
        
 
        
        UILabel *textLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 14.5, 120, 15)];
        textLabel1.text = @"提现微信账号";
        textLabel1.font = [UIFont systemFontOfSize:16];
        textLabel1.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        textLabel1.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:textLabel1];
        
        wx = [[UILabel alloc]initWithFrame:CGRectMake(300 * SCREEN_WIDTH / 375, 14.5, 43 * SCREEN_WIDTH / 375, 15)];
        
        wx.text = @"设置";
        wx.font = [UIFont systemFontOfSize:16];
        wx.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        wx.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:wx];
        
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if ( 2 ==  indexPath.row ){
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"rechargeCell"];
        if (nil == cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"giftCell"];
        }
        
        
        
        UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, 24.5, 80, 15)];
        textLabel.text = @"提现金额";
        textLabel.font = [UIFont systemFontOfSize:16];
        textLabel.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        textLabel.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:textLabel];
        
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
        view.backgroundColor = self.tableView.backgroundColor;
        [cell.contentView addSubview:view];
        
        TiXianMoney = [[UITextField alloc]initWithFrame:CGRectMake(150 * SCREEN_WIDTH / 375, 24.5, 210 * SCREEN_WIDTH / 375, 15)];
        
        TiXianMoney.placeholder = [NSString stringWithFormat:@"可提现金额%@",self.money];
        TiXianMoney.font = [UIFont systemFontOfSize:16];
        TiXianMoney.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        TiXianMoney.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:TiXianMoney];
        
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 54, SCREEN_WIDTH, 20)];
        view1.backgroundColor = self.tableView.backgroundColor;
        [cell.contentView addSubview:view1];
        
        UILabel *WayLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, 0, 80, 20)];
        WayLabel.text = @"提现方式";
        WayLabel.font = [UIFont systemFontOfSize:12];
        WayLabel.textColor = [Utility colorWithHexString:@"#B0B0B0" alpha:1.0f];
        WayLabel.textAlignment = NSTextAlignmentLeft;
        [view1 addSubview:WayLabel];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        return cell;
        
    }else{
        PayScelectTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PayScelectTableViewCell"];
        cell.imgPayView.image = [UIImage imageNamed:imgTitle[indexPath.row - 3]];
        cell.labelPayLabel.text = titleStr[indexPath.row - 3];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (3 == indexPath.row) {
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

-(void)BundSuccess:(NSNotification *)not {
    //    caseWXSuccess
    
    [self upLoadData];
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
