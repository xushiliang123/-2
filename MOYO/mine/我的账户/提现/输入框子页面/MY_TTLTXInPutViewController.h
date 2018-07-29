//
//  MY_TTLTXInPutViewController.h
//  TogetherLu
//
//  Created by MadridLee on 2017/4/25.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "BaseViewController.h"

@interface MY_TTLTXInPutViewController : BaseViewController

//输入界面
//2：开户地   3：开户行   4：卡号
@property (assign, nonatomic) NSInteger inputType;

@property (copy, nonatomic) void (^blockName)(NSString *);

@end
