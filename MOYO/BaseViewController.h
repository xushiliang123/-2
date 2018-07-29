//
//  BaseViewController.h
//  TogetherLu
//
//  Created by Louie on 16/12/15.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "RootBaseViewController.h"

@interface BaseViewController : RootBaseViewController

@property (nonatomic, copy)NSString * vcTitle;

-(void)registerKeyboardNotification;
-(void)removeKeyboardNotification;
-(void)keyboardWillShow:(NSNotification *)notification;
-(void)keyboardWillHide:(NSNotification *)notification;
-(void)changeFrame:(float)y;

- (void)backClick;


@end
