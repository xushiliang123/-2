//
//  MY_GLBaPingExampleView.h
//  VTIME
//
//  Created by tingting on 2017/10/17.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_GLBaPingExampleView : UIView

@property (nonatomic, assign) int secondsCountDown;

@property (nonatomic, strong) NSTimer *countDownTimer;

@property (nonatomic, strong) UIButton *TimeBtn;

@property (nonatomic, strong) UIImageView * BapingImage;

@property (nonatomic, strong) UIImageView * Tag1Image;

@property (nonatomic, strong) UIImageView * Tag2Image;

@property (nonatomic, strong) UIImageView * UserHeadImage;

@property (nonatomic, strong) UILabel * UserNameLabel;

@property (nonatomic, strong) UILabel * BPTextLabel;

- (void)showInView:(UIView *)view;

- (void)disMissView;

@end
