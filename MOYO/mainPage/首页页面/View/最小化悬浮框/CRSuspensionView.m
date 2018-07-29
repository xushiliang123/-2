//
//  CRSuspensionView.m
//  TogetherLu
//
//  Created by Louie on 2017/7/15.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "CRSuspensionView.h"
//#import "ChatRoomHelper.h"
#import "MY_TTLClubChatViewController.h"
#import "MY_TTLNewActiveViewController.h"
//#import "UIView+MY_LLCircleAnimation.h"


NSString *const CRShowSuspensionView   = @"CRShowSuspensionView";         // 显示
NSString *const CRRemoveSuspensionView = @"CRRemoveSuspensionView";       // 隐藏
NSString *const CRLeaveChannelSucceed  = @"CRLeaveChannelSucceed";        // 退出登录成功


static long step;


@interface CRSuspensionView () // <ChatRoomDelegate>
{
    BOOL _isAnimate;
}
@property (nonatomic, strong) UIView      * grayBgView;     //  灰色背景
@property (nonatomic, strong) UIImageView * CRHeadIcon;     //  聊天室头像
@property (nonatomic, strong) UILabel     * CRNameLabel;    //  聊天室名称
//@property (nonatomic, strong) UILabel     * CRRoomIdLabel;  //  聊天室id
//@property (nonatomic, strong) UIButton    * CRRemoveBtn;    //  隐藏按钮

/** 动画 */
//@property (nonatomic, strong) UIView * animationSuperView;

//@property (nonatomic, strong) UIView * animationView;


@end



@implementation CRSuspensionView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        NSNotificationCenter * not = [NSNotificationCenter defaultCenter];
        
//        [not addObserver:self selector:@selector(removeSuspensionView:) name:CRRemoveSuspensionView object:nil];

        
        [self setUI];
        self.draggable = NO;
    }
    return self;
}

- (void)setUI {
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushChatRoomBtnClick)];
    [self addGestureRecognizer:tap];
    self.backgroundColor = [UIColor clearColor];
//    [ChatRoomHelper shareHelper].delegate = self;
    
//  背景
    self.grayBgView = [[UIView alloc] init];
//    self.grayBgView.alpha = 0.4;
    self.grayBgView.backgroundColor = GOLDCOLOR;
    self.grayBgView.layer.masksToBounds = YES;
    self.grayBgView.layer.cornerRadius = 15;
    [self addSubview:self.grayBgView];
    
    [self.grayBgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.mas_top).mas_offset(0);
        make.bottom.equalTo(self.mas_bottom).mas_offset(0);
        make.left.equalTo(self.mas_left).mas_offset(0);
        make.right.equalTo(self.mas_right).mas_offset(0);
        
    }];
    
//  头像
    self.CRHeadIcon = [[UIImageView alloc] init];
    self.CRHeadIcon.layer.masksToBounds = YES;
    self.CRHeadIcon.layer.cornerRadius = 13;
    [self addSubview:self.CRHeadIcon];
    self.CRHeadIcon.userInteractionEnabled = YES;
    [self.CRHeadIcon setImage:[UIImage imageNamed:@"vLogo"]];
    [self.CRHeadIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).mas_offset(3);
        make.top.mas_equalTo(2.5);
        make.height.width.mas_equalTo(26);
    }];
    
    //  未读消息
    self.CRUnReadCount = [[UILabel alloc] init];
    self.CRUnReadCount.layer.masksToBounds = YES;
    self.CRUnReadCount.layer.cornerRadius = 13;
    [self addSubview:self.CRUnReadCount];
    self.CRUnReadCount.userInteractionEnabled = YES;
    self.CRUnReadCount.textAlignment = NSTextAlignmentCenter;
    self.CRUnReadCount.textColor = [UIColor whiteColor];
    self.CRUnReadCount.backgroundColor = [UIColor redColor];
    self.CRUnReadCount.font = [UIFont systemFontOfSize:13];
    [self.CRUnReadCount mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.mas_right).mas_offset(-3);
        make.top.mas_equalTo(2.5);
        make.height.width.mas_equalTo(26);
    }];
    self.CRUnReadCount.hidden = YES;

//  房间名称
    self.CRNameLabel = [[UILabel alloc] init];
    self.CRNameLabel.font = [UIFont systemFontOfSize:12];
    self.CRNameLabel.textColor = [UIColor whiteColor];
    self.CRNameLabel.backgroundColor = [UIColor clearColor];

    [self addSubview:self.CRNameLabel];
    
    [self.CRNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_top).mas_offset(0);
        make.bottom.equalTo(self.mas_bottom).mas_offset(0);

        make.left.equalTo(self.CRHeadIcon.mas_right).mas_offset(8);
        make.height.mas_offset(31);
