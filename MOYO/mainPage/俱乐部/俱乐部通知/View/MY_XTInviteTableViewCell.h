//
//  MY_XTInviteTableViewCell.h
//  VTIME
//
//  Created by tingting on 2017/10/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^HeadImgClickBlock)();
@interface MY_XTInviteTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *InviterHeadImg;
@property (weak, nonatomic) IBOutlet UILabel *InviterName;
@property (weak, nonatomic) IBOutlet UILabel *InvitedClub;
@property (weak, nonatomic) IBOutlet UIButton *AgreeBtn;
@property (weak, nonatomic) IBOutlet UIButton *DisAgreeBtn;
@property (nonatomic, copy) HeadImgClickBlock HeadImgBlock;  //头像点击回调
@end
