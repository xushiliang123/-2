//
//  MY_XTBundZFBViewController.m
//  VTIME
//
//  Created by tingting on 2017/11/2.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTBundZFBViewController.h"
#import "MY_LYMessageInfoModel.h"
@interface MY_XTBundZFBViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITextField *ZFBnum;
    UITextField *ZFBnumagain;
    UITextField *ZFBname;
    UITextField *Phonenum;
    UITextField *VerNum;
    UIButton* _getCodeBtn;
}

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int timeNumber;
@property (nonatomic, strong)MY_LYPersonInfoModel * infoModel;

@end

@implementation MY_XTBundZFBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Do any additional setup after loading the view.
    //      右滑返回
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    
    self.navigationItem.title = @"绑定支付宝";
    self.timeNumber = 60;
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *uModel = arry.firstObject;
    
//    MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    _infoModel = uModel;
    
//    NSString * where = [NSString stringWithFormat:@"userId = %@", USERID];
//    [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//        if ([dataArray.firstObject isKindOfClass:[MY_LLPersonInfoModel class]]) {
//            _infoModel= dataArray.firstObject;
//        }
//    }];
    
    [self uiConfig];

   
    
}

-(void)uiConfig
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleSingleLine)];
    [self.tableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    self.tableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    self.tableView.scrollEnabled =NO;
    [self.view addSubview:self.tableView];
    
    UIView *view  = [self submitButton];
    [self.view addSubview:view];
    
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    
    if ([phoneVersion integerValue] >= 11) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        //        self.tableView.insetsContentViewsToSafeArea = YES;
        //        self.tableView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

-(UIView*)submitButton{
    CGFloat tabfooerY;
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    if ([phoneVersion integerValue] >= 11) {
        tabfooerY = self.view.mj_h -140;
    }else{
        tabfooerY = self.view.mj_h -70;
    }
    UIView * tabFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.mj_h - 50-64, SCREEN_WIDTH, 91)];
    tabFooterView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0,0,SCREEN_WIDTH, 50);
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn setTitleColor:[Utility colorWithHexString:@"#FFFFFF" alpha:1] forState:UIControlStateNormal];
    [btn setTitle:@"绑定" forState:UIControlStateNormal];
    //    btn.layer.cornerRadius = 5.0;
    //    btn.clipsToBounds = YES;
    btn.backgroundColor = [Utility colorWithHexString:@"#FA4034" alpha:1.0f];
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn addTarget:self action:@selector(BundButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [tabFooterView addSubview:btn];
    return tabFooterView;
}

-(void)BundButtonClick:(UIButton *)btn
{
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    
    if (![Utility isBlankString:ZFBnum.text] && ![Utility isBlankString:ZFBnumagain.text] ) {
        if([ZFBnum.text isEqualToString:ZFBnumagain.text])
        {
            [dict setObject:ZFBnum.text forKey:@"alipayCardNo"];
        }
        else{
            [LQProgressHud showMessage:@"两次输入的支付宝账号不同"];
        }
    }
    else{
        [LQProgressHud showMessage:@"请输入支付宝账号"];
        return;
    }
    
    if (![Utility isBlankString:ZFBname.text]) {
        [dict setObject:ZFBname.text forKey:@"alipayCardName"];
    }
    else{
        [LQProgressHud showMessage:@"请输入正确的实名认证"];
        return;
    }
    if (![Utility isBlankString:VerNum.text]) {
        [dict setObject:VerNum.text forKey:@"code"];
    }
    else{
        [LQProgressHud showMessage:@"请输入正确的验证码"];
        return;
    }
    
    [TLHTTPRequest MY_postWithBaseUrl:BundVXorZFBURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            [LQProgressHud showMessage:@"绑定成功"];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"BundSUccess" object:nil];
            
            
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"请求失败，请检查网络"];
    }];
    
    
}

