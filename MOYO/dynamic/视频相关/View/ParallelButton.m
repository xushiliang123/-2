//
//  ParallelButton.m
//  videoTest
//
//  Created by Louie on 2017/6/14.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "ParallelButton.h"


@implementation ParallelButton
{
    UILabel * _titleLabel;
}


+ (void)initialize
{
    // UIAppearance Proxy Defaults
    
    ParallelButton *btn = [self appearance];
    
    btn.space = 9;
    btn.titleColor = [Utility colorWithHexString:@"#828282" alpha:1.0];
    btn.titleFont = [UIFont systemFontOfSize:11];
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setUI];
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self setUI];
    }
    return self;
}


//用xib创建视图对象
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUI];
    }
    return self;
}


- (void)setUI
{
    self.leftImageView = [[UIImageView alloc] init];
    [self addSubview:self.leftImageView];
    
    //  44*30 px
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left);
        make.width.mas_equalTo(22);
        make.height.mas_equalTo(15);
    }];
    
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = self.titleFont;
    _titleLabel.textColor = self.titleColor;
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_titleLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.leftImageView.mas_right).mas_offset(9);
        make.height.equalTo(self.mas_height);
        make.width.equalTo(self.mas_width).mas_offset(-32);
    }];
}


- (void)setTitle:(NSString *)title
{
    _title = title;
    if (_titleLabel) {
        _titleLabel.text = title;
    }
}



- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    if (_titleLabel) {
        _titleLabel.font = titleFont;
    }
}



- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    if (_titleColor) {
        _titleLabel.textColor = titleColor;
    }
}



- (void)setSpace:(CGFloat)space
{
    _space = space;
    if (self.leftImageView && _titleLabel) {
        
        [_titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.leftImageView.mas_right).mas_offset(space);
        }];
    }
}


- (void)setImageWidth:(CGFloat)imageWidth {
    _imageWidth = imageWidth;
    
    if (_leftImageView) {
        [_leftImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.width.mas_equalTo(_imageWidth);
        }];
    }
}

-(void)setImageHeight:(CGFloat)imageHeight {
    _imageHeight = imageHeight;
    
    if (_leftImageView) {
        [_leftImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(_imageHeight);
        }];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
