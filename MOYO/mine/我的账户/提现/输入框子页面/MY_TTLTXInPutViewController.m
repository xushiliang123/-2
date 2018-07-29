//
//  MY_TTLTXInPutViewController.m
//  TogetherLu
//
//  Created by MadridLee on 2017/4/25.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLTXInPutViewController.h"

@interface MY_TTLTXInPutViewController ()<UITextViewDelegate>
{
    UITextView* _textView;
}
@end

@implementation MY_TTLTXInPutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    [self addNavBtn:@"确定" isLeft:NO target:self action:@selector(sureAction) bgImageName:nil];
    if (self.inputType == 2) {
        [self createCity];
    }
    else if (self.inputType == 3)
    {
        [self createBank];
    }
    else
    {
        [self createCard];
    }
}
-(void)sureAction
{
    [self.view endEditing:YES];
    if (![Utility isBlankString:_textView.text]) {
        _blockName(_textView.text);
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        [LQProgressHud showMessage:@"请输入具体信息"];
    }
}
#pragma mark --城市
-(void)createCity
{
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 125)];
    _textView.delegate = self;
    [self.view addSubview:_textView];
    
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(15, 145, SCREEN_WIDTH - 15, 56)];
    label.font = [UIFont systemFontOfSize:12];
    label.numberOfLines = 3;
    label.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    label.text = @"例：\n浙江省杭州市\n北京市朝阳区莲花路";
    [self.view addSubview:label];
}
#pragma mark --银行
-(void)createBank
{
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 125)];
    _textView.delegate = self;
    [self.view addSubview:_textView];
    
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(15, 145, SCREEN_WIDTH - 15, 34)];
    label.font = [UIFont systemFontOfSize:12];
    label.numberOfLines = 2;
    label.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    label.text = @"*开户支行如填写错误，将无法打款\n*开户支行请拨打银行客服电话查询";
    [self.view addSubview:label];
    
    UILabel* labelLi = [[UILabel alloc]initWithFrame:CGRectMake(15, 200, SCREEN_WIDTH - 15, 78)];
    labelLi.font = [UIFont systemFontOfSize:12];
    labelLi.numberOfLines = 4;
    labelLi.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    labelLi.text = @"例：\n莲花南路支行\n城东支行\n科技园支行";
    [self.view addSubview:labelLi];
}
#pragma mark --卡号
-(void)createCard
{
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 125)];
    _textView.keyboardType = UIKeyboardTypeNumberPad;
    _textView.delegate = self;
    _textView.editable = YES;
    [self.view addSubview:_textView];
    
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
