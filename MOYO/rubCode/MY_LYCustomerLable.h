//
//  MY_LYCustomerLable.h
//  DanZhouCity
//
//  Created by 羊羊 on 2017/7/6.
//  Copyright © 2017年 brian. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    myVerticalAlignmentNone = 0,
    myVerticalAlignmentCenter,
    myVerticalAlignmentTop,
    myVerticalAlignmentBottom
} myVerticalAlignment;
@interface MY_LYCustomerLable : UILabel
@property (nonatomic) UIEdgeInsets edgeInsets;

/**
 *  对齐方式
 */
@property (nonatomic) myVerticalAlignment verticalAlignment;
@end
