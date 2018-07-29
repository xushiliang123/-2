//
//  SelectMoneyView.m
//  TogetherLu
//
//  Created by gll on 2017/4/8.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "SelectMoneyView.h"
@interface SelectMoneyView()<UITextFieldDelegate>
{
    NSArray * _gameNameArray;
}
@property (strong , nonatomic)UIView * bgView;


@end

static    NSInteger _currentSelectIndex = 0;

@implementation SelectMoneyView



- (void)initUI{
    
    _currentSelectIndex = 0;
    
    self.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    
    _gameNameArray = @[@"100",@"1000",@"5000",@"10000",@"20000",@"50000"];
    UILabel * rechargeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH, 20)];
    rechargeLabel.text = @"充值";
    rechargeLabel.textColor = COlOR333;
    rechargeLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:rechargeLabel];
    
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(rechargeLabel.frame)+15, SCREEN_WIDTH, 88)];
    [self.contentView addSubview:self.bgView];
    self.bgView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    
    CGFloat width    = 84;
    CGFloat height   = 40;
    CGFloat space_x  = (SCREEN_WIDTH - (30 * 2) - (width *3))/2;// 按钮间距
    CGFloat space_y  = 8;
    
    for (NSInteger a = 0; a < 2; ++a) {
        for (NSInteger i = 0; i < 3; ++i) {
            
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake( (width + space_x) * i,(height + space_y) * a, width, height);
            [btn setBackgroundColor:[UIColor whiteColor]];
            [btn setTitleColor:COlOR333 forState:UIControlStateNormal];
            //            [btn setTitleColor:[Utility colorWithHexString:@"ffffff" alpha:1] forState:UIControlStateHighlighted];
            [btn setTitleColor:[Utility colorWithHexString:@"ffffff" alpha:1] forState:UIControlStateSelected];
            if ( 0 == a ) {
                
                NSString * btnStr = [NSString stringWithFormat:@"%@元",_gameNameArray[i]];
                [btn setTitle:btnStr forState:UIControlStateNormal];
                btn.tag = i + MyTAG + 1200;
            }else{
                NSString * btnStr = [NSString stringWithFormat:@"%@元",_gameNameArray[i+3]];
                [btn setTitle:btnStr forState:UIControlStateNormal];
                btn.tag = i + 3 + MyTAG + 1200;
            }
            btn.layer.cornerRadius = width * 0.25;
            btn.clipsToBounds = YES;
            btn.backgroundColor = [UIColor whiteColor];
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            btn.contentMode = UIViewContentModeCenter;
            btn.layer.borderWidth = 1.0;
            btn.layer.borderColor = [Utility colorWithHexString:@"f0f0f0" alpha:1].CGColor;
            [btn addTarget:self action:@selector(selectMoneyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [btn addTarget:self action:@selector(preventFlicker:) forControlEvents:UIControlEventAllTouchEvents];
            if (0 == a && 1 == i) {
                btn.selected = YES;
                [btn setBackgroundColor:GOLDCOLOR];
                _currentSelectIndex = btn.tag;
                self.payMoneyString = @"1000";
            }
            [self.bgView addSubview:btn];
        }
    }
    
    self.moneyTextField = [[PayTextField alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(self.bgView.frame) + 15, SCREEN_WIDTH - 80, 40)];
    self.moneyTextField.placeholder = @"手动输入充值金额";
    self.moneyTextField.delegate = self;
    self.moneyTextField.layer.cornerRadius = 40 * 0.5;
    self.moneyTextField.clipsToBounds = YES;
    self.moneyTextField.layer.borderWidth = 1.0;
    self.moneyTextField.layer.borderColor = [Utility colorWithHexString:@"f0f0f0" alpha:1].CGColor;
    self.moneyTextField.backgroundColor = [UIColor whiteColor];
    self.moneyTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.moneyTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.contentView addSubview:self.moneyTextField];
    
    UILabel * payLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(self.moneyTextField.frame) + 15, SCREEN_WIDTH, 20)];
    payLabel.text = @"支付方式";
    payLabel.textColor = COlOR999;
    payLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:payLabel];
    
}

#pragma mark ## 点击 选定 游戏名称
-(void)selectMoneyBtnClick:(UIButton*)sender{
    
//    if (sender.tag == _currentSelectIndex) {
//        return;
//    }
    if ([self.moneyTextField isFirstResponder]) {
        [self.moneyTextField resignFirstResponder];
    }
    if (_currentSelectIndex != 0) {
        UIButton * lastbtn = (UIButton*)[self.bgView viewWithTag:_currentSelectIndex];
        lastbtn.selected = NO;
        [lastbtn setBackgroundColor:[UIColor whiteColor]];
    }
    
    UIButton * btn = (UIButton*)[self.bgView viewWithTag:sender.tag];
    btn.selected = YES;
    [btn setBackgroundColor:GOLDCOLOR];
    
    
    _currentSelectIndex = btn.tag;
    
    NSUInteger index = btn.tag - MyTAG - 1200;
    
    self.payMoneyString = _gameNameArray[index];
//    self.PayMoneyBlock(self,sender);
    self.moneyTextField.text = @"";
}

- (void)preventFlicker:(UIButton *)button {
    button.highlighted = NO;
}

#pragma mark ## textField Delegate``
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];

    //    if 输入框不是空 输入数字不为0   则发送
//    NSCharacterSet *set2 = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//    NSString *trimmedString2 = [self.moneyTextField.text stringByTrimmingCharactersInSet:set2];
    
//    if (![trimmedString2 isEqualToString:@""] && 0 != self.moneyTextField.text.integerValue) {

        self.payMoneyString = self.moneyTextField.text;
//    }else{
//        
//        
//        if (_currentSelectIndex != 0) {
//            UIButton * lastbtn = (UIButton*)[self.bgView viewWithTag:_currentSelectIndex];
//            lastbtn.selected = YES;
//            [lastbtn setBackgroundColor:BLUECOLOR];
////            _currentSelectIndex = 0;
//        }
//        
//    }
    
}

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
}

- (void)textFieldDidChange:(UITextField *)textField
{
    
    if (_currentSelectIndex != 0) {
        UIButton * lastbtn = (UIButton*)[self.bgView viewWithTag:_currentSelectIndex];
        lastbtn.selected = NO;
        [lastbtn setBackgroundColor:[UIColor whiteColor]];
//        _currentSelectIndex = 0;
    }
    
    if (textField.text.length > 5) {
        textField.text = [textField.text substringToIndex:5];
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (string.length == 0) return YES;
    
    NSInteger existedLength = textField.text.length;
    NSInteger selectedLength = range.length;
    NSInteger replaceLength = string.length;
    if (existedLength - selectedLength + replaceLength > 5) {
        
        [LQProgressHud showMessage:@"充值金额最大为99999元哟"];
        
        //        [MMProgressHUD showWithTitle:@"赠送数量最大99999个呦"];
        //        [MMProgressHUD dismissAfterDelay:3.0];
        
        return NO;
    }
    return YES;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
     
        [self initUI];
        
    }
    return self;
}

@end
