//
//  MY_TTLWithDrawViewController.m
//  TogetherLu
//
//  Created by MadridLee on 2017/4/7.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLWithDrawViewController.h"
#import "MY_TTLTXLabelTableViewCell.h"
#import "MY_TTLTXGetCodeTableViewCell.h"
#import "MY_TTLTXInPutViewController.h"
@interface MY_TTLWithDrawViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
{
    
    NSString* _strCity;     //开户城市
    NSString* _strLittleBank;     //开户支行
    NSString* _strBankName; //银行名称
    NSString* _strCard;     //卡号
    NSString* _strCode;     //验证码
    
    NSArray * _dates;
    UIView * _pickerBackView;
    UIPickerView * _pickerView;
    
    NSIndexPath* _selectCell;
}
@property (nonatomic, strong) NSTimer *timer;   //定时器
@property (nonatomic, assign) int timeNumber;   //时间
@property (strong, nonatomic) NSArray* arrayTitle;
@property (strong, nonatomic) NSArray* arrayDetail;
@property (nonatomic, strong) UITableView *myTableView;

@property (strong, nonatomic) NSMutableDictionary* dictData;

@end

@implementation MY_TTLWithDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"提现设置";
    [self addNavBtn:@"提交" isLeft:NO target:self action:@selector(rightBarButtonTarget) bgImageName:nil];
    self.arrayTitle = @[@"户名",@"银行",@"开户城市",@"开户支行",@"卡号",@"手机号",@""];
    self.arrayDetail = @[@"",@"请选择银行",@"请输入开户地",@"请输入开户行",@"请输入卡号",@"",@"请输入验证码"];
    _timeNumber = 60;
    [self uiConfig];
    
    //  选择器和按钮的背景
    _pickerBackView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 216)];
    _pickerBackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_pickerBackView];
    
    //  选择器
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 176)];
    
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    
    [_pickerBackView addSubview:_pickerView];
    
    //  选择器上面的按钮
    UIColor * btnColor = [Utility colorWithHexString:@"#333333" alpha:1.0];
    
    UIButton * cancelBtn = [Utility createButtonWithTitle:@"取消" titleColor:btnColor frame:CGRectMake(0, 0, 62, 46) setBackgroundImage:nil target:self action:@selector(pickerBtnClick:)];
    cancelBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    cancelBtn.tag = cancelBtnPicker;
    [_pickerBackView addSubview:cancelBtn];
    
    UIButton * confirmBtn = [Utility createButtonWithTitle:@"确认" titleColor:btnColor frame:CGRectMake(SCREEN_WIDTH - 62, 0, 62, 46) setBackgroundImage:nil target:self action:@selector(pickerBtnClick:)];
    confirmBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    confirmBtn.tag = confirmBtnPicker;
    [_pickerBackView addSubview:confirmBtn];
}

-(void)rightBarButtonTarget
{
    [self.view endEditing:YES];
    if ([Utility isBlankString:_strCode] || _strCode.length != 6) {
//        [self autoHideAlert:@"请填写正确的验证码"];
        [LQProgressHud showMessage:@"请填写正确的验证码"];
        return;
    }
    if ([Utility isBlankString:_strBankName]) {
        [LQProgressHud showMessage:@"请填写银行名"];
        return;
    }
    if ([Utility isBlankString:_strCity]) {
        [LQProgressHud showMessage:@"请填写开户城市"];
        return;
    }
    if ([Utility isBlankString:_strLittleBank]) {
        [LQProgressHud showMessage:@"请填写开户支行"];
        return;
    }
    if ([Utility isBlankString:_strCard]) {
        [LQProgressHud showMessage:@"请填写银行卡号"];
        return;
    }

    [self.dictData setObject:_strCode forKey:@"sixCode"];
    [self.dictData setObject:self.strName forKey:@"bankUserName"];
    [self.dictData setObject:_strBankName forKey:@"bankName"];
    [self.dictData setObject:_strCity forKey:@"bankCity"];
    [self.dictData setObject:_strLittleBank forKey:@"bankCityBranch"];
    [self.dictData setObject:_strCard forKey:@"bankNo"];
    [TLHTTPRequest MY_postWithBaseUrl:BindBankCard parameters:self.dictData success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            //截取掉下标2之前的字符串
//            _blockState(_strBankName,[_strCard substringFromIndex:_strCard.length - 4]);
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"请求失败"];

    }];
}

