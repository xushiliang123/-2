//
//  GuideTitleView.h
//  TogetherLu
//
//  Created by gll on 2016/12/20.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//
#import <UIKit/UIKit.h>
#define defaultSelectInteger 10000

@class GuideTitleView;

@protocol GuideTitleViewDelegate <NSObject>

-(void)guideTitleView:(GuideTitleView*)guideView SelectedIndex:(NSInteger)currentIndex;

@end

@interface GuideTitleView : UIView
@property (assign, nonatomic) NSInteger currentSelectedIndex;

@property (assign, nonatomic) id <GuideTitleViewDelegate>  guideDelegate;
-(void)setGuideWithTitle:(NSArray*)titles;//设置button title 这里传进来几个就是几个 button

-(NSInteger)getCurrentSelectedIndex;//获得当前点击索引

-(void)changeCurrentSelectedIndex:(NSInteger)index;//改变当前索引

-(void)changeSelectedIndex:(NSInteger)index; // 不加代理方法 只改变UI
#pragma mark ## hide red point
-(void)hideRedPoint:(BOOL)ishide;
@end
