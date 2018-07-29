//
//  BarrageView.h
//  videoTest
//
//  Created by Louie on 2017/6/20.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BarrageRenderer/BarrageRenderer.h>


@interface BarrageView : UIView <BarrageRendererDelegate>

@property (nonatomic, strong) BarrageRenderer * renderer;

@property (nonatomic, strong) NSArray * barrageArray;

//  弹幕开始
- (void)startBarrageMessage;

//  弹幕重复
- (void)repetitionBarrageMessage;

//  弹幕停止
- (void)stopBarrageMessage;

//  弹幕暂停
- (void)pauseBarrageMessage;

//  弹幕恢复
- (void)resumeBarrageMessage;

@end