//        make.right.equalTo(self.CRRemoveBtn.mas_left).mas_offset(-5);
    }];
    
}


- (void)setModel:(MY_GLClubModel *)model {
    _model = model;
    
    [self.CRHeadIcon sd_setImageWithURL:[NSURL URLWithString:_model.roomHeadIcon] placeholderImage:[UIImage imageNamed:@"vLogo"] options:SDWebImageAllowInvalidSSLCertificates];
    
//    self.CRNameLabel.text = model.roomName;
    
    if (![Utility isBlankString:_model.textMss]) {
        self.CRNameLabel.text = nil;
        self.CRNameLabel.attributedText = [[EaseEmotionEscape sharedInstance] attStringFromTextForChatting:_model.textMss textFont:self.CRNameLabel.font];;
    }else{
        self.CRNameLabel.attributedText = nil;
        self.CRNameLabel.text = @"畅聊无边界~";
    }
    
//    CGFloat maxWidth = SCREEN_WIDTH - (52 + 14 + 7);
//    if (size.width >= maxWidth) {
//        size.width = maxWidth - 52;
//    }
    
    
    [self.CRNameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo([_model.textWidth integerValue]);
        
    }];
    
    [self.grayBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.width.mas_equalTo([_model.textWidth integerValue] + 2 + 46);
        
    }];
}


- (void)removeSuspensionView:(NSNotification *)not {
    
    if ([not.object boolValue]) {
        
        [self removeAllFromViewAndleaveChannel];
    }
    else {
        [self removeAllFromView];
    }
    
}

//  移除最小化
- (void)removeAllFromView {
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    for (UIView * view in [window subviews]) {
        
        if ([view isKindOfClass:[CRSuspensionView class]]) {
            [view removeFromSuperview];
        }
    }
}


//  移除最小化且断开连接
- (void)removeAllFromViewAndleaveChannel {
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    for (UIView * view in [window subviews]) {
        
        if ([view isKindOfClass:[CRSuspensionView class]]) {
            [view removeFromSuperview];
            
            NSString * roomId = [NSString stringWithFormat:@"%@", self.model.roomId];
            
//            [[ChatRoomHelper shareHelper] leaveChannelWithChannelId:roomId groupId:self.model.roomGroupId completion:^(EMError *aError) {
//                if (!aError) {
            
//                    [[NSNotificationCenter defaultCenter] postNotificationName:CRLeaveChannelSucceed object:nil];
//                }
//            }];
        }
    }
}


//- (void)gainSpeakersTotalVolume:(NSInteger)totalVolume toUsers:(NSArray<AgoraRtcAudioVolumeInfo *> *)aUsers {
//
//    if (totalVolume > 2) {
////        [self startAnimate];
//        step++;
//
//        if (step % 5 == 0) {
//
//            [self.animationView showCircleAnimationLayerWithColor:[Utility colorWithHexString:@"#23a4ff" alpha:0.6] andScale:2.0];
//        }
//    }
//}

/*
- (void)startAnimate {
    
    _isAnimate = YES;

    [UIView animateKeyframesWithDuration:2 delay:0 options:0 animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1.5 animations:^{
            
            self.oneImageView.transform = CGAffineTransformMakeScale(1.3, 1.3);
            
            self.oneImageView.alpha = 0;
            
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:1.5 animations:^{
            
            self.twoImageView.transform = CGAffineTransformMakeScale(1.3, 1.3);
            
            self.twoImageView.alpha = 0;
        }];
        
    } completion:^(BOOL finished) {
        
        _isAnimate = NO;
        
        self.oneImageView.transform = CGAffineTransformIdentity;
        self.twoImageView.transform = CGAffineTransformIdentity;
        self.oneImageView.alpha = 1;
        self.twoImageView.alpha = 1;
    }];
}
*/

//  点击跳转世界频道
- (void)pushChatRoomBtnClick {
    
    [self removeAllFromView];
    
    if (self.GotoWordChannelBlock) {
        self.GotoWordChannelBlock();
    }
}

- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(BaseNavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

//  判断是否存在最小化
+ (BOOL)isSuspensionView {
    
	UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    for (UIView * view in [window subviews]) {
        
        if ([view isKindOfClass:[CRSuspensionView class]]) {
            return YES;
        }
    }
    return NO;
}



- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
