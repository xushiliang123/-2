//
//  MY_LYCustomerButton.m
//  DanZhouCity
//
//  Created by 羊羊 on 2017/7/11.
//  Copyright © 2017年 brian. All rights reserved.
//

#import "MY_LYCustomerButton.h"

@implementation MY_LYCustomerButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = 50;
    
    return CGRectMake(0, 10, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    //    CGFloat titleY = contentRect.size.height * HomeButtonImageRatio;
    CGFloat titleH = 15;
    CGFloat titleW = contentRect.size.width;
    //    CGFloat titleY = contentRect.size.height - titleH;
    CGFloat titleY = 10 + 50;
    
    return CGRectMake(0, titleY, titleW, titleH);
}

@end
