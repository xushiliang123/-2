//
//  MessageSystemCell.h
//  TogetherLu
//
//  Created by Louie on 2017/5/23.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageSystemCell : UITableViewCell

@property (nonatomic, strong) UILabel * grayLabel;

@property (strong, nonatomic) id<IMessageModel> model;

@property (copy, nonatomic) void (^blockKefu)();
@property (copy, nonatomic) void (^blockOrder)(NSNumber*, NSNumber*);

@end
