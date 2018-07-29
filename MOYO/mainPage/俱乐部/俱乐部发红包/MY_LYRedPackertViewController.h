//
//  RedPackertViewController.h
//  VTIME
//
//  Created by gll on 2017/10/30.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_LYRedPackertViewController : BaseViewController

@property(nonatomic, strong)NSNumber * clubId;// 俱乐部ID
@property(nonatomic, strong)NSNumber * clubPersonalNum;// 俱乐部成员数
@property(nonatomic, strong)NSNumber * clubMoneyNum;// 俱乐部金额数

// isSuccess 是否支付成功
@property(nonatomic, copy) void(^backClickMethod)(MY_LYRedPackertViewController * redPacketVC ,BOOL isSuccess);

@end
