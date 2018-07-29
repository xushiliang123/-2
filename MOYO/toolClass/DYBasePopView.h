//
//  DYBasePopView.h
//  VTIME
//
//  Created by 听听 on 2018/1/16.
//  Copyright © 2018年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoLibModel.h"
@interface DYBasePopView : UIView
/** 图片url数组 */
@property (strong, nonatomic) NSArray *iconArray;
/** index 模型在数组中的下标；或者说cell的row */
@property (assign, nonatomic) NSInteger index;
/** rectArray */
@property (strong, nonatomic) NSArray<NSString *> *rectArray;

/** 视频地址  videoUrl **/
//@property (strong, nonatomic) NSArray * videoArray;



//@property (strong, nonatomic) ZFPlayerView          * playerView;
//播放器视图
//@property (nonatomic, strong) ZFPlayerControlView   * controlView;
/** 离开页面时候是否在播放 */
@property (nonatomic, assign) BOOL                    isPlaying;
@end
