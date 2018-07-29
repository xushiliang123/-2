//
//  MY_TTLIncomeChooseView.h
//  VTIME
//
//  Created by MadridLee on 2017/9/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_TTLIncomeChooseView : UIView

-(instancetype)initWithFrame:(CGRect)frame withChoose:(NSInteger)page;

- (void)show;

@property (copy, nonatomic) void (^blockType)(NSInteger);

@end
