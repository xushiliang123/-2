//
//  MLDemoItem.h
//  MLPickerScrollView
//
//  Created by MelodyLuo on 15/8/14.
//  Copyright (c) 2015年 MelodyLuo. All rights reserved.
//
/**
 *  Demo  自定义 折扣 Item
 */
#import "MLPickerItem.h"

@interface MLDemoItem : MLPickerItem

@property (nonatomic, strong)UIButton *discount;
@property (nonatomic, strong)UIView *pickview;
@property (nonatomic, strong)UILabel *week;
@property (nonatomic, strong)UILabel *day;
@property (nonatomic, strong)UILabel *month;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *dayss;
@property (nonatomic, copy)NSString *monthss;

- (void)setRedTitle;
- (void)setGrayTitle;

@end
