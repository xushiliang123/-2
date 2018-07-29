//
//  BlacklistTableViewCell.h
//  TogetherLu
//
//  Created by Louie on 16/12/29.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BlacklistModel;
@interface BlacklistTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView * headImageView;
@property (nonatomic, strong)UILabel * nameLabel;

@property (nonatomic, strong)UIImageView * typeImageView;
@property (nonatomic, strong)UILabel * dynamicLabel;

@property (nonatomic, strong)BlacklistModel * model;


@end
