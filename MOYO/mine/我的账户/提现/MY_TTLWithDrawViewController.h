//
//  MY_TTLWithDrawViewController.h
//  TogetherLu
//
//  Created by MadridLee on 2017/4/7.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "BaseViewController.h"


typedef enum : NSUInteger {
    
    cancelBtnPicker = 20000,
    confirmBtnPicker,
    
} pickerBtnTag;

@interface MY_TTLWithDrawViewController : BaseViewController

@property (strong, nonatomic) NSString* strName;        //户名

@property (strong, nonatomic) NSString* phoneNumber;    //手机号

@property (copy, nonatomic) void (^blockState)(NSString* ,NSString *);

@end
