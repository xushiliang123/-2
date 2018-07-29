//
//  MY_GLRedPacketView.h
//  VTIME
//
//  Created by gll on 2017/10/14.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_GLRedPacketView : UIView

@property(nonatomic, strong)NSNumber * clubId;// 俱乐部ID
@property(nonatomic, strong)NSNumber * clubPersonalNum;// 俱乐部成员数

// isSuccess 是否支付成功
@property(nonatomic, copy) void(^backClickMethod)(MY_GLRedPacketView * redPacketView ,BOOL isSuccess);



@end
