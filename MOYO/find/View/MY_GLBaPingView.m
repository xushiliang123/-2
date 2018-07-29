//
//  MY_GLBaPingView.m
//  VTIME
//
//  Created by tingting on 2017/10/16.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLBaPingView.h"

@interface MY_GLBaPingView()<UITextFieldDelegate>
{
    UIView *_contentView;
    UIButton *selectedBtn;
    UIButton *selectedBtn2;
}

@property (nonatomic, strong) ButtonBlock block;
@property (nonatomic, strong) ButtonBlock1 block1;

@property (nonatomic, strong) NSMutableArray *LabelArray;
@property (nonatomic, strong) UITextField *liveThemeTextField;
@property (strong, nonatomic) SXPickPhoto* pickPhoto;//相册类
@property (strong, nonatomic) NSMutableArray* arrayPage;//图片数组



@end


@implementation MY_GLBaPingView

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
        [self initContent];
    }
    
    return self;
}

- (void)initContent
{
    self.bpdic = [[NSMutableDictionary alloc]init];
    [self.bpdic setObject:@"" forKey:@"msg"];
    
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    self.LabelArray = [NSMutableArray array];
    //alpha 0.0  白色   alpha 1 ：黑色   alpha 0～1 ：遮罩颜色，逐渐
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];
    
    if (_contentView == nil)
    {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 150 * SCREEN_HEIGHT/667, SCREEN_WIDTH, SCREEN_HEIGHT - 150 * SCREEN_HEIGHT/667)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
        
        
        UILabel *TagLabel = [[UILabel alloc] initWithFrame:CGRectMake(15 * SCREEN_WIDTH/375, 0, 50 * SCREEN_WIDTH/375, 40 * SCREEN_HEIGHT/667)];
        TagLabel.textAlignment = NSTextAlignmentLeft;
        TagLabel.text = @"霸屏";
        TagLabel.textColor = [Utility colorWithHexString:@"#3c3c3c" alpha:1.0f];
        TagLabel.font = [UIFont systemFontOfSize:15 * SCREEN_WIDTH/375];
        [_contentView addSubview:TagLabel];
        
        UIButton *_missButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 30 * SCREEN_WIDTH/375, 15 * SCREEN_HEIGHT/667, 15 * SCREEN_HEIGHT/667, 15 * SCREEN_HEIGHT/667)];
        [_missButton setImage:[UIImage imageNamed:@"错误"] forState:UIControlStateNormal];
        [_missButton addTarget:self action:@selector(disMissView) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:_missButton];
        
        UILabel *TagLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(15 * SCREEN_WIDTH/375, 46 * SCREEN_HEIGHT/667, 100 * SCREEN_WIDTH/375, 12.5 * SCREEN_HEIGHT/667)];
        TagLabel2.textAlignment = NSTextAlignmentLeft;
        TagLabel2.text = @"霸屏时长";
        TagLabel2.textColor = [Utility colorWithHexString:@"#c9c9c9" alpha:1.0f];
        TagLabel2.font = [UIFont systemFontOfSize:13 * SCREEN_WIDTH/375];
        [_contentView addSubview:TagLabel2];
        
        NSArray *timeArr =  [NSArray arrayWithObjects:@"20",@"30",@"60",@"100",@"520", nil];
        NSArray *TagArr =  [NSArray arrayWithObjects:@"生日霸屏",@"示爱霸屏",@"求约霸屏",@"求婚霸屏",@"女神霸屏", nil];
        
        for(int i = 0; i < 5; i++)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            [btn setFrame:CGRectMake(37 * SCREEN_WIDTH/375 + 64.5 * SCREEN_WIDTH/375 * i, 69.5 * SCREEN_HEIGHT/667, 42.5 * SCREEN_WIDTH/375 , 42.5 * SCREEN_WIDTH/375)];
            btn.backgroundColor = [UIColor whiteColor];
            [btn setTitle:[NSString stringWithFormat:@"%@秒",timeArr[i]] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btn_click:) forControlEvents:UIControlEventTouchUpInside];
            btn.layer.borderWidth = 1.0f;
            btn.layer.borderColor = [[Utility colorWithHexString:@"#c9c9c9" alpha:1.0f] CGColor];
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = 42.5 * SCREEN_WIDTH/375 /2;
            btn.titleLabel.font = [UIFont systemFontOfSize:12 * SCREEN_WIDTH/375];
            btn.tintColor = [Utility colorWithHexString:@"#3c3c3c" alpha:1.0f];
            btn.tag = 20001+i;
            [_contentView addSubview:btn];
            
            UILabel *moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(35 * SCREEN_WIDTH/375 + 64.5 * SCREEN_WIDTH/375 * i, 117 * SCREEN_HEIGHT/667, 46.5 * SCREEN_WIDTH/375, 10 * SCREEN_HEIGHT/667)];
            moneyLabel.tag = 1000+i;
            moneyLabel.textAlignment = NSTextAlignmentCenter;
            moneyLabel.text = [NSString stringWithFormat:@"￥%@",timeArr[i]];
            moneyLabel.textColor = [Utility colorWithHexString:@"#3c3c3c" alpha:1.0f];
            moneyLabel.font = [UIFont systemFontOfSize:13 * SCREEN_WIDTH/375];
            [_contentView addSubview:moneyLabel];
            
            UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn2 setFrame:CGRectMake(37 * SCREEN_WIDTH/375 + 64.5 * SCREEN_WIDTH/375 * i, 160 * SCREEN_HEIGHT/667, 42.5 * SCREEN_WIDTH/375 , 42.5 * SCREEN_WIDTH/375)];
            btn2.backgroundColor = [UIColor whiteColor];
            
        
            [btn2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"baping%d",i+1]] forState:UIControlStateNormal];
            [btn2 addTarget:self action:@selector(btn2_click:) forControlEvents:UIControlEventTouchUpInside];
