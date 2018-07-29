//
//  MY_LLSingleChatRedPacketView.h
//  VTIME
//
//  Created by 听听 on 2017/11/16.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, RedPacketViewType) {
    RedPacketVChat= 1 << 0,          //  聊天小红包
    RedPacketVDynamic = 1 << 1,       //动态发红包
};
@class MY_LLSingleChatRedPacketView;
@protocol MY_LLChatRedPacketViewDelegate  <NSObject>
@optional
- (void)paySucessForChatRedPacketView:(MY_LLSingleChatRedPacketView*)view withPrice:(NSString*)price; //支付成功回调
- (void)payFailForChatRedPacketView:(MY_LLSingleChatRedPacketView*)view;   //支付失败回调
@end

@interface MY_LLSingleChatRedPacketView : UIView
@property (nonatomic, copy)NSString * bigTitle;
@property (nonatomic, copy)NSString * detailTitle;
@property (nonatomic, weak)id <MY_LLChatRedPacketViewDelegate> delegate;
@property (nonatomic, strong) NSString * userId;
@property (nonatomic, assign) NSInteger payType;
@property (nonatomic, strong) NSString * did; //动态Id
@property (nonatomic, assign)RedPacketViewType redPacketType;
@property (nonatomic, copy) void(^affirmBtnblock)(NSInteger price);

@property (nonatomic, copy) void(^GetNobilityBlock)(NSInteger index);

- (void)show;


@end
