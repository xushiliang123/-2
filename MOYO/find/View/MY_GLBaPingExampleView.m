//
//  MY_GLBaPingExampleView.m
//  VTIME
//
//  Created by tingting on 2017/10/17.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLBaPingExampleView.h"

@interface MY_GLBaPingExampleView()
{
    UIView *_contentView;
}

@end

@implementation MY_GLBaPingExampleView

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
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 170 * SCREEN_HEIGHT/667);
    //alpha 0.0  白色   alpha 1 ：黑色   alpha 0～1 ：遮罩颜色，逐渐
//    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
//    self.userInteractionEnabled = YES;
//    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];
    
    if (_contentView == nil)
    {
        
        
        
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(5.5 * SCREEN_WIDTH/375, 0 * SCREEN_HEIGHT/667, 364 * SCREEN_WIDTH/375, 152 * SCREEN_HEIGHT/667)];
//        [_contentView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"矩形6.png"]]];
        [self addSubview:_contentView];
        
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = [UIImage imageNamed:@"矩形6.png"];
        imgView.frame = _contentView.bounds;
        imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [_contentView insertSubview:imgView atIndex:0];
        
        self.TimeBtn = [[UIButton alloc]initWithFrame:CGRectMake(171 * SCREEN_WIDTH/375, 76 * SCREEN_HEIGHT/667, 22 * SCREEN_HEIGHT/667, 22 * SCREEN_HEIGHT/667)];
        [self.TimeBtn setBackgroundImage:[UIImage imageNamed:@"倒计时"] forState:UIControlStateNormal];
        [self.TimeBtn setTitle:[NSString stringWithFormat:@"%d",self.secondsCountDown] forState:UIControlStateNormal];
        self.TimeBtn.titleLabel.font = [UIFont systemFontOfSize:10 * SCREEN_WIDTH/375];
        [self.TimeBtn setTintColor:[Utility colorWithHexString:@"#ffffff" alpha:1.0f]];
        [_contentView addSubview:self.TimeBtn];
        
        
        self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:self.countDownTimer forMode:NSRunLoopCommonModes];

        self.BapingImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 152 * SCREEN_WIDTH/375, 152 * SCREEN_HEIGHT/667)];
        [self.BapingImage setContentMode:UIViewContentModeScaleAspectFill];
        self.BapingImage.clipsToBounds = YES;
        self.BapingImage.image = [UIImage imageNamed:@"waitAudit"];
        [_contentView addSubview:self.BapingImage];
        
        self.UserHeadImage = [[UIImageView alloc] initWithFrame:CGRectMake(320 * SCREEN_WIDTH/375, 105 * SCREEN_HEIGHT/667, 30 * SCREEN_WIDTH/375, 30 * SCREEN_HEIGHT/667)];
//        self.UserHeadImage.image = [UIImage imageNamed:@"waitAudit"];
        
        self.UserHeadImage.layer.masksToBounds = YES;
        self.UserHeadImage.layer.cornerRadius = 15  * SCREEN_WIDTH/375;
        
        [_contentView addSubview:self.UserHeadImage];
        
        self.UserNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(200 * SCREEN_WIDTH/375, 105 * SCREEN_HEIGHT/667, 112 * SCREEN_WIDTH/375, 30 * SCREEN_HEIGHT/667)];
        self.UserNameLabel.textAlignment = NSTextAlignmentRight;
//        self.UserNameLabel.text = @"Crayon哈哈哈哈哈";
        self.UserNameLabel.textColor = [Utility colorWithHexString:@"#fefefe" alpha:1.0f];
        self.UserNameLabel.font = [UIFont boldSystemFontOfSize:12 * SCREEN_WIDTH/375];
        [_contentView addSubview:self.UserNameLabel];
        
        self.BPTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(171 * SCREEN_WIDTH/375, 18 * SCREEN_HEIGHT/667, 190 * SCREEN_WIDTH/375, 40 * SCREEN_HEIGHT/667)];
//        self.BPTextLabel.lineBreakMode = UILineBreakModeWordWrap;
        self.BPTextLabel.numberOfLines = 0;
        NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle  setLineSpacing:5];
        NSString  *testString = @"设置Label的行间距设置Label";
        NSMutableAttributedString  *setString = [[NSMutableAttributedString alloc] initWithString:testString];
        [setString  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [testString length])];
        [self.BPTextLabel setAttributedText:setString];
        
//        self.BPTextLabel.text = @"Crayon哈哈哈哈哈!asds";
        self.BPTextLabel.textColor = [Utility colorWithHexString:@"#ffffff" alpha:1.0f];
        self.BPTextLabel.font = [UIFont boldSystemFontOfSize:16 * SCREEN_WIDTH/375];
        [_contentView addSubview:self.BPTextLabel];
        
        self.Tag1Image = [[UIImageView alloc] initWithFrame:CGRectMake(171 * SCREEN_WIDTH/375, 110 * SCREEN_HEIGHT/667, 30 * SCREEN_WIDTH/375, 30 * SCREEN_HEIGHT/667)];
        
//        [_contentView addSubview:self.Tag1Image];
        
        self.Tag2Image = [[UIImageView alloc] initWithFrame:CGRectMake(197 * SCREEN_WIDTH/375, 70 * SCREEN_HEIGHT/667, 100 * SCREEN_WIDTH/375, 25 * SCREEN_HEIGHT/667)];
        
        [_contentView addSubview:self.Tag2Image];
    }
}

-(void)timeFireMethod{
    //倒计时-1
    self.secondsCountDown--;
    [self.TimeBtn setTitle:[NSString stringWithFormat:@"%d",self.secondsCountDown] forState:UIControlStateNormal];
    if(self.secondsCountDown <= 0){
        [self.countDownTimer invalidate];
        self.countDownTimer = nil;
        [self disMissView];
    }
}

- (void)loadMaskView
{
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
    
    [_contentView setFrame:CGRectMake(5.5 * SCREEN_WIDTH/375, -152 * SCREEN_HEIGHT/667, 364 * SCREEN_WIDTH/375, 152 * SCREEN_HEIGHT/667)];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 1.0;
        
        [_contentView setFrame:CGRectMake(5.5 * SCREEN_WIDTH/375, 0 * SCREEN_HEIGHT/667, 364 * SCREEN_WIDTH/375, 152 * SCREEN_HEIGHT/667)];
        
    } completion:nil];
}

//移除从上向底部弹下去的UIView（包含遮罩）
- (void)disMissView
{
    [_contentView setFrame:CGRectMake(5.5 * SCREEN_WIDTH/375, 6 * SCREEN_HEIGHT/667, 364 * SCREEN_WIDTH/375, 152 * SCREEN_HEIGHT/667)];
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.alpha = 0.0;
                         
                         [_contentView setFrame:CGRectMake(5.5 * SCREEN_WIDTH/375, -152 * SCREEN_HEIGHT/667, 364 * SCREEN_WIDTH/375, 152 * SCREEN_HEIGHT/667)];
                     }
                     completion:^(BOOL finished){
                         
                         [self removeFromSuperview];
                         [_contentView removeFromSuperview];
                         
                     }];
    
}


@end
