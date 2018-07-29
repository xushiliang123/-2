//
//  MY_LLChatRedPacketView.h
//  VTIME
//
//  Created by Louie on 2017/9/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MY_LLChatRedPacketView;
@protocol MY_LLChatRedPacketSayHWViewDelegate  <NSObject>
@optional
- (void)paySucessForSayHellowRedPacketView:(MY_LLChatRedPacketView*)view withPrice:(NSString*)price; //支付成功回调
- (void)payFailForSayHellowRedPacketView:(MY_LLChatRedPacketView*)view;   //支付失败回调
@end

@interface MY_LLChatRedPacketView : UIView
@property (nonatomic, copy)NSString * bigTitle;
@property (nonatomic, copy)NSString * detailTitle;
@property (nonatomic, strong)NSString * userId;
@property (nonatomic, strong)MY_LYPersonInfoModel *model;
@property (nonatomic, weak)id <MY_LLChatRedPacketSayHWViewDelegate> delegate;
@property (nonatomic, copy) void(^affirmBtnblock)(NSInteger price);

@property (nonatomic, copy) void(^GetNobilityBlock)(NSInteger index);

- (void)show;


@end
