//
//  GuideTitleView.m
//  TogetherLu
//
//  Created by gll on 2016/12/20.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//


#import "GuideTitleView.h"

@interface GuideTitleView()

@property(strong,nonatomic)UIView *redView;
@property(strong,nonatomic)UIView *lineView;
@property(strong,nonatomic)NSMutableArray *linewidthAry;

@end

@implementation GuideTitleView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.currentSelectedIndex = defaultSelectInteger;
//        self.linewidthAry = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

-(void)setGuideWithTitle:(NSArray*)titles{
    
    for (UIView* view in [self subviews]) {
        [view removeFromSuperview];
    }
    
    [self.linewidthAry removeAllObjects];
    
    CGFloat buttonSpace = 1;
    CGFloat buttonWidth = (self.bounds.size.width -
                           ([titles count] - buttonSpace)) / [titles count];
    
    UIFont * btnNormalFont = [UIFont systemFontOfSize:17.0];
    UIFont * btnSelectedFont = [UIFont systemFontOfSize:17.0];
    
    CGSize size = [Utility stringSizeWithString:titles[0] textSize:17 width:0 height:20];
    self.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - 6, size.width - 4 , 2.5)];
    self.lineView.backgroundColor = GOLDCOLOR;
    [self addSubview:self.lineView];

    //    初始化 发现等 按钮
    for(int i = 0; i < [titles count]; i++) {
        
        //  存Line 的长度
        CGFloat lineWidth = [Utility stringSizeWithString:titles[i] textSize:17 width:0 height:20].width - 3;
        [self.linewidthAry addObject:@(lineWidth)];
        
        CGRect rect = CGRectMake((buttonWidth + buttonSpace) * i, 0, buttonWidth, self.bounds.size.height-2.5);
        UIButton* button = [Utility createButtonWithFrame:rect setImage:nil target:self action:@selector(clickButton:)];
        [button setTitle:titles[i] forState:(UIControlStateNormal)];
        button.alpha = 0.5;
        [button setTitleColor:THREEC forState:(UIControlStateNormal)];
        button.titleLabel.font = btnNormalFont;
        button.tag = i + defaultSelectInteger;
        
//        [button setBackgroundColor:[UIColor purpleColor]];
        
        if (0 == i ) {
            
            button.titleLabel.font = btnSelectedFont;
            [button setTitleColor:GOLDCOLOR forState:UIControlStateNormal];
            button.alpha = 1.0;
            
            CGPoint center = self.lineView.center;
            center.x = button.center.x;
            self.lineView.center = center;
        }
        
        [button addTarget:self action:@selector(clickButton:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:button];
    }
}

-(void)clickButton:(UIButton*)sender{
    
    [self changeCurrentSelectedIndex:sender.tag];
    
    _currentSelectedIndex = sender.tag;
}

-(void)changeSelectedIndex:(NSInteger)index{
    
    if (index != _currentSelectedIndex) {
        
//        UIFont * btnNormalFont = [UIFont systemFontOfSize:17.0];
//        UIFont * btnSelectedFont = [UIFont systemFontOfSize:17.0];
        
        UIButton * btn = [self viewWithTag:index];
//        btn.titleLabel.font = btnSelectedFont;
        btn.alpha = 1.0;
        [btn setTitleColor:GOLDCOLOR forState:UIControlStateNormal];
        
        
        UIButton * lastBtn = [self viewWithTag:_currentSelectedIndex];
//        lastBtn.titleLabel.font = btnNormalFont;
        lastBtn.alpha = .5;
        [lastBtn setTitleColor:THREEC forState:(UIControlStateNormal)];
        
        
        [UIView animateWithDuration:0.2 animations:^{
            
            CGPoint center = self.lineView.center;
            center.x = btn.center.x;
            self.lineView.center = center;
            
//            CGRect lineRect = self.lineView.frame;
//            lineRect.size.width = [self.linewidthAry[index - defaultSelectInteger] floatValue];
//            self.lineView.frame = lineRect;
            
        } completion:nil];
        
    }
    _currentSelectedIndex = index;
}

-(NSInteger)getCurrentSelectedIndex{
 
    return _currentSelectedIndex;
}

-(void)changeCurrentSelectedIndex:(NSInteger)index{
    
    if (index != _currentSelectedIndex) {
        
        UIFont * btnNormalFont = [UIFont systemFontOfSize:17.0];
        UIFont * btnSelectedFont = [UIFont systemFontOfSize:17.0];
        
        UIButton * btn = [self viewWithTag:index];
        btn.titleLabel.font = btnSelectedFont;
        btn.alpha = 1.0;
        [btn setTitleColor:GOLDCOLOR forState:UIControlStateNormal];
        
        UIButton * lastBtn = [self viewWithTag:_currentSelectedIndex];
        lastBtn.titleLabel.font = btnNormalFont;
        lastBtn.alpha = .5;
        [lastBtn setTitleColor:THREEC forState:(UIControlStateNormal)];

        
        [UIView animateWithDuration:0.2 animations:^{
            
            CGPoint center = self.lineView.center;
            center.x = btn.center.x;
            self.lineView.center = center;
            
//            CGRect lineRect = self.lineView.frame;
//            lineRect.size.width = [self.linewidthAry[index - defaultSelectInteger] floatValue];
//            self.lineView.frame = lineRect;
            
        } completion:nil];
        
    }
    
    if ([self.guideDelegate respondsToSelector:@selector(guideTitleView:SelectedIndex:)]) {
        [self.guideDelegate guideTitleView:self SelectedIndex:index - defaultSelectInteger];
    }

}

#pragma mark ## hide red point
-(void)hideRedPoint:(BOOL)ishide{
    
    if (ishide) {
//        YES Hidden
        if ([self.redView superview]) {
            [self.redView removeFromSuperview];
            self.redView = nil;
        }
        
    }else{
        //移除之前的小红点
        if ([self.redView superview]) {
            [self.redView removeFromSuperview];
            self.redView = nil;
        }
        
        UIButton * lastBtn = (UIButton * )[self viewWithTag:2];
        CGFloat btnX = lastBtn.frame.size.width - 10;
        
        //新建小红点
        self.redView= [[UIView alloc]init];
        self.redView.tag = 8888;
        self.redView.layer.cornerRadius = 5;
        self.redView.backgroundColor = [UIColor redColor];
//        CGRect tabFrame = self.frame;
        
        //确定小红点的位置
//        float percentX = (index +0.6) / TabbarItemNums;
//        CGFloat x = ceilf(percentX * tabFrame.size.width);
//        CGFloat y = ceilf(0.1 * tabFrame.size.height);
        self.redView.frame = CGRectMake(btnX, 0, 10, 10);
        [lastBtn addSubview:self.redView];
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
