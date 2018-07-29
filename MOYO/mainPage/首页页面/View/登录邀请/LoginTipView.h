//
//  LoginTipView.h
//  VTIME
//
//  Created by gll on 2017/11/2.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginTipView : UIView

@property (weak, nonatomic) IBOutlet UIButton *goInviteGril;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *tipView;

@property (copy, nonatomic) void(^goShareBlock)(void);

@end
