//
//  ParallelButton.h
//  videoTest
//
//  Created by Louie on 2017/6/14.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>


@interface ParallelButton : UIControl

@property (nonatomic, strong) UIImageView * leftImageView;      //  左图

//  default 44*30 px
@property (nonatomic, assign) CGFloat imageWidth;               //  图片宽度
@property (nonatomic, assign) CGFloat imageHeight;              //  图片高度

@property (nonatomic, strong) NSString * title;                 //  右字

@property (nonatomic, strong) UIFont * titleFont;               //  右字font default 11

@property (nonatomic, strong) UIColor * titleColor;             //  右字颜色 default #828282

@property (nonatomic, assign) CGFloat space;                    //  字图间隙 default 9

@end
