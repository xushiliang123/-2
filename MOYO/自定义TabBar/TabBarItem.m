//
//  TabBarItem.m
//
//
//  Created by huangdl on 15-5-4.
//  Copyright (c) 2015年 Lq. All rights reserved.
//

#import "TabBarItem.h"
#import "ViewController.h"
@implementation TabBarItem



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[Utility colorWithHexString:@"272729" alpha:1]];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted{}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((contentRect.size.height - 25 ) / 2 , 12, 25, 25);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, contentRect.size.width, 0);
}



@end