//            btn2.layer.borderWidth = 1.0f;
//            btn2.layer.borderColor = [[Utility colorWithHexString:@"#c9c9c9" alpha:1.0f] CGColor];
//            btn2.layer.masksToBounds = YES;
//            btn2.layer.cornerRadius = 42.5 * SCREEN_WIDTH/375 /2;
//            btn2.titleLabel.text = TagArr[i];
//            btn2.titleLabel.font = [UIFont systemFontOfSize:12 * SCREEN_WIDTH/375];
//            btn2.tintColor = [Utility colorWithHexString:@"#3c3c3c" alpha:1.0f];
            btn2.tag = i+1;
            [_contentView addSubview:btn2];
            
            
            UILabel *TagLabel5 = [[UILabel alloc] initWithFrame:CGRectMake(33 * SCREEN_WIDTH/375 + 64.5 * SCREEN_WIDTH/375 * i, 207.5 * SCREEN_HEIGHT/667, 50.5 * SCREEN_WIDTH/375, 10 * SCREEN_HEIGHT/667)];
            TagLabel5.textAlignment = NSTextAlignmentCenter;
            TagLabel5.text = TagArr[i];
            TagLabel5.tag = i + 1;
            TagLabel5.textColor = [Utility colorWithHexString:@"#3c3c3c" alpha:1.0f];
            TagLabel5.font = [UIFont systemFontOfSize:12 * SCREEN_WIDTH/375];
            [_contentView addSubview:TagLabel5];
            
            [self.LabelArray addObject:TagLabel5];
            
        }
        
        
        UILabel *TagLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(15 * SCREEN_WIDTH/375, 140 * SCREEN_HEIGHT/667, 100 * SCREEN_WIDTH/375, 12.5 * SCREEN_HEIGHT/667)];
        TagLabel3.textAlignment = NSTextAlignmentLeft;
        TagLabel3.text = @"霸屏类型";
        TagLabel3.textColor = [Utility colorWithHexString:@"#c9c9c9" alpha:1.0f];
        TagLabel3.font = [UIFont systemFontOfSize:13 * SCREEN_WIDTH/375];
        [_contentView addSubview:TagLabel3];
        
        self.liveThemeTextField = [[UITextField alloc]initWithFrame:CGRectMake(15 * SCREEN_WIDTH/375, 230 * SCREEN_HEIGHT/667, SCREEN_WIDTH - 30 * SCREEN_WIDTH/375 , 39 * SCREEN_HEIGHT/667)];
        self.liveThemeTextField.delegate=self;
        self.liveThemeTextField.placeholder = @"输入内容不可以超过20个";
        self.liveThemeTextField.layer.borderWidth = 1.0f;
        self.liveThemeTextField.layer.borderColor = [[Utility colorWithHexString:@"#c9c9c9" alpha:0.5f] CGColor];
        self.liveThemeTextField.layer.masksToBounds = YES;
        self.liveThemeTextField.layer.cornerRadius = 5 * SCREEN_WIDTH/375;
        self.liveThemeTextField.textColor = [Utility colorWithHexString:@"#3C3C3C" alpha:1.0f] ;
        self.liveThemeTextField.font = [UIFont systemFontOfSize:14 * SCREEN_WIDTH/375];
        [_contentView addSubview:self.liveThemeTextField];
         [self.liveThemeTextField addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        
        CGRect frame = [self.liveThemeTextField frame];
        frame.size.width=8.0f;
        [self.liveThemeTextField setLeftView:[[UIView alloc]initWithFrame:frame]];
        [self.liveThemeTextField setLeftViewMode:UITextFieldViewModeAlways];
        
        UILabel *TagLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(15 * SCREEN_WIDTH/375, 280 * SCREEN_HEIGHT/667, 150 * SCREEN_WIDTH/375, 12.5 * SCREEN_HEIGHT/667)];
        TagLabel4.textAlignment = NSTextAlignmentLeft;
        TagLabel4.text = @"可以上传一张图片";
        TagLabel4.textColor = [Utility colorWithHexString:@"#fa4034" alpha:1.0f];
        TagLabel4.font = [UIFont systemFontOfSize:13 * SCREEN_WIDTH/375];
        [_contentView addSubview:TagLabel4];
        
        _UploadButton = [[UIButton alloc]initWithFrame:CGRectMake(15 * SCREEN_WIDTH/375, 302 * SCREEN_HEIGHT/667, 60 * SCREEN_HEIGHT/667, 60 * SCREEN_HEIGHT/667)];
        [_UploadButton setImage:[UIImage imageNamed:@"图层362"] forState:UIControlStateNormal];
        [_UploadButton addTarget:self action:@selector(UploadImg:) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:_UploadButton];
        [_UploadButton.imageView setContentMode:UIViewContentModeScaleAspectFill];
        _UploadButton.clipsToBounds = YES;
        
        _UploadButton.adjustsImageWhenHighlighted = NO;
        
        UIButton *_BuyButton = [[UIButton alloc]initWithFrame:CGRectMake(ScaleWidth(30), ScaleHeight(380), ScaleWidth(315), ScaleHeight(57.5))];
       
        [_BuyButton setImage:[UIImage imageNamed:@"组85"] forState:UIControlStateNormal];
        [_BuyButton addTarget:self action:@selector(BuyBaPing:) forControlEvents:UIControlEventTouchUpInside];
        _BuyButton.layer.masksToBounds = YES;
        _BuyButton.layer.cornerRadius = 57.5 / 2 * SCREEN_HEIGHT/667;
        _BuyButton.titleLabel.font = [UIFont systemFontOfSize:18 * SCREEN_WIDTH/375];
        _BuyButton.tintColor = [Utility colorWithHexString:@"#42380e" alpha:1.0f];
        [_contentView addSubview:_BuyButton];
        _BuyButton.adjustsImageWhenHighlighted = NO;
        self.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerTapped:)];
        
        [_contentView addGestureRecognizer:singleTap];
        
    }
}

