//
//  AttributeMarkLabel.m
//  TogetherLu
//
//  Created by gll on 2017/6/14.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "AttributeMarkLabel.h"

@implementation AttributeMarkLabel


-(void)attributedTitle:(NSString*)title withFontSize:(UIFont*)titleFont withfontColor:(UIColor*)titleColor atDetialSubTitle:(NSString*)subTitle withSubFontSize:(UIFont*)subTitleFont withSubfontColor:(UIColor*)subTitleColor{
    
//    大标题 
    NSAttributedString * titleAttribute = [[NSAttributedString alloc]initWithString:title attributes:@{NSForegroundColorAttributeName:titleColor,NSFontAttributeName:titleFont}];
//    子标题
    NSAttributedString * subTitleAttribute = [[NSAttributedString alloc]initWithString:subTitle attributes:@{NSForegroundColorAttributeName:subTitleColor,NSFontAttributeName:subTitleFont}];
//    总的文本
    NSMutableAttributedString * titleAttributeStr = [[NSMutableAttributedString alloc]init];
    [titleAttributeStr appendAttributedString:titleAttribute];
    [titleAttributeStr appendAttributedString:subTitleAttribute];
    self.attributedText = titleAttributeStr;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
