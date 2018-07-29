//
//  ShareMenuItem.m
//  TogetherLu
//
//  Created by Louie on 17/1/9.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "ShareMenuItem.h"

@implementation ShareMenuItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUIWithFrame:frame];
    }
    return self;
}


- (void)createUIWithFrame:(CGRect)frame{
    
    self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, ScaleWidth(70), ScaleWidth(70))];
    [self addSubview:self.logoImageView];
    
    self.platformNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.logoImageView.frame) + 10, ScaleWidth(80), 15)];
    
    self.platformNameLabel.textAlignment = NSTextAlignmentCenter;
    
    self.platformNameLabel.font = [UIFont systemFontOfSize:12];
    self.platformNameLabel.textColor = [Utility colorWithHexString:@"#333333" alpha:1.0];
    
    [self addSubview:self.platformNameLabel];
}


- (void)reloadDataWithImage:(UIImage *)image platformName:(NSString *)platformName
{
    self.logoImageView.image = image;
    
    self.platformNameLabel.text = platformName;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
