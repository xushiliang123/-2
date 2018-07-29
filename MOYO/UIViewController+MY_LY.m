//
//  UIViewController+LY.m
//  VTIME
//
//  Created by 听听 on 2017/11/24.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "UIViewController+MY_LY.h"

@implementation UIViewController (LY)

+ (void)load{
    static dispatch_once_t onceToke;
    dispatch_once(&onceToke, ^{
        Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
        Method viewDidLoaded = class_getInstanceMethod(self, @selector(viewDidLoaded));
        method_exchangeImplementations(viewDidLoad, viewDidLoaded);
    });
}
- (void)viewDidLoaded{
    [self viewDidLoaded];
    NSLog(@"%@ didLoad",self);
}

@end