- (void)loadMaskView
{
}

- (void)loadMoneyWith:(NSArray *)moneyArr
{
    for(int i = 0 ; i < moneyArr.count ; i++)
    {
        for (UILabel *findLabel in _contentView.subviews) {
            if (findLabel.tag == [[NSString stringWithFormat:@"100%d",i] intValue])
            {
                findLabel.text = moneyArr[i];
            }
        }
    }
    
    
}

//展示从底部向上弹出的UIView（包含遮罩）
- (void)showInView:(UIView *)view
{
    if (!view)
    {
        return;
    }
    
    [view addSubview:self];
    [view addSubview:_contentView];
    
    [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - 184 * SCREEN_HEIGHT/667)];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 1.0;
        
        [_contentView setFrame:CGRectMake(0, 150 * SCREEN_HEIGHT/667, SCREEN_WIDTH, SCREEN_HEIGHT - 150 * SCREEN_HEIGHT/667)];
        
    } completion:nil];
}

//移除从上向底部弹下去的UIView（包含遮罩）
- (void)disMissView
{
    [_contentView setFrame:CGRectMake(0, 150 * SCREEN_HEIGHT/667, SCREEN_WIDTH, SCREEN_HEIGHT - 150 * SCREEN_HEIGHT/667)];
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.alpha = 0.0;
                         
                         [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - 150 * SCREEN_HEIGHT/667)];
                     }
                     completion:^(BOOL finished){
                         
                         [self removeFromSuperview];
                         [_contentView removeFromSuperview];
                         
                     }];
    
}

