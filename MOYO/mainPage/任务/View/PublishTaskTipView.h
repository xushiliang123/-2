//
//  PublishTaskTipView.h
//  VTIME
//
//  Created by gll on 2017/12/20.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublishTaskTipView : UIView

@property(copy)void(^goToVCBlock)(NSInteger index,PublishTaskTipView * view);//   index 1:成为贵族 2：上首页 3：邀请好友

@end
