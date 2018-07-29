//
//  TimePickerView.h
//  VTIME
//
//  Created by Allen on 2018/1/26.
//  Copyright © 2018年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimePickerView : UIView

@property (nonatomic , copy)void (^timeBlbck)(NSString *timeString, NSString *showString);

- (void)show;

@end
