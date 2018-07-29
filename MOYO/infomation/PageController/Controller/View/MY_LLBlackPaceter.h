//
//  MY_LLBlackPaceter.h
//  VTIME
//
//  Created by Louie on 2017/9/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_LLBlackPaceter : UIView

@property (nonatomic, copy) void(^affirmBtnblock)(NSInteger price);

- (void)show;

@end
