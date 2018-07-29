//
//  MY_XTRefuceInviteTableViewCell.h
//  VTIME
//
//  Created by tingting on 2017/10/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^HeadImgClickBlock)();
@interface MY_XTRefuceInviteTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *InviterHeadImageV;
@property (weak, nonatomic) IBOutlet UILabel *InviterName;
@property (weak, nonatomic) IBOutlet UILabel *InvitedClub;
@property (weak, nonatomic) IBOutlet UILabel *InviteStatue;
@property (nonatomic, copy) HeadImgClickBlock HeadImgBlock;  //头像点击回调

@end
