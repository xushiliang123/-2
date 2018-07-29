//
//  BarrageView.m
//  videoTest
//
//  Created by Louie on 2017/6/20.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "BarrageView.h"
#import "NSSafeObject.h"
#import "BarrageModel.h"

@implementation BarrageView 
{
    
    NSTimer * _timer;
    NSInteger _index;
    NSDate * _startTime;
    NSTimeInterval _predictedTime; //快进时间
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}


- (void)setUI
{
    _index = 0;
    _predictedTime = 0.0f;
    [self initBarrageRenderer];
}

- (void)initBarrageRenderer
{
    _renderer = [[BarrageRenderer alloc]init];
    _renderer.delegate = self;
    _renderer.redisplay = YES;
    [self addSubview:_renderer.view];
    
//    _renderer.canvasMargin = UIEdgeInsetsMake(10, 10, 10, 10);
    // 若想为弹幕增加点击功能, 请添加此句话, 并在Descriptor中注入行为
//    _renderer.view.userInteractionEnabled = NO;
    [self sendSubviewToBack:_renderer.view];
}


#pragma mark - 弹幕操作
//  弹幕开始
- (void)startBarrageMessage
{
    _startTime = [NSDate date];
    [_renderer start];
}

//  弹幕重复
- (void)repetitionBarrageMessage
{
    [self loadBarrageMessageWithArray:_barrageArray];
    _startTime = [NSDate date];
    [_renderer start];
}

//  弹幕停止
- (void)stopBarrageMessage
{
    [_renderer stop];
}

//  弹幕暂停
- (void)pauseBarrageMessage
{
    [_renderer pause];
}

//  弹幕恢复
- (void)resumeBarrageMessage
{
    [_renderer start];
}



#pragma mark - 弹幕描述符生产方法
/// 生成精灵描述 - 延时文字弹幕
- (BarrageDescriptor *)walkTextSpriteDescriptorWithDelay:(NSTimeInterval)delay withModel:(BarrageModel *)model
{
    UIColor * textColor = nil;
    if (model.barageColor) {
        textColor = [Utility colorWithHexString:model.barageColor alpha:1.0];
    }
    else {
        textColor = [UIColor whiteColor];
    }
    BarrageDescriptor * descriptor = [[BarrageDescriptor alloc]init];
    descriptor.spriteName = NSStringFromClass([BarrageWalkTextSprite class]);
    descriptor.params[@"text"] = model.comment;
    descriptor.params[@"textColor"] = textColor;
    descriptor.params[@"speed"] = @(100 * (double)random()/RAND_MAX+50);
    descriptor.params[@"direction"] = @(1);
    CGFloat time = model.showTime.floatValue / 1000;
    descriptor.params[@"delay"] = @(time);
    return descriptor;
}



#pragma mark - 数据
- (void)setBarrageArray:(NSArray *)barrageArray
{
    _barrageArray = barrageArray;
    
    [self loadBarrageMessageWithArray:_barrageArray];
}


#pragma mark - 加载弹幕数据
- (void)loadBarrageMessageWithArray:(NSArray *)array
{
    NSInteger const number = array.count;
    NSMutableArray * descriptors = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < number; i++) {
        [descriptors addObject:[self walkTextSpriteDescriptorWithDelay:i*2+1 withModel:_barrageArray[i]]];
    }
    [_renderer load:descriptors];
}



- (void)dealloc
{
    [_renderer stop];
}

#pragma mark - BarrageRendererDelegate
- (NSTimeInterval)timeForBarrageRenderer:(BarrageRenderer *)renderer
{
    NSTimeInterval interval = [[NSDate date]timeIntervalSinceDate:_startTime];
    interval += _predictedTime;
    return interval;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
