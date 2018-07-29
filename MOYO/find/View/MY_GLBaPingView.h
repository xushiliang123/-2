//
//  MY_GLBaPingView.h
//  VTIME
//
//  Created by tingting on 2017/10/16.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonBlock) (id sender);
typedef void (^ButtonBlock1) (id sender);

@interface MY_GLBaPingView : UIView

- (void)showInView:(UIView *)view;

- (void)disMissView;

- (void)loadMoneyWith:(NSArray *)moneyArr;

- (void)addButtonAction:(ButtonBlock)block;
- (void)addButtonAction1:(ButtonBlock1)block;

@property(nonatomic,strong) UIButton *UploadButton;

@property(nonatomic,strong) NSMutableDictionary *bpdic;

@end
