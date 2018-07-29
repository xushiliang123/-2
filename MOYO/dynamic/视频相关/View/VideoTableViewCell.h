//
//  VideoTableViewCell.h
//  videoTest
//
//  Created by Louie on 2017/6/14.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFPlayer.h"
#import "ParallelButton.h"
#import "VideoResolutionModel.h"

@class VideoTableViewCell;
@protocol VideoTableViewCellDelegate <NSObject>
- (void)VideoTableViewCellHongBaoBtnClickWithCell:(VideoTableViewCell*)cell withModel:(VideoResolutionModel*)model;
@end



@interface VideoTableViewCell : UITableViewCell


@property (nonatomic, assign) BOOL isMyDynamic;


@property (strong, nonatomic) UIButton             *avatarBtn;
@property (strong, nonatomic) UIImageView          *VimageView;
@property (strong, nonatomic) UILabel              *nickLabel;
@property (strong, nonatomic) UIButton             *attentionBtn;
@property (strong, nonatomic) UILabel              *dynamicLabel;
@property (strong, nonatomic) UIImageView          *picView;
@property (strong, nonatomic) UIButton             *playBtn;
@property (strong, nonatomic) UILabel              *timeLabel;

@property (nonatomic, strong) ParallelButton       *zanBtn;             //  点赞
@property (nonatomic, strong) ParallelButton       *pageViewBtn;        //  浏览量
@property (nonatomic, strong) ParallelButton       *privateChat;        //  私聊
@property (nonatomic, strong) ParallelButton       *hongBaoChat;        //  发红包

@property (nonatomic, strong) UIVisualEffectView   * effectView;

@property (nonatomic, strong) VideoResolutionModel * model;
@property (nonatomic, strong) MY_LYPersonInfoModel *personalModel;
@property (nonatomic, strong) id <VideoTableViewCellDelegate> delegate;
/** 播放按钮block */
@property (nonatomic, copy  ) void(^playBlock)(UIButton *);

/** 播放按钮block */
@property (nonatomic, copy  ) void(^ViewLargeImageBlock)(VideoResolutionModel * model, CGFloat cellOriginY);


@end
