//
//  PublishTaskTipView.m
//  VTIME
//
//  Created by gll on 2017/12/20.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "PublishTaskTipView.h"

@interface PublishTaskTipView()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *witeBoxView;

@end

@implementation PublishTaskTipView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//  成为贵族
- (IBAction)gotoBecomeGZBtn:(UIButton *)sender {
    
    if (self.goToVCBlock) {
        self.goToVCBlock(1,self);
    }
}


//  上首页
- (IBAction)gotoUpHomePage:(UIButton *)sender {
    
    if (self.goToVCBlock) {
        self.goToVCBlock(2,self);
    }

}


//  邀请好友
- (IBAction)invitedFriends:(UIButton *)sender {
    
    if (self.goToVCBlock) {
        self.goToVCBlock(3,self);
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //  如果点击的是 bgView 就消失
    if (self.bgView == touches.anyObject.view) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            self.alpha = 0.0;
            
        } completion:^(BOOL finished) {
            
            [self removeFromSuperview];
            
        }];
    }else{
        
        
        
    }
    
}


@end
