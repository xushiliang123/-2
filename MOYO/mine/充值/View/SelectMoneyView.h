//
//  SelectMoneyView.h
//  TogetherLu
//
//  Created by gll on 2017/4/8.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayTextField.h"

@interface SelectMoneyView : UITableViewCell

//@property (nonatomic,copy) void(^PayMoneyBlock)(SelectMoneyView * cell,UIButton * sender);
@property (strong , nonatomic)PayTextField * moneyTextField;
@property (strong, nonatomic)NSString * payMoneyString;

@end
