//
//  MY_TTLSendMessageRedEnvelopView.h
//  VTIME
//
//  Created by 听听 on 2017/12/4.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_TTLSendMessageRedEnvelopView : UIView
@property (nonatomic, copy)NSString * bigTitle;
@property (nonatomic, copy)NSString * detailTitle;

@property (nonatomic, copy) void(^affirmBtnblock)(NSInteger price);

//@property (nonatomic, copy) void(^GetNobilityBlock)(NSInteger index);

- (void)show;
@end
