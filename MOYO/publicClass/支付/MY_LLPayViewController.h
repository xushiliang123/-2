//
//  MY_LLPayViewController.h
//  VTIME
//
//  Created by Louie on 2017/9/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "BaseViewController.h"
@class MY_LLPayViewController;

typedef NS_OPTIONS(NSInteger, RedPacketType) {
    RedPacket_sayHolle = 1 << 0,      //  招呼红包
    RedPacket_gold = 1 << 1,          //  黄金包
    RedPacket_platina = 1 << 2,       //  白金包
    RedPacket_blackGold = 1<< 3,      //  黑金包
    RedPacket_dashang = 1<< 4,      //  黑金包
};
typedef NS_OPTIONS(NSInteger, RedPacketSingleType) {
    RedPacketSayHolle = 1 << 0,      //  招呼红包
    RedPacketSM = 1 << 1,          //  聊天小红包
    RedPacketDynamic = 1 << 2,       //动态发红包
    RedPacketRenwu = 1 << 3,       //任务红包
};

@protocol MY_LLPayViewControllerDelegate  <NSObject>
@optional
- (void)paySucessForViewController:(MY_LLPayViewController*)vc withPrice:(NSString*)price; //支付成功回调
- (void)payFailForViewController:(MY_LLPayViewController*)vc;   //支付失败回调
@end

@interface MY_LLPayViewController : BaseViewController

@property (nonatomic, strong) NSString * headIconStr;
@property (nonatomic, strong) NSString * nickName;
@property (nonatomic, assign) RedPacketType redType;
@property (nonatomic, assign)RedPacketSingleType redSingleType;

@property (nonatomic, strong) NSString * userId;
@property (nonatomic, assign) NSInteger payType;  
@property (nonatomic, strong) NSString * price;
@property (nonatomic, strong) NSString * did; //动态Id
@property (nonatomic, strong) NSString * pushfrom;

@property (nonatomic,strong) NSMutableDictionary *dic;
@property (nonatomic,strong) NSMutableDictionary *renwuDic;

@property (nonatomic, strong) void(^RedPacketPayBlock)(void);

@property (nonatomic, weak)id <MY_LLPayViewControllerDelegate> delegate;
@end
