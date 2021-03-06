//
//  MY_TTLVKindTyoeTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2017/4/19.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLVKindTyoeTableViewCell.h"

@implementation MY_TTLVKindTyoeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    self.kindLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    self.addVLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    
    [self drawDashLine:self.viewLine lineLength:self.viewLine.frame.size.width lineSpacing:15 lineColor:[Utility colorWithHexString:@"e5e5e5" alpha:1]];
}


/**
 
 ** lineView:       需要绘制成虚线的view
 
 ** lineLength:     虚线的宽度
 
 ** lineSpacing:    虚线的间距
 
 ** lineColor:      虚线的颜色
 
 **/

- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor

{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    [shapeLayer setBounds:lineView.bounds];
    
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    
    [shapeLayer setFillColor:[UIColor whiteColor].CGColor];
    
    //  设置虚线颜色为blackColor
    
    [shapeLayer setStrokeColor:lineColor.CGColor];
    
    //  设置虚线宽度
    
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置线宽，线间距
    
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    
    //  设置路径
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 0, 0);
    
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    
    [shapeLayer setPath:path];
    
    CGPathRelease(path);
    
    //  把绘制好的虚线添加上来
    
    [lineView.layer addSublayer:shapeLayer];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
