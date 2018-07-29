//
//  TopScrollView.h
//  tingting_starguest
//
//  Created by Louie on 16/11/1.
//  Copyright © 2016年 gll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef  NS_ENUM(NSUInteger, PicturesFrom){
    PicturesFromLocal = 0,
    PicturesFromTheNetwork,
};

typedef void(^TAPGESTUREBLOCK)(NSString * urlStr, NSString * title);

@interface TopScrollView : UIView <UIScrollViewDelegate>

@property (nonatomic, copy)TAPGESTUREBLOCK tapGestureBlock;

- (id)initWithFrame:(CGRect)frame withImages:(NSArray<NSDictionary *> *)images PicturesFrom:( PicturesFrom)form;

- (void)addPageControlWithFrame:(CGRect)frame pageIndicatorColor:(UIColor *)pageIndicatorColor currentPageIndicatorColor:(UIColor *)currentColor;

@end
