//
//  ViewController.h
//  VTIME
//
//  Created by MadridLee on 2017/9/5.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


//  自定义tabBar按钮(自定义背景图)
- (void)addNavBtn:(NSString *)title isLeft:(BOOL)isLeft target:(id)target action:(SEL)action bgImageName:(NSString *)bgImageName;

@end

