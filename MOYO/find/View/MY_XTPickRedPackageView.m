//
//  MY_XTPickRedPackageView.m
//  VTIME
//
//  Created by tingting on 2017/11/9.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTPickRedPackageView.h"

@interface MY_XTPickRedPackageView()<UITextFieldDelegate>
{
    UIView *_contentView;
    UITextField *heijintext;
    UILabel *hejilabel;
    BOOL isHaveDian;
    UIButton *heijinRedBtn;
}

@property (nonatomic,weak) UIButton *Selectbutton;
@property (nonatomic,strong) NSMutableDictionary *RedPagDic;

@end

@implementation MY_XTPickRedPackageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame])
    {
        self.RedPagDic = [NSMutableDictionary dictionary];
        [self.RedPagDic setObject:@"0" forKey:@"money"];
        [self.RedPagDic setObject:@"无红包" forKey:@"type"];
        [self initContent];
    }
    
    return self;
}

- (void)initContent
{
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    //alpha 0.0  白色   alpha 1 ：黑色   alpha 0～1 ：遮罩颜色，逐渐
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];
    
    if (_contentView == nil)
    {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 247 -64, SCREEN_WIDTH, 247)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 41)];
        view.backgroundColor = [Utility colorWithHexString:@"#F5F5F5" alpha:1.0f];
        [_contentView addSubview:view];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setFrame:CGRectMake(20, 12, 40 , 16)];
        [btn setTitle:@"取消" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(disMissView) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        btn.tintColor = [Utility colorWithHexString:@"#666666" alpha:1.0f];
        [view addSubview:btn];
        
       
        UIButton *huangjinRedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [huangjinRedBtn setFrame:CGRectMake((SCREEN_WIDTH-78*3)/4, 23+41, 78 , 26)];
        [huangjinRedBtn setTitle:@"黄金包" forState:UIControlStateNormal];
        [huangjinRedBtn addTarget:self action:@selector(btn_click:) forControlEvents:UIControlEventTouchUpInside];
        huangjinRedBtn.layer.borderWidth = 1.0f;
        huangjinRedBtn.layer.borderColor = [[Utility colorWithHexString:@"#c9c9c9" alpha:1.0f] CGColor];
        huangjinRedBtn.layer.masksToBounds = YES;
        huangjinRedBtn.layer.cornerRadius = 13;
        huangjinRedBtn.titleLabel.font = [UIFont systemFontOfSize:16];
//        huangjinRedBtn.tintColor = [Utility colorWithHexString:@"#666666" alpha:1.0f];
//        [huangjinRedBtn setTintColor:[Utility colorWithHexString:@"#666666" alpha:1.0f]];
        [huangjinRedBtn setTitleColor:[Utility colorWithHexString:@"#666666" alpha:1.0f] forState:UIControlStateNormal];
        huangjinRedBtn.tag = 20001;
        [_contentView addSubview:huangjinRedBtn];
        
        UIButton *baijinRedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [baijinRedBtn setFrame:CGRectMake((SCREEN_WIDTH-78*3)/2 + 78, 23+41, 78 , 26)];
        [baijinRedBtn setTitle:@"白金包" forState:UIControlStateNormal];
        [baijinRedBtn addTarget:self action:@selector(btn_click:) forControlEvents:UIControlEventTouchUpInside];
        baijinRedBtn.layer.borderWidth = 1.0f;
        baijinRedBtn.layer.borderColor = [[Utility colorWithHexString:@"#c9c9c9" alpha:1.0f] CGColor];
        baijinRedBtn.layer.masksToBounds = YES;
        baijinRedBtn.layer.cornerRadius = 13;
        baijinRedBtn.titleLabel.font = [UIFont systemFontOfSize:16];
//        baijinRedBtn.tintColor = [Utility colorWithHexString:@"#666666" alpha:1.0f];
        [baijinRedBtn setTitleColor:[Utility colorWithHexString:@"#666666" alpha:1.0f] forState:UIControlStateNormal];

        baijinRedBtn.tag = 20002;
        [_contentView addSubview:baijinRedBtn];
        
        
        
        UIButton *noneRedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [noneRedBtn setFrame:CGRectMake((SCREEN_WIDTH-78*3)/4*3 + 78*2, 23+41, 78 , 26)];
        [noneRedBtn setTitle:@"无红包" forState:UIControlStateNormal];
        [noneRedBtn addTarget:self action:@selector(btn_click:) forControlEvents:UIControlEventTouchUpInside];
        noneRedBtn.layer.borderWidth = 1.0f;
        noneRedBtn.layer.borderColor = [[Utility colorWithHexString:@"#c9c9c9" alpha:1.0f] CGColor];
        noneRedBtn.layer.masksToBounds = YES;
        noneRedBtn.layer.cornerRadius = 13;
        noneRedBtn.titleLabel.font = [UIFont systemFontOfSize:16];
//        noneRedBtn.tintColor = [Utility colorWithHexString:@"#666666" alpha:1.0f];
        [noneRedBtn setTitleColor:[Utility colorWithHexString:@"#666666" alpha:1.0f] forState:UIControlStateNormal];

        noneRedBtn.tag = 20003;
        [_contentView addSubview:noneRedBtn];
        
        noneRedBtn.backgroundColor = [Utility colorWithHexString:@"#DAB878" alpha:1.0f];
        noneRedBtn.layer.borderWidth = 0.f;
        noneRedBtn.selected = YES;
        self.Selectbutton = noneRedBtn;
        
        heijinRedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [heijinRedBtn setFrame:CGRectMake((SCREEN_WIDTH-78*3)/2 + 78, 60+41, 78 , 26)];
        [heijinRedBtn setTitle:@"黑金包" forState:UIControlStateNormal];
        [heijinRedBtn addTarget:self action:@selector(btn_click:) forControlEvents:UIControlEventTouchUpInside];
        heijinRedBtn.layer.borderWidth = 1.0f;
        heijinRedBtn.layer.borderColor = [[Utility colorWithHexString:@"#c9c9c9" alpha:1.0f] CGColor];
        heijinRedBtn.layer.masksToBounds = YES;
        heijinRedBtn.layer.cornerRadius = 13;
        heijinRedBtn.titleLabel.font = [UIFont systemFontOfSize:16];
//        heijinRedBtn.tintColor = [Utility colorWithHexString:@"#666666" alpha:1.0f];
        heijinRedBtn.tag = 20004;
        [heijinRedBtn setTitleColor:[Utility colorWithHexString:@"#666666" alpha:1.0f] forState:UIControlStateNormal];
        [_contentView addSubview:heijinRedBtn];
        
       
        
        heijintext = [[UITextField alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-78*3)/4, 109+41, SCREEN_WIDTH - (SCREEN_WIDTH-78*3)/2, 31)];
        heijintext.placeholder = @"壕，黑金包请随意，但金额必须大于2500元";
        heijintext.textAlignment = NSTextAlignmentCenter;
        heijintext.backgroundColor = [Utility colorWithHexString:@"#F5F5F5" alpha:1.0f];
        heijintext.layer.cornerRadius = 15.5;
        heijintext.layer.masksToBounds = YES;
        heijintext.keyboardType = UIKeyboardTypeDefault;
        heijintext.delegate=self;
        [heijintext addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        heijintext.textColor = [Utility colorWithHexString:@"#666666" alpha:1.0f];
        heijintext.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:heijintext];
        
        UILabel *labeltext = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-78*3)/4, 148+41, SCREEN_WIDTH - (SCREEN_WIDTH-78*3)/2, 31)];
        labeltext.textAlignment = NSTextAlignmentRight;
        labeltext.textColor = [Utility colorWithHexString:@"#888888" alpha:1.0f];
        labeltext.font = [UIFont systemFontOfSize:12];
        labeltext.text = @"为每一位参与活动的嘉宾添加红包";
        [_contentView addSubview:labeltext];
        
        UILabel *heji = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-78*3)/4, 181+41, 45, 31)];
        heji.textAlignment = NSTextAlignmentLeft;
        heji.textColor = [Utility colorWithHexString:@"#222222" alpha:1.0f];
        heji.font = [UIFont systemFontOfSize:16];
        heji.text = @"合计:";
        [_contentView addSubview:heji];
        
        hejilabel = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-78*3)/4 + 40, 181+41, 100, 31)];
        hejilabel.textAlignment = NSTextAlignmentLeft;
        hejilabel.textColor = [Utility colorWithHexString:@"#DAB878" alpha:1.0f];
        hejilabel.font = [UIFont systemFontOfSize:16];
        hejilabel.text = [NSString stringWithFormat:@"￥00.00"];
        [_contentView addSubview:hejilabel];
        
        
        UIButton *yesbtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [yesbtn setFrame:CGRectMake(SCREEN_WIDTH - (SCREEN_WIDTH-78*3)/4 - 110, 181+41, 110 , 31)];
        [yesbtn setTitle:@"确认" forState:UIControlStateNormal];
        [yesbtn addTarget:self action:@selector(btn_click:) forControlEvents:UIControlEventTouchUpInside];
        yesbtn.layer.masksToBounds = YES;
        yesbtn.layer.cornerRadius = 15.5;
        yesbtn.backgroundColor = [Utility colorWithHexString:@"#DAB878" alpha:1.0f];
        yesbtn.titleLabel.font = [UIFont systemFontOfSize:16];
        yesbtn.tintColor = [Utility colorWithHexString:@"#222222" alpha:1.0f];
        yesbtn.tag = 20005;
        [_contentView addSubview:yesbtn];
        
        
    }
}

