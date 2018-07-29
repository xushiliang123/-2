//
//  MY_GLOpenRedPackertView.h
//  VTIME
//
//  Created by gll on 2017/10/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_GLOpenRedPackertView : UIView

-(void)setRedViewMoney:(NSString*)money withModel:(NSDictionary*)dic;

@property(strong,nonatomic)NSString * model;
@property (strong, nonatomic) UILabel*    redGetInfo;

@property(copy,nonatomic)void(^GoToRedPacketInfoBlock)(MY_GLOpenRedPackertView * pckertView);

@end
