//
//  HeadBtn.m
//  TogetherLu
//
//  Created by Louie on 17/3/11.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "HeadBtn.h"

@implementation HeadBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUIWithFrame:frame];
    }
    return self;
}

- (void)createUIWithFrame:(CGRect)frame{
    
//    self.headImage = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 44)/2, 0, frame.size.width - 11, frame.size.width - 11)];
    self.headImage = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 44)/2, 0, 44, 44)];
//    self.headImage.contentMode = UIViewContentModeScaleToFill;
//    self.headImage.layer.masksToBounds = YES;
//    self.headImage.layer.cornerRadius = (frame.size.width - 11 ) / 2;
//    self.headImage.layer.cornerRadius = 20;
    [self addSubview:self.headImage];
    
    self.btnTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headImage.frame) + 10, frame.size.width, ScaleHeight(14))];
    self.btnTitle.font = [UIFont systemFontOfSize:12];
    self.btnTitle.textColor = [Utility colorWithHexString:@"#222222" alpha:1.0];
    self.btnTitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.btnTitle];
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
