//
//  PayTextField.m
//  TogetherLu
//
//  Created by gll on 2017/4/8.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "PayTextField.h"

@implementation PayTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel * payLabel = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width - 32, 0, 16, frame.size.height)];
        payLabel.text = @"元";
        payLabel.textColor = COlOR333;
        payLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:payLabel];
    }
    return self;
}

//控制placeHolder的位置
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 16, 0);
}

//控制文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 16, 0);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
