//
//  HomeBlackView.m
//  VTIME
//
//  Created by Allen on 2017/12/15.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "HomeBlackView.h"


@interface HomeBlackView ()

@property (nonatomic, assign) BOOL     isFirst;

@property (nonatomic, assign) NSInteger     selfHeight;
@property (nonatomic, assign) NSInteger     leftHeight;
@property (nonatomic, assign) NSInteger     type;
@property (nonatomic, strong) UIView        * backImageView;
@property (nonatomic, strong) UIImageView   * typeImg;
@property (nonatomic, strong) UILabel       * typeLabel;
@property (nonatomic, strong) UIImageView   * type2Img;
@property (nonatomic, strong) UILabel       * type2Label;

@end

@implementation HomeBlackView
- (instancetype)initWithFrameHeight:(NSInteger)height leftHeight:(NSInteger)leftheight typeWith:(NSInteger)typeS isOne:(BOOL)yesNo
{
    if (self = [super init])
    {
        self.type = typeS;
        self.selfHeight = height;
        self.leftHeight = leftheight;
        _isFirst = yesNo;
        [self setUI];
    }
    return self;
}
//-(instancetype)init
//{
//    if (self = [super init])
//    {
//        [self setUI];
//    }
//    return self;
//}

- (void)setUI {
    
    self.backgroundColor = [UIColor clearColor];
    if (self.type == 0) {
        self.type2Img = [[UIImageView alloc] init];
        self.type2Img.image = [UIImage imageNamed:@"首页指示任务"];
        self.type2Img.frame = CGRectMake(SCREEN_WIDTH - 120, self.selfHeight + StatusHeight -10, 60, 55);
        [self addSubview:self.type2Img];
        self.type2Label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 350, CGRectGetMinY(self.type2Img.frame) - 30, 300, 20)];
        self.type2Label.font = [UIFont systemFontOfSize:20];
        self.type2Label.textColor = [UIColor whiteColor];
        self.type2Label.textAlignment = NSTextAlignmentRight;
        self.type2Label.text = @"发布个任务让美女和你一起玩";
        [self addSubview:self.type2Label];
        
        
        self.typeImg = [[UIImageView alloc] init];
        self.typeImg.image = [UIImage imageNamed:@"首页世界频道指示"];
        self.typeImg.frame = CGRectMake(60, self.leftHeight + StatusHeight-20, 60, 55);
        self.typeImg.hidden = YES;
        [self addSubview:self.typeImg];
        self.typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, CGRectGetMinY(self.typeImg.frame) - 30, 200, 20)];
        self.typeLabel.font = [UIFont systemFontOfSize:20];
        self.typeLabel.textColor = [UIColor whiteColor];
        self.typeLabel.text = @"点击进入世界频道";
        self.typeLabel.hidden = YES;
        [self addSubview:self.typeLabel];
    }else if (self.type == 1) {
        self.type2Img = [[UIImageView alloc] init];
        self.type2Img.image = [UIImage imageNamed:@"世界频道红包指示"];
        self.type2Img.frame = CGRectMake(SCREEN_WIDTH - 110, self.selfHeight, 60, 55);
        [self addSubview:self.type2Img];
        self.type2Label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 330, CGRectGetMinY(self.type2Img.frame) - 30, 300, 20)];
        self.type2Label.font = [UIFont systemFontOfSize:20];
        self.type2Label.textColor = [UIColor whiteColor];
        self.type2Label.textAlignment = NSTextAlignmentRight;
        self.type2Label.text = @"发个红包会深得MOYO美女喜爱";
        [self addSubview:self.type2Label];
    }
}


- (void)show
{
    UIViewController *topVC = [self appRootViewController];
    [topVC.view addSubview:self];
}
- (void)dismissAlert
{
    [UIView animateWithDuration:0.2 animations:^{
        [self removeFromSuperview];
    }];
}
- (void)removeFromSuperview
{
    [self.backImageView removeFromSuperview];
    self.backImageView = nil;
    //    UIViewController *topVC = [self appRootViewController];
    CGRect afterFrame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    self.frame = afterFrame;
    [super removeFromSuperview];
}
- (UIViewController *)appRootViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
//    while (topVC.presentedViewController) {
//        topVC = topVC.presentedViewController;
//    }
    return topVC;
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
    }

    [topVC.view addSubview:self.backImageView];

    CGRect afterFrame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.frame = afterFrame;

    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{

        self.backImageView.alpha = 0.5f;
        self.frame = afterFrame;

    } completion:^(BOOL finished) {

    }];
    [super willMoveToSuperview:newSuperview];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UIView * view = [touches anyObject].view;
    if (![view isEqual:self.backImageView]) {
        if (_isFirst) {
            _isFirst = NO;
            self.typeImg.hidden =NO;
            self.typeLabel.hidden =NO;
            self.type2Label.hidden =YES;
            self.type2Img.hidden =YES;
//            if (self.removeBlock) {
//                self.removeBlock();
//            }
        }else{
            [self dismissAlert];
        }


    }

}

@end
