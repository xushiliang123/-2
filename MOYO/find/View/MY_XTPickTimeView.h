//
//  MY_XTPickTimeView.h
//  VTIME
//
//  Created by tingting on 2017/11/9.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonBlock) (NSDictionary *dic);

@interface MY_XTPickTimeView : UIView

- (void)showInView:(UIView *)view;

- (void)disMissView;

//- (void)addButtonAction:(ButtonBlock)block;

@property(nonatomic, copy) ButtonBlock returnValueBlock;

@property(nonatomic,strong) UIButton *UploadButton;

@end
