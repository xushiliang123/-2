//
//  MY_TTLCerInstructionViewController.h
//  TogetherLu
//
//  Created by MadridLee on 2017/4/20.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "BaseViewController.h"

@interface MY_TTLCerInstructionViewController : BaseViewController
//  —1（负1）为尚未申请认证，0为审核中，1为审核通过，2为审核未通过
@property (strong, nonatomic) NSNumber* numState;

@end