#pragma mark -- tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"Cell";
    
    if(indexPath.row == 0)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        
        UILabel *textLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 17.5, 120, 15)];
        textLabel1.text = @"支付宝账号";
        textLabel1.font = [UIFont systemFontOfSize:16];
        textLabel1.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        textLabel1.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:textLabel1];
        
        CGSize s = [Utility stringSizeWithString:@"支付宝账号" textSize:16 width:0 height:15];
        
        ZFBnum = [[UITextField alloc]initWithFrame:CGRectMake(16 + s.width + 14, 17.5, 210 * SCREEN_WIDTH / 375, 15)];
        
        ZFBnum.placeholder = @"请输入支付宝账号（必填）";
        ZFBnum.text = self.number;
        ZFBnum.font = [UIFont systemFontOfSize:16];
        ZFBnum.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        [cell.contentView addSubview:ZFBnum];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if(indexPath.row == 1)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        UILabel *textLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 17.5, 120, 15)];
        textLabel1.text = @"确认支付宝账号";
        textLabel1.font = [UIFont systemFontOfSize:16];
        textLabel1.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        textLabel1.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:textLabel1];
        
        CGSize s = [Utility stringSizeWithString:@"确认支付宝账号" textSize:16 width:0 height:15];
        
        ZFBnumagain = [[UITextField alloc]initWithFrame:CGRectMake(16 + s.width + 14, 17.5, 230 * SCREEN_WIDTH / 375, 15)];
        
        ZFBnumagain.placeholder = @"再次输入支付宝账号（必填）";
        ZFBnumagain.text = self.number;
        ZFBnumagain.font = [UIFont systemFontOfSize:16];
        ZFBnumagain.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        [cell.contentView addSubview:ZFBnumagain];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if(indexPath.row == 2)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        UILabel *textLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 17.5, 140, 15)];
        textLabel1.text = @"请输入支付宝实名";
        textLabel1.font = [UIFont systemFontOfSize:16];
        textLabel1.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        textLabel1.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:textLabel1];
        
        CGSize s = [Utility stringSizeWithString:@"请输入支付宝实名" textSize:16 width:0 height:15];
        
        ZFBname = [[UITextField alloc]initWithFrame:CGRectMake(16 + s.width + 14, 17.5, 210 * SCREEN_WIDTH / 375, 15)];
        
        ZFBname.placeholder = @"请输入支付宝实名（必填）";
        ZFBname.text = self.name;
        ZFBname.font = [UIFont systemFontOfSize:16];
        ZFBname.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        [cell.contentView addSubview:ZFBname];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if(indexPath.row == 3)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        UILabel *textLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 17.5, 120, 15)];
        textLabel1.text = @"手机号";
        textLabel1.font = [UIFont systemFontOfSize:16];
        textLabel1.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        textLabel1.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:textLabel1];
        
        CGSize s = [Utility stringSizeWithString:@"手机号" textSize:16 width:0 height:15];
        
        Phonenum = [[UITextField alloc]initWithFrame:CGRectMake(16 + s.width + 14, 17.5, 210 * SCREEN_WIDTH / 375, 15)];
        
        Phonenum.placeholder = @"请输入手机号";
        Phonenum.text = [NSString stringWithFormat:@"%ld",_infoModel.mobileNum];
        Phonenum.font = [UIFont systemFontOfSize:16];
        Phonenum.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        [cell.contentView addSubview:Phonenum];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        
        UILabel *textLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 17.5, 120, 15)];
        textLabel1.text = @"验证码";
        textLabel1.font = [UIFont systemFontOfSize:16];
        textLabel1.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        textLabel1.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:textLabel1];
        
        CGSize s = [Utility stringSizeWithString:@"验证码" textSize:16 width:0 height:15];
        
        VerNum = [[UITextField alloc]initWithFrame:CGRectMake(16 + s.width + 14, 17.5, 210 * SCREEN_WIDTH / 375, 15)];
        
        VerNum.placeholder = @"请输入验证码";
        VerNum.font = [UIFont systemFontOfSize:16];
        VerNum.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f];
        [cell.contentView addSubview:VerNum];
        
        _getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _getCodeBtn.frame = CGRectMake(SCREEN_WIDTH - 77 - 16,10,77, 30);
//        [_getCodeBtn setBackgroundColor:[UIColor whiteColor]];
        [_getCodeBtn setTitleColor:[Utility colorWithHexString:@"#FFFFFF" alpha:1] forState:UIControlStateNormal];
        [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getCodeBtn.titleLabel.font  = [UIFont systemFontOfSize: 12];
        _getCodeBtn.layer.cornerRadius = 5.0;
        _getCodeBtn.clipsToBounds = YES;
        _getCodeBtn.backgroundColor = GOLDCOLOR;
        _getCodeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_getCodeBtn addTarget:self action:@selector(getCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:_getCodeBtn];
        
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 获取验证码
- (void)getCodeBtnClick {
    
    NSDictionary * dict = [NSMutableDictionary dictionaryWithObject:@(1001) forKey:@"type"];
    
    if (Phonenum.text.length == 11) {
        
//        [dict setValue:Phonenum.text forKey:@"mobile"];
    }
    else {
        
        [LQProgressHud showMessage:@"请输入正确的手机号"];
        return;
    }
    
    [TLHTTPRequest MY_postWithBaseUrl:BundUrlCode parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(autoMove) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
            
        }
        else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"请求失败，请检查网络"];
    }];
}

#pragma mark --定时器方法
- (void)autoMove {
    
    _timeNumber--;
    _getCodeBtn.userInteractionEnabled = NO;
    [_getCodeBtn setTitle:[NSString stringWithFormat:@"(%ds)可重发",_timeNumber] forState:UIControlStateNormal];
    if (_timeNumber == 0) {
        [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getCodeBtn.userInteractionEnabled = YES;
        [_timer invalidate];
        _timeNumber = 60;
    }
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
