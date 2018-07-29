//
//  MyTableViewCell.h
//  TogetherLu
//
//  Created by Louie on 16/12/17.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImv;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *detaileLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *translting;

@property (weak, nonatomic) IBOutlet UIView *redBadgeView;
@property (weak, nonatomic) IBOutlet UIView *rightBedgeView;

@property (nonatomic, strong) NSIndexPath * indexPath;

- (void)showBadgeView;

- (void)hiddenBadgeView;

@end
