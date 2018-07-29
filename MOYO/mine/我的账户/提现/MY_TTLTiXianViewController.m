//
//  MY_TTLTiXianViewController.m
//  TogetherLu
//
//  Created by MadridLee on 2017/4/24.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLTiXianViewController.h"
#import "MY_TTLTiXianTableViewCell.h"
#import "MY_TTLWithDrawViewController.h"

#import "MY_XTBundWXViewController.h"

@interface MY_TTLTiXianViewController ()<UITextFieldDelegate>
{
    NSNumber* _numChange;
    NSMutableDictionary* _dict;
}
@end

@implementation MY_TTLTiXianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提现";
    [TLHTTPRequest MY_getWithBaseUrl:WalletInfoUrl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            _dict = [data objectForKey:@"info"];
            [self uiConfig];
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"暂时不能提现，请检查网络"];
    }];
    
   
    
}
-(void)uiConfig
{
    [self createTableView];
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT- 64 - 49);
    //    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    [self createButton];
}

-(void)createButton
{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 169)];
    
    UIButton* btnDra = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDra.frame = CGRectMake(15, 92, SCREEN_WIDTH - 30, 50);
    [btnDra setTitle:@"提现" forState:UIControlStateNormal];
    [view addSubview:btnDra];
    btnDra.titleLabel.font = [UIFont systemFontOfSize:18];
    btnDra.layer.cornerRadius = 5;
    btnDra.layer.masksToBounds = YES;
    btnDra.tag = 1234;
    if ([[_dict objectForKey:@"isBindBank"] integerValue] == 1) {//绑定过
    NSDate *date =[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd"];
    NSInteger currentDay=[[formatter stringFromDate:date] integerValue];
    if (currentDay >= 28) {
        btnDra.backgroundColor = GOLDCOLOR;
        [btnDra addTarget:self action:@selector(tixianClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        btnDra.backgroundColor = [Utility colorWithHexString:@"c9c9c9" alpha:1];
    }

    btnDra.userInteractionEnabled = YES;
    [btnDra setTitle:@"每月28号及以后可提现" forState:UIControlStateNormal];
    }
    else{
        btnDra.backgroundColor = [Utility colorWithHexString:@"c9c9c9" alpha:1];
        btnDra.userInteractionEnabled = NO;
        [btnDra setTitle:@"提现" forState:UIControlStateNormal];
    }


    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(15, 157, SCREEN_WIDTH - 30, 12)];
    label.font = [UIFont systemFontOfSize:12];
    label.text = @"提现后次月10号之前到账";
    label.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    
    self.tableView.tableFooterView = view;
}

-(void)tixianClick:(UIButton *)btn
{
    [self.view endEditing:YES];
    if ([_numChange intValue] % 10 != 0) {
        [LQProgressHud showMessage:@"提现金额只能是10的倍数"];
        return;
    }
    if (_numChange == nil) {
        [LQProgressHud showMessage:@"请输入提现金额"];
        return;
    }
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    [dict setObject:_numChange forKey:@"money"];
    [TLHTTPRequest MY_postWithBaseUrl:CheckOutMoney parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"请求失败"];
    }];
}

#pragma mark - tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 225;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"MY_TTLTiXianTableViewCell";
    //公用的cell，位置-->>infomation->view->pageviewcontroller
    MY_TTLTiXianTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLTiXianTableViewCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([[_dict objectForKey:@"isBindBank"] integerValue] == 1) {
        //绑定过
        cell.cardLabel.text = [_dict objectForKey:@"bankName"];
        NSString * strNo = [NSString stringWithFormat:@"%@",[_dict objectForKey:@"bankNo"]];
        if (strNo.length >= 4) {
            strNo = [strNo substringWithRange:NSMakeRange(strNo.length - 4, 4)];
        }
        cell.numberLabel.text = [NSString stringWithFormat:@"尾号(%@)",strNo];
        cell.bindBtn.hidden = YES;
        cell.cardLabel.hidden = NO;
        cell.numberLabel.hidden = NO;
        cell.changeBtn.hidden = NO;
        [cell.changeBtn addTarget:self action:@selector(bindClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        cell.bindBtn.hidden = NO;
        cell.cardLabel.hidden = YES;
        cell.numberLabel.hidden = YES;
        cell.changeBtn.hidden = YES;
        [cell.bindBtn addTarget:self action:@selector(bindClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    cell.stateLabel.text = [NSString stringWithFormat:@"可提现金额%.2f元，金额少于100元不可提现，提现金额为10的倍数，如110，660，2340",[[_dict objectForKey:@"moneyBack"] doubleValue]];
    cell.textField.keyboardType = UIKeyboardTypeNumberPad;
    cell.textField.delegate = self;
    return cell;
}
#pragma mark --绑定点击事件
-(void)bindClick:(UIButton *)btn
{
//    MY_TTLWithDrawViewController* withVc = [[MY_TTLWithDrawViewController alloc]init];
//    if (![Utility isBlankString:[_dict objectForKey:@"realName"]]) {
//        withVc.strName = [_dict objectForKey:@"realName"];
//    }
//
//    if ([_dict objectForKey:@"mobileNum"] != nil) {
//        withVc.phoneNumber = [NSString stringWithFormat:@"%@",[_dict objectForKey:@"mobileNum"]];
//    }
//
//
//    __weak typeof (self) weakSelf = self;
//    withVc.blockState = ^(NSString* bankName,NSString* codeStr){
//        if ([[_dict objectForKey:@"isBindBank"] integerValue] == 1) {
////            [_dict objectForKey:@"isBindBank"]
//            [_dict setObject:@0 forKey:@"isBindBank"];
//        }
//        else{
//            [_dict setObject:@1 forKey:@"isBindBank"];
//        }
//        [_dict setObject:bankName forKey:@"bankName"];
//        [_dict setObject:[NSNumber numberWithInt:[codeStr intValue]] forKey:@"bankNo"];
//        [weakSelf.tableView reloadData];
//        UIButton* btn = (UIButton *)[weakSelf.view viewWithTag:1234];
//        btn.backgroundColor = GOLDCOLOR;
//        btn.userInteractionEnabled = YES;
//    };
//    [self.navigationController pushViewController:withVc animated:YES];
    
    
    
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark --textfield

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _numChange = [NSNumber numberWithInt:[textField.text intValue]];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

@end