-(void)uiConfig
{
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    if (SCREEN_WIDTH == 320) {
        self.myTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    self.myTableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.tableFooterView = [UIView new];
    [self.view addSubview:self.myTableView];
    [self.myTableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    self.myTableView.tableFooterView = [UIView new];
    if ([self.myTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.myTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.myTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.myTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

#pragma mark - tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row <= 5) {
        static NSString *cellId = @"MY_TTLTXLabelTableViewCell";
        MY_TTLTXLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLTXLabelTableViewCell" owner:self options:nil] lastObject];
        }
        cell.titleLabel.text = self.arrayTitle[indexPath.row];
        cell.detailLabel.text = self.arrayDetail[indexPath.row];
        if (indexPath.row == 0 || indexPath.row == 5) {
            cell.detailLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
            cell.textFiled.hidden = NO;
            cell.detailLabel.hidden = YES;
            cell.textFiled.delegate = self;
            if (indexPath.row == 0) {
                cell.textFiled.tag = 1111;
            }
            else{
                cell.textFiled.tag = 1112;
            }
        }
        else{
            cell.detailLabel.textColor = [Utility colorWithHexString:@"c9c9c9" alpha:1];
            cell.textFiled.hidden = YES;
            cell.detailLabel.hidden = NO;
        }
        if (indexPath.row > 0 && indexPath.row < 5) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            if (indexPath.row == 1) {
                if (![Utility isBlankString:_strBankName]) {
                    cell.detailLabel.text = _strBankName;
                    cell.detailLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
                }
                else{
                    cell.detailLabel.text = self.arrayDetail[indexPath.row];
                    cell.detailLabel.textColor = [Utility colorWithHexString:@"c9c9c9" alpha:1];
                }
            }
            else if (indexPath.row == 2)
            {
                if (![Utility isBlankString:_strCity]) {
                    cell.detailLabel.text = _strCity;
                    cell.detailLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
                }
                else{
                    cell.detailLabel.text = self.arrayDetail[indexPath.row];
                    cell.detailLabel.textColor = [Utility colorWithHexString:@"c9c9c9" alpha:1];
                }
            }
            else if (indexPath.row == 3)
            {
                if (![Utility isBlankString:_strLittleBank]) {
                    cell.detailLabel.text = _strLittleBank;
                    cell.detailLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
                }
                else{
                    cell.detailLabel.text = self.arrayDetail[indexPath.row];
                    cell.detailLabel.textColor = [Utility colorWithHexString:@"c9c9c9" alpha:1];
                }
            }
            else{
                if (![Utility isBlankString:_strCard]) {
                    cell.detailLabel.text = _strCard;
                    cell.detailLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
                }
                else{
                    cell.detailLabel.text = self.arrayDetail[indexPath.row];
                    cell.detailLabel.textColor = [Utility colorWithHexString:@"c9c9c9" alpha:1];
                }
            }
        }
        else{
            if (indexPath.row == 0) {
                if (![Utility isBlankString:_strName]) {
                    cell.textFiled.text = _strName;
                }
                else{
//                    cell.detailLabel.text = @"真实姓名获取失败";
                    cell.textFiled.placeholder = @"请输入姓名";
                }
            }
            else{
                if (![Utility isBlankString:_phoneNumber]) {
                    cell.textFiled.text = _phoneNumber;
                }
                else{
                    cell.textFiled.placeholder = @"请输入手机号";
                }
            }
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        static NSString *cellId = @"MY_TTLTXGetCodeTableViewCell";
        MY_TTLTXGetCodeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLTXGetCodeTableViewCell" owner:self options:nil] lastObject];
        }
        cell.textField.placeholder = self.arrayDetail[indexPath.row];
        cell.textField.textColor = [Utility colorWithHexString:@"333333" alpha:1];
        cell.textField.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.btnCode addTarget:self action:@selector(getCodeClick:) forControlEvents:UIControlEventTouchUpInside];
        if (_timeNumber == 60 || _timeNumber == 0) {
            [cell.btnCode setTitle:@"获取验证码" forState:UIControlStateNormal];
            cell.btnCode.userInteractionEnabled = YES;
        }
        else{
            cell.btnCode.userInteractionEnabled = NO;
            [cell.btnCode setTitle:[NSString stringWithFormat:@"%ds",_timeNumber] forState:UIControlStateNormal];
        }
        
        return cell;
    }
}

