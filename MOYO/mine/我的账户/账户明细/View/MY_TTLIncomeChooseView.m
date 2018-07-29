//
//  MY_TTLIncomeChooseView.m
//  VTIME
//
//  Created by MadridLee on 2017/9/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLIncomeChooseView.h"
#define kAlertWidth SCREEN_WIDTH
#define kAlertHeight 104 //数字和pch文件的高度统一修改
#define Start_X          15.0f      // 第一个按钮的X坐标
#define Start_Y          15.0f     // 第一个按钮的Y坐标
#define Width_Space      10.0f      // 2个按钮之间的横间距
#define Height_Space     17.0f     // 竖间距
#define Button_Height   30.0f    // 高
#define Button_Width    80.0f    // 宽

@interface MY_TTLIncomeChooseView ()
{
    UIButton* _btnBack;
    NSInteger _typeChoose;  //上一次点击的筛选
}
@property (nonatomic, strong) UIView *backImageView;
@end


@implementation MY_TTLIncomeChooseView


-(instancetype)initWithFrame:(CGRect)frame withChoose:(NSInteger)page
{
    self = [super initWithFrame:frame];
    if (self) {
        _typeChoose = page;
        [self createUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return  self;
}

-(void)createUI
{
    NSArray* arrayTitle = @[@"所有",@"全部收益",@"收益支出",@"红包收益",@"邀请分成",@"收益分成"];
    for (int i = 0 ; i < arrayTitle.count; i++) {
        NSInteger index = i % 4;
        NSInteger page = i / 4;
        
        // 圆角按钮
        UIButton *chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        chooseBtn.tag = i + 1234;
        chooseBtn.frame = CGRectMake(index * (Button_Width + Width_Space) + Start_X, page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height);
        [chooseBtn setTitle:arrayTitle[i] forState:UIControlStateNormal];
        [chooseBtn setTitleColor:GOLDCOLOR forState:UIControlStateNormal];
        chooseBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        chooseBtn.layer.cornerRadius = 30/2;
        chooseBtn.layer.masksToBounds = YES;
        chooseBtn.layer.borderWidth = 1;
        chooseBtn.layer.borderColor = GOLDCOLOR.CGColor;
        [self addSubview:chooseBtn];
        //按钮点击方法
        [chooseBtn addTarget:self action:@selector(mapBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == _typeChoose) {
            [chooseBtn setTitleColor:[Utility colorWithHexString:@"ffffff" alpha:1] forState:(UIControlStateNormal)];
            [chooseBtn setBackgroundColor:GOLDCOLOR];
        }
    }

}

-(void)mapBtnClick:(UIButton *)btn
{
    if (_typeChoose == btn.tag - 1234) {
        
        return;
    }
    
    UIButton * lastClickbtn = [self viewWithTag:_typeChoose + 1234];
    [lastClickbtn setTitleColor:GOLDCOLOR forState:(UIControlStateNormal)];
    [lastClickbtn setBackgroundColor:[Utility colorWithHexString:@"ffffff" alpha:1.0]];
    
    UIButton *  currentClicbtn = [self viewWithTag:btn.tag];
    [currentClicbtn setTitleColor:[Utility colorWithHexString:@"ffffff" alpha:1] forState:(UIControlStateNormal)];
    [currentClicbtn setBackgroundColor:GOLDCOLOR];
    _typeChoose = btn.tag - 1234;
    _blockType(_typeChoose);
    [self dismissAlert];
}

- (void)dismissAlert
{
    [UIView animateWithDuration:0.2 animations:^{
        [self removeFromSuperview];
    }];
    
    
}


- (void)show
{
    UIViewController *topVC = [self appRootViewController];
    //self.frame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kAlertWidth) * 0.5, - kAlertHeight - 30, 200, 550);
    [topVC.view addSubview:self];
}

- (UIViewController *)appRootViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}


- (void)removeFromSuperview
{
    [self.backImageView removeFromSuperview];
    self.backImageView = nil;
    UIViewController *topVC = [self appRootViewController];
    CGRect afterFrame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kAlertWidth) * 0.5, CGRectGetHeight(topVC.view.bounds), kAlertWidth, kAlertHeight);
    
    self.frame=afterFrame;
    [super removeFromSuperview];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview == nil) {
        return;
    }
    UIViewController *topVC = [self appRootViewController];
    
    if (!self.backImageView) {
        self.backImageView = [[UIView alloc] initWithFrame:topVC.view.bounds];
        self.backImageView.backgroundColor = [UIColor blackColor];
        self.backImageView.alpha = 0;
        self.backImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        
        _btnBack = [UIButton buttonWithType:UIButtonTypeSystem];
        _btnBack.frame = self.backImageView.bounds;
        _btnBack.backgroundColor = [UIColor clearColor];
        [self addSubview:_btnBack];
        [_btnBack addTarget:self action:@selector(hideShareClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [topVC.view addSubview:self.backImageView];
    [self.backImageView addSubview:_btnBack];
    CGRect afterFrame = CGRectMake(0, 64, SCREEN_WIDTH, kAlertHeight);
    self.frame = afterFrame;
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        //self.transform = CGAffineTransformMakeRotation(0);
        self.backImageView.alpha = 0.4f;
        self.frame = afterFrame;
    } completion:^(BOOL finished) {
    }];
    [super willMoveToSuperview:newSuperview];
}


-(void)hideShareClick:(UIButton *)btn
{
    [self dismissAlert];
}

@end

@implementation UIImage (colorful)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
