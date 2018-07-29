//
//  MY_TTLFacePhotoTableViewCell.h
//  TogetherLu
//
//  Created by MadridLee on 2016/12/27.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_TTLFacePhotoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgvIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelDetail;

@property (nonatomic, strong) id asset;


@end
