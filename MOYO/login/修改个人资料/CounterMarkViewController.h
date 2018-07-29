//
//  CounterMarkViewController.h
//  TogetherLu
//
//  Created by gll on 2017/6/14.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "BaseViewController.h"

@interface CounterMarkViewController : BaseViewController

@property(nonatomic,copy)void(^counterMarkBlock)(NSString * mark);


@end
