//
//  MY_TTLPriceBtn.h
//  VTIME
//
//  Created by MadridLee on 2017/9/13.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_TTLPriceBtn : UIControl

@property (strong, nonatomic) UIImageView* imgvBack;

@property (strong, nonatomic) UILabel* labelPrice;

@property (strong, nonatomic) UILabel* labelDanwei;

@property (strong, nonatomic) UILabel* labelTime;


-(void)showPrice:(NSNumber *)price withTime:(NSString *)month;

@end
