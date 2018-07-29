//
//  HeadReadNewView.m
//  TogetherLu
//
//  Created by Louie on 2017/5/17.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "HeadReadNewView.h"


@implementation HeadReadNewView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}


#pragma mark - UI
- (void)setUI{
    
    self.backgroundColor = [UIColor whiteColor];
    
    CGFloat x = (SCREEN_WIDTH - 157) / 2;
    
    self.readNewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.readNewBtn.frame = CGRectMake(x, 10, 157, 40);
    self.readNewBtn.backgroundColor = [UIColor whiteColor];
    self.readNewBtn.layer.masksToBounds = YES;
    self.readNewBtn.layer.cornerRadius = 20;
    self.readNewBtn.layer.borderWidth = 1.0;
    self.readNewBtn.layer.borderColor = [Utility colorWithHexString:@"#f8f8f8" alpha:1.0].CGColor;
    [self addSubview:self.readNewBtn];
    
    
    CGFloat strWidth = [Utility stringSizeWithString:@"查看4条消息" textSize:14 width:0 height:40].width;
    CGFloat headIconX = (157 - 30 - strWidth - 1) / 2;
    
    self.headIcon = [[UIImageView alloc] initWithFrame:CGRectMake(headIconX, 5, 30, 30)];
    self.headIcon.layer.masksToBounds = YES;
    self.headIcon.layer.cornerRadius = 4;
    self.headIcon.image = [UIImage imageNamed:@"占位_头像"];
    [self.readNewBtn addSubview:self.headIcon];
    
    
    self.readNewLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headIcon.frame) + 8, 0, strWidth + 1, 40)];
    self.readNewLabel.text = @"查看4条消息";
    self.readNewLabel.textColor = COlOR333;
    self.readNewLabel.font = [UIFont systemFontOfSize:14];
    [self.readNewBtn addSubview:self.readNewLabel];
}



#pragma mark - 重写set，修改条数
- (void)setReadNewCount:(NSInteger)readNewCount{
    
    _readNewCount = readNewCount;
    
    NSString * readStr = [NSString stringWithFormat:@"查看%ld条消息", (long)readNewCount];
    
    CGFloat strWidth = [Utility stringSizeWithString:readStr textSize:14 width:0 height:40].width;
    CGFloat headIconX = (157 - 30 - strWidth - 1) / 2;
    
//  改变头像x
    CGRect headIconRect = self.headIcon.frame;
    headIconRect.origin.x = headIconX;
    self.headIcon.frame = headIconRect;
    
//  更新文字x，改变宽度
    CGRect readNewLabelRect = self.readNewLabel.frame;
    readNewLabelRect.origin.x = CGRectGetMaxX(self.headIcon.frame) + 8;
    readNewLabelRect.size.width = strWidth + 1;
    self.readNewLabel.frame = readNewLabelRect;
    
    self.readNewLabel.text = readStr;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