-(void)getCodeClick:(UIButton *)btn
{
    btn.userInteractionEnabled = NO;
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@1001 forKey:@"type"];
    [dict setObject:_phoneNumber forKey:@"mobile"];
    [TLHTTPRequest MY_getWithBaseUrl:GetTiXianCode parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(autoMove) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        }
        else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
            btn.userInteractionEnabled = YES;
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"请求失败"];
        btn.userInteractionEnabled = YES;
    }];
}
#pragma mark --定时器方法
- (void)autoMove {
    _timeNumber--;
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:6 inSection:0];
    MY_TTLTXGetCodeTableViewCell * cell = (MY_TTLTXGetCodeTableViewCell *)[self.myTableView cellForRowAtIndexPath:indexPath];
    [cell.btnCode setBackgroundColor:[Utility colorWithHexString:@"c9c9c9" alpha:1]];
    [cell.btnCode setTitle:[NSString stringWithFormat:@"(%ds)可重发",_timeNumber] forState:UIControlStateNormal];
    if (_timeNumber == 0) {
        [cell.btnCode setTitle:@"获取验证码" forState:UIControlStateNormal];
        [cell.btnCode setBackgroundColor:GOLDCOLOR];
        cell.btnCode.userInteractionEnabled = YES;
        [_timer invalidate];
        _timeNumber = 60;
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row > 0 && indexPath.row < 5) {
        if (indexPath.row == 1) {
            
            _selectCell = indexPath;
//            //银行
            [self openPicker];
            NSArray * months = @[@"招商银行", @"中国工商银行", @"中国农业银行", @"中国银行", @"中国建设银行", @"交通银行", @"中国民生银行", @"中信银行", @"浦东发展银行", @"兴业银行"];
            _dates = @[months];
            //  刷新所有
            [_pickerView reloadAllComponents];
            [_pickerView selectRow:0 inComponent:0 animated:YES];
            
            NSString * selectStr = months[0];
            _strBankName = selectStr;
            [self.myTableView reloadData];
        }
        else if (indexPath.row == 2)
        {
            MY_TTLTXInPutViewController* inputVc = [[MY_TTLTXInPutViewController alloc]init];
            inputVc.inputType = 2;
            inputVc.vcTitle = @"开户城市";
            __weak typeof (self) weakSelf = self;
            inputVc.blockName = ^(NSString *str) {
                _strCity = str;
                NSIndexPath *indexPath=[NSIndexPath indexPathForRow:2 inSection:0];
                [weakSelf.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
            };
            [self.navigationController pushViewController:inputVc animated:YES];
        }
        else if (indexPath.row == 3)
        {
            MY_TTLTXInPutViewController* inputVc = [[MY_TTLTXInPutViewController alloc]init];
            inputVc.inputType = 3;
            inputVc.vcTitle = @"开户支行";
            __weak typeof (self) weakSelf = self;
            inputVc.blockName = ^(NSString *str) {
                _strLittleBank = str;
                NSIndexPath *indexPath=[NSIndexPath indexPathForRow:3 inSection:0];
                [weakSelf.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
            };
            [self.navigationController pushViewController:inputVc animated:YES];
        }
        else
        {
            MY_TTLTXInPutViewController* inputVc = [[MY_TTLTXInPutViewController alloc]init];
            inputVc.inputType = 4;
            inputVc.vcTitle = @"卡号";
            __weak typeof (self) weakSelf = self;
            inputVc.blockName = ^(NSString *str) {
                _strCard = str;
                NSIndexPath *indexPath=[NSIndexPath indexPathForRow:4 inSection:0];
                [weakSelf.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
            };
            [self.navigationController pushViewController:inputVc animated:YES];
        }
    }
}

-(void)dealloc
{
    _timer = nil;
}


#pragma mark --textField代理方法
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 1111) {
        _strName = textField.text;
    }
    else if (textField.tag == 1112)
    {
        _phoneNumber = textField.text;
    }
    else{
        _strCode = textField.text;
    }
    
}


#pragma mark - pickView
//  UIPickerViewDataSource代理
//  设置有几列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return _dates.count;
}

//  设置有某列有几行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return [_dates[component] count];
        
    } else {
        
        return [_dates[component] count];
    }
}


//  UIPickerViewDelegate代理
//  某列的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}

//  设置某行的内容
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return _dates[component][row];
    
}
//  选中某行、某列，调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED{
    
    NSString * selectStr = _dates[component][row];
    _strBankName = selectStr;
    [self.myTableView reloadData];
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *lalTitle=(UILabel *)view;
    if (!lalTitle) {
        lalTitle=[[UILabel alloc] init];
        //        lalTitle.minimumScaleFactor=8;//设置最小字体，与minimumFontSize相同，minimumFontSize在IOS 6后不能使用。
        lalTitle.adjustsFontSizeToFitWidth=YES;//设置字体大小是否适应lalbel宽度
        [lalTitle setTextColor:[UIColor blackColor]];
        [lalTitle setFont:[UIFont systemFontOfSize:16]];
        
        lalTitle.textAlignment=NSTextAlignmentCenter;//文字居中显示
    }
    lalTitle.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    //[self pickerView:pickerView attributedTitleForRow:row forComponent:component];
    return lalTitle;
}


- (void)pickerBtnClick:(UIButton *)pickerBtn{
    
    [self closePicker];
}


//  打开选择器
- (void)openPicker{
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = _pickerBackView.frame;
        rect.origin.y = SCREEN_HEIGHT - 216 - 64;
        _pickerBackView.frame = rect;
    }];
}


//  关闭选择器
- (void)closePicker{
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = _pickerBackView.frame;
        rect.origin.y = SCREEN_HEIGHT;
        _pickerBackView.frame = rect;
    }];
}


-(NSMutableDictionary *)dictData
{
    if (!_dictData) {
        _dictData = [[NSMutableDictionary alloc]init];
    }
    return _dictData;
}

@end
