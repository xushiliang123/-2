//
//  MY_XTItem.h
//  VTIME
//
//  Created by tingting on 2017/11/9.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MLPickerItem.h"

@interface MY_XTItem : MLPickerItem

@property (nonatomic, strong)UIButton *discount;
@property (nonatomic, strong)UIView *pickview;
@property (nonatomic, strong)UILabel *week;
@property (nonatomic, copy)NSString *title;

- (void)setRedTitle;
- (void)setGrayTitle;

@end
