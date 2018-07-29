//
//  MY_XTConfirmTixianView.h
//  VTIME
//
//  Created by tingting on 2017/11/3.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_XTConfirmTixianView : UIView


@property (nonatomic, strong) UILabel * WayTixianLabel;

@property (nonatomic, strong) UILabel * NumTixianLabel;

@property (nonatomic, strong) UILabel * NameTixianLabel;

@property (nonatomic, strong) UILabel * MoneyTixianLabel;

@property (nonatomic, strong) NSDictionary * TiXianDic;

- (void)showInView:(UIView *)view;

- (void)disMissView;


@end