- (void)showInView:(UIView *)view
{
    if (!view)
    {
        return;
    }
    
    [view addSubview:self];
    [view addSubview:_contentView];
    
    [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 280)];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 1.0;
        
        [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT - 280-64 , SCREEN_WIDTH, 280)];
        
    } completion:nil];
}

- (void)disMissView
{
    [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT - 280-64 , SCREEN_WIDTH, 280)];
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.alpha = 0.0;
                         
                         [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 280)];
                     }
                     completion:^(BOOL finished){
                         
                         [self removeFromSuperview];
                         [_contentView removeFromSuperview];
                         
                     }];
    
}

- (void)btn_click:(UIButton *)Btn{
    if(Btn.tag == 20005)
    {
        if (self.returnRedPBlock) {
            self.returnRedPBlock(self.RedPagDic);
        }
    }else
    {
        if (!Btn.isSelected) {
            self.Selectbutton.selected = !self.Selectbutton.selected;
            self.Selectbutton.backgroundColor = [UIColor clearColor];
            self.Selectbutton.layer.borderWidth = 1.0f;
            Btn.selected = !Btn.selected;
            Btn.backgroundColor = [Utility colorWithHexString:@"#DAB878" alpha:1.0f];
            Btn.layer.borderWidth = 0.f;
            self.Selectbutton = Btn;
            
            
            switch (Btn.tag) {
                case 20001:
                    hejilabel.text = [NSString stringWithFormat:@"￥%.2f",1300.00*self.number];
                    [heijintext resignFirstResponder];
                    heijintext.text = @"";
                    [self.RedPagDic setObject:[NSString stringWithFormat:@"%d",1300*self.number] forKey:@"money"];
                    [self.RedPagDic setObject:@"黄金包" forKey:@"type"];
                    break;
                case 20002:
                    hejilabel.text = [NSString stringWithFormat:@"￥%.2f",2500.00*self.number];
                    [self.RedPagDic setObject:[NSString stringWithFormat:@"%d",2500*self.number] forKey:@"money"];
                    [self.RedPagDic setObject:@"白金包" forKey:@"type"];
                    [heijintext resignFirstResponder];
                    heijintext.text = @"";
                    break;
                case 20003:
                    hejilabel.text = @"￥00.00";
                    [heijintext resignFirstResponder];
                    heijintext.text = @"";
                    break;
                case 20004:
                    hejilabel.text = @"￥00.00";
                    [heijintext becomeFirstResponder];
                    break;
                default:
                    break;
            }
            
            
            
            
        }
    }
}

