//
//  MY_TTLVTaskTableViewCell.h
//  VTIME
//
//  Created by 听听 on 2017/12/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CheckBtnClick)(void);
@interface MY_TTLVTaskTableViewCell : UITableViewCell
@property (strong, nonatomic) UIView* viewBack;

//@property (strong, nonatomic) UIImageView* imgvIcon;

@property (strong, nonatomic) UILabel* labelTitle;

@property (strong, nonatomic) UILabel* labelDetail;

@property (strong, nonatomic) UIButton* watchBtn;

@property (strong, nonatomic) UIImageView* leftImgv;

//@property (strong, nonatomic) UIImageView* imgvHeader;

@property (strong, nonatomic) UIView* line1;

@property (strong, nonatomic) UIView* line2;

@property (assign, nonatomic) CGFloat height;
@property (copy, nonatomic) CheckBtnClick btnCheck;
-(void)showData:(id<IMessageModel>)model;

@end
