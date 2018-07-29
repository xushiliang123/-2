//
//  MY_TTLSelfCenterViewController.h
//  VTIME
//
//  Created by MadridLee on 2017/9/7.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "ViewController.h"

@protocol GetifpayattentionDelegate  <NSObject>
@optional
- (void)GetifpayattentionWithStatus:(BOOL)payattention; //是否关注
@end

@interface MY_TTLSelfCenterViewController : BaseViewController

@property (strong,nonatomic)NSString * userID;

@property (nonatomic, weak)id <GetifpayattentionDelegate> delegate;

@end