- (void)textFieldDidChange:(UITextField *)textField {
    if(textField.text.length == 0)
    {
        hejilabel.text = @"￥00.00";

    }
    else
    {
//        if(textField.text.floatValue < 2500.00)
//        {
//
//            [LQProgressHud showMessage:@"输入金额需大于2500"];
//        }
//        else
//        {
//            hejilabel.text = [NSString stringWithFormat:@"￥%@",textField.text];
            hejilabel.text = [NSString stringWithFormat:@"￥%.2f",[textField.text floatValue] * self.number];
        
            [self.RedPagDic setObject:[NSString stringWithFormat:@"%.2f",[textField.text floatValue] * self.number] forKey:@"money"];
            [self.RedPagDic setObject:@"黑金包" forKey:@"type"];
//        }

    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField.text.floatValue < 2500.00)
    {
        
        [LQProgressHud showMessage:@"输入金额需大于2500"];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string

{
    /*
     * 不能输入.0-9以外的字符。
     * 设置输入框输入的内容格式
     * 只能有一个小数点
     * 小数点后最多能输入两位
     * 如果第一位是.则前面加上0.
     * 如果第一位是0则后面必须输入点，否则不能输入。
     */
    
    // 判断是否有小数点
    if ([textField.text containsString:@"."]) {
        isHaveDian = YES;
    }else{
        isHaveDian = NO;
    }
    
    if (string.length > 0) {
        
        //当前输入的字符
        unichar single = [string characterAtIndex:0];
        
        // 不能输入.0-9以外的字符
        if (!((single >= '0' && single <= '9') || single == '.'))
        {
            [LQProgressHud showMessage:@"请输入数字或者小数点"];
            return NO;
        }
        
        // 只能有一个小数点
        if (isHaveDian && single == '.') {
            [LQProgressHud showMessage:@"只能输入一个小数点"];
            return NO;
        }
        
        // 如果第一位是.则前面加上0.
        if ((textField.text.length == 0) && (single == '.')) {
            textField.text = @"0";
        }
        
        // 如果第一位是0则后面必须输入点，否则不能输入。
        if ([textField.text hasPrefix:@"0"]) {
            if (textField.text.length > 1) {
                NSString *secondStr = [textField.text substringWithRange:NSMakeRange(1, 1)];
                if (![secondStr isEqualToString:@"."]) {
                    [LQProgressHud showMessage:@"第二个字符需要是小数点"];
                    return NO;
                }
            }else{
                if (![string isEqualToString:@"."]) {
                    [LQProgressHud showMessage:@"第二个字符需要是小数点"];
                    return NO;
                }
            }
        }
        
        // 小数点后最多能输入两位
        if (isHaveDian) {
            NSRange ran = [textField.text rangeOfString:@"."];
            // 由于range.location是NSUInteger类型的，所以这里不能通过(range.location - ran.location)>2来判断
            if (range.location > ran.location) {
                if ([textField.text pathExtension].length > 1) {
                    [LQProgressHud showMessage:@"小数点后最多有两位小数"];
                    return NO;
                }
            }
        }
        
    }
    
    
    [self btn_click:heijinRedBtn];
    
    
    
    return YES;

    
}



@end
