//
//  HeadBtn.h
//  TogetherLu
//
//  Created by Louie on 17/3/11.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadBtn : UIControl

- (instancetype)initWithFrame:(CGRect)frame;

@property (nonatomic, strong) UIImageView * headImage;
@property (nonatomic, strong) UILabel * btnTitle;

@end