- (void)btn_click:(id)sender
{
    if (selectedBtn) {
        selectedBtn.backgroundColor = [UIColor whiteColor];
    }
    selectedBtn = sender;
    selectedBtn.backgroundColor = GOLDCOLOR;
//    NSLog(@"点击了第%ld个",selectedBtn.tag);
    
    [self.bpdic setObject:@(selectedBtn.tag) forKey:@"itemId"];
    
}

-(void)btn2_click:(id)sender
{
    UILabel *label;
    if (selectedBtn2) {
        label = [self.LabelArray objectAtIndex:selectedBtn2.tag-1];
        label.textColor = [Utility colorWithHexString:@"#3c3c3c" alpha:1.0f];
    }
    selectedBtn2 = sender;
    
    label = [self.LabelArray objectAtIndex:selectedBtn2.tag-1];
    label.textColor = GOLDCOLOR;

//    NSLog(@"点击了第%ld个",selectedBtn2.tag);
    [self.bpdic setObject:@(selectedBtn2.tag) forKey:@"type"];
    
}

//购买霸屏
-(void)BuyBaPing:(id)sender
{
    if (self.block1) {
        self.block1(self);
    }
}

- (void)addButtonAction:(ButtonBlock)block {
    self.block = block;
}

- (void)addButtonAction1:(ButtonBlock1)block {
    self.block1 = block;
}

-(void)UploadImg:(id)sender {
    if (self.block) {
        self.block(self);
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField == self.liveThemeTextField) {
        //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
        if (range.length == 1 && string.length == 0) {
            return YES;
        }
        //so easy
        else if (self.liveThemeTextField.text.length >= 20) {
            self.liveThemeTextField.text = [textField.text substringToIndex:20];
            return NO;
        }
    }
    return YES;
}

- (void)textFieldEditChanged:(UITextField *)textField

{
    
    [self.bpdic setObject:textField.text forKey:@"msg"];

    
    
}

-(void)fingerTapped:(UITapGestureRecognizer *)gestureRecognizer

{
    
    [self.liveThemeTextField endEditing:YES];
    
    
    
    
    
}




@end
