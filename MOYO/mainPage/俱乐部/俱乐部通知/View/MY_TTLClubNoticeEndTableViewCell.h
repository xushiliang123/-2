//
//  MY_TTLClubNoticeEndTableViewCell.h
//  VTIME
//
//  Created by MadridLee on 2017/10/13.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^HeadImgClickBlock)();
@interface MY_TTLClubNoticeEndTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImgv;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *clubLabel;
@property (weak, nonatomic) IBOutlet UILabel *ownerLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (nonatomic, copy) HeadImgClickBlock HeadImgBlock;  //头像点击回调

@end
