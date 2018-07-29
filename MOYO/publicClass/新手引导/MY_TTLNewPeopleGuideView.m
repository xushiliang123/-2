//
//  MY_TTLNewPeopleGuideView.m
//  VTIME
//
//  Created by Allen on 2017/12/22.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLNewPeopleGuideView.h"

@interface MY_TTLNewPeopleGuideView ()

@property (nonatomic, strong) UIView        * backImageView;
@property (nonatomic, assign) CGRect         buttonFrame;
@property (nonatomic, assign) CGRect         imageFrame;
@property (nonatomic, strong) NSString      *imageName;
@property (nonatomic, strong) NSString      *buttonimageName;
@property (nonatomic, strong) NSString      *promptString;
@property (nonatomic, assign) NSInteger     btnRadius;
@property (nonatomic, assign) NSInteger     windowType;
@property (nonatomic, strong) UIWindow      *wind;
@property (nonatomic, assign) CGFloat       alpha;

@end

@implementation MY_TTLNewPeopleGuideView

- (instancetype)initWithButtonFrame:(CGRect)btnFrame buttonImgName:(NSString *)btnName imgFrame:(CGRect)imgFrame guideImgName:(NSString *)imgName promptString:(NSString *)promptStr corneRadius:(NSUInteger)radius Alpha:(CGFloat)Alpha{
    if (self = [super init])
    {
        self.imageName = imgName;
        self.imageFrame = imgFrame;
        self.buttonFrame = btnFrame;
        self.buttonimageName = btnName;
        self.btnRadius = radius;
        self.promptString = promptStr;
        self.alpha = Alpha;
        [self setUI];
    }
    return self;
}

- (void)setUI{
    // 这里创建指引在这个视图在window上
    
    _wind = [UIApplication sharedApplication].keyWindow;
    self.frame = _wind.frame;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:self.alpha];
    
    if (self.buttonimageName != nil) {
        UIImageView * btnimageView = [[UIImageView alloc]initWithFrame:self.buttonFrame];
        btnimageView.image = [UIImage imageNamed:self.buttonimageName];
        [self addSubview:btnimageView];
    }else{
        CGRect frame = [UIScreen mainScreen].bounds;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:frame];
        [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:self.buttonFrame cornerRadius:self.btnRadius] bezierPathByReversingPath]];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        [self.layer setMask:shapeLayer];
    }
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.imageFrame];
    imageView.image = [UIImage imageNamed:self.imageName];
    [self addSubview:imageView];
    
    //  计算提示文字高度
    CGSize orderSize = [Utility stringSizeWithString:self.promptString textSize:20 width:SCREEN_WIDTH height:0];
    UILabel *titleL = [[UILabel alloc] init];
    //判断提示文字是在箭头上面还是在下面
    if (self.imageFrame.origin.y > self.buttonFrame.origin.y) {
        titleL.frame = CGRectMake(0, self.imageFrame.origin.y + self.imageFrame.size.height + 10, SCREEN_WIDTH, orderSize.height);
    }else{
        titleL.frame = CGRectMake(0, self.imageFrame.origin.y - orderSize.height - 10, SCREEN_WIDTH, orderSize.height);
    }
    titleL.text = self.promptString;
    titleL.numberOfLines = 0;
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.font = [UIFont systemFontOfSize:20];
    titleL.textColor = [UIColor whiteColor];
    [self addSubview:titleL];
    
    if ([self.imageName isEqualToString:@"世界频道内指示红包"]) {
        UIButton *lookBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScaleWidth(60), self.imageFrame.origin.y - ScaleWidth(50), SCREEN_WIDTH/2 - ScaleWidth(100), ScaleWidth(40))];
        [lookBtn setTitle:@"再看看" forState:0];
        [lookBtn setTitleColor:[Utility colorWithHexString:@"#DAB878" alpha:1] forState:0];
        lookBtn.layer.cornerRadius = 5;
        lookBtn.layer.masksToBounds = YES;
        lookBtn.layer.borderWidth = 1;
        lookBtn.layer.borderColor = [Utility colorWithHexString:@"#DAB878" alpha:1].CGColor;
        [lookBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:lookBtn];
        
        UIButton *redBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScaleWidth(40) + SCREEN_WIDTH/2, self.imageFrame.origin.y - ScaleWidth(50), SCREEN_WIDTH/2 - ScaleWidth(100), ScaleWidth(40))];
        [redBtn setTitle:@"发红包" forState:0];
        [redBtn setTitleColor:[Utility colorWithHexString:@"#DAB878" alpha:1] forState:0];
        redBtn.layer.cornerRadius = 5;
        redBtn.layer.masksToBounds = YES;
        redBtn.layer.borderWidth = 1;
        redBtn.layer.borderColor = [Utility colorWithHexString:@"#DAB878" alpha:1].CGColor;
        [redBtn addTarget:self action:@selector(jumpAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:redBtn];
        
        CGRect rect =titleL.frame;
        rect.origin.y -= 85;
        titleL.frame = rect;
        
    }else{
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sureTapClick:)];
        [self addGestureRecognizer:tap];
    }
    
}
- (void)jumpAction{
    if(self.actionBlock){
        self.actionBlock();
    }
    [self dismiss];
}
- (void)cancelAction{
    [self dismiss];
}

//显示
- (void)show{
//    [[UIApplication sharedApplication].keyWindow addSubview:self];
//    if (_windowType == 0) {
    [_wind addSubview:self];
        
//    }
//    UIViewController *topVC = [self appRootViewController];
//    [topVC.view addSubview:self];
}
//隐藏
- (void)dismiss{
    [UIView animateWithDuration:0.2 animations:^{
        [self removeFromSuperview];
    }];
}
//- (void)removeFromSuperview
//{
//    [self.backImageView removeFromSuperview];
//    self.backImageView = nil;
//    CGRect afterFrame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//
//    self.frame = afterFrame;
//    [super removeFromSuperview];
//}
//- (UIViewController *)appRootViewController
//{
//    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
//    UIViewController *topVC = appRootVC;
//    return topVC;
//}
//- (void)willMoveToSuperview:(UIView *)newSuperview
//{
//    if (newSuperview == nil) {
//        return;
//    }
//    UIViewController *topVC = [self appRootViewController];
//
//    if (!self.backImageView) {
//        self.backImageView = [[UIView alloc] initWithFrame:topVC.view.bounds];
//        self.backImageView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
////        self.backImageView.alpha = 0;
//        self.backImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//    }
//
//    if (self.buttonimageName == nil) {
//        CGRect frame = [UIScreen mainScreen].bounds;
//        UIBezierPath *path = [UIBezierPath bezierPathWithRect:frame];
//        [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:self.buttonFrame cornerRadius:self.btnRadius] bezierPathByReversingPath]];
//
//        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//        shapeLayer.path = path.CGPath;
//        [self.backImageView.layer setMask:shapeLayer];
//
//    }
//    [topVC.view addSubview:self.backImageView];
//
//    CGRect afterFrame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//    self.frame = afterFrame;
//
//    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//
//        self.backImageView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
//        self.frame = afterFrame;
//
//    } completion:^(BOOL finished) {
//
//    }];
//    [super willMoveToSuperview:newSuperview];
//}

- (void)sureTapClick:(UITapGestureRecognizer *)tap
{
    if(self.actionBlock){
        self.actionBlock();
    }
    [self dismiss];
}

@end
