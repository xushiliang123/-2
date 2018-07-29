//
//  MY_XTPickRedPackageView.h
//  VTIME
//
//  Created by tingting on 2017/11/9.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonBlock) (NSDictionary *dic);

@interface MY_XTPickRedPackageView : UIView

- (void)showInView:(UIView *)view;

- (void)disMissView;

@property(nonatomic) int number;

@property(nonatomic, copy) ButtonBlock returnRedPBlock;

@end
