//
//  MY_TTLEditInfoViewController.h
//  VTIME
//
//  Created by MadridLee on 2017/9/14.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "BaseViewController.h"
#import "MY_TTLMeModel.h"
typedef enum : NSUInteger {
    
    cancelBtnPicker = 20000,
    confirmBtnPicker,
    
} pickerBtnTag;

@interface MY_TTLEditInfoViewController : BaseViewController

@property (strong, nonatomic) MY_TTLMeModel* model;


@end
