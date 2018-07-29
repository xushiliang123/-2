//
//  AttributeMarkLabel.h
//  TogetherLu
//
//  Created by gll on 2017/6/14.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttributeMarkLabel : UILabel

-(void)attributedTitle:(NSString*)title withFontSize:(UIFont*)titleFont withfontColor:(UIColor*)titleColor atDetialSubTitle:(NSString*)subTitle withSubFontSize:(UIFont*)subTitleFont withSubfontColor:(UIColor*)subTitleColor;

@end
