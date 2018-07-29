//
//  UITabBar+badge.h
//  AmericanStudents
//
//  Created by zkJin on 16/1/20.
//  Copyright © 2016年 张天宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (badge)
- (void)showBadgeOnItemIndex:(int)index; //显示小红点

- (void)showBadgeOnItemIndex:(int)index badgeValue:(int)badgeValue; //显示带badge的红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点
@end
