//
//  MY_XTUserBPView.h
//  VTIME
//
//  Created by tingting on 2017/10/25.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MY_XTUserBPView;
@protocol myBtnDelegate <NSObject>

- (void) BtnClick:(UIButton *)btn withBPView:(MY_XTUserBPView*)pView;

@end

@interface MY_XTUserBPView : UIView

-(void)creatBackgroundView:(UIView *)view;

-(void)animateOut;

-(void)loadUserModel:(MY_LYPersonInfoModel *)model;
@property (strong, nonatomic)MY_LYPersonInfoModel *model;
@property (strong, nonatomic)MY_LYPersonInfoModel *mymodel;  //我自己的model
@property (assign, nonatomic) NSInteger userid;

@property (weak, nonatomic) id<myBtnDelegate> delegate;

@end
