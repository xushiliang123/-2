//
//  MY_GLOwnInfoHeaderView.m
//  VTIME
//
//  Created by gll on 2017/9/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

/*
 * AVPlayer播放视频流程
 
 1、创建一个AVPlayerItem对象,每个AVPlayerItem对象，就是一个视频或音频
 
 2、将AVPlayerItem对象放到一个AVPlayer对象，AVPlayer对象负责视频的暂停与开启操作
 
 3、将AVPlayer放到一个AVPlayerLayer对象里，AVPlayerLayer负责视频的一个展示，他可以设置frame
 
 4、将AVPlayLayer放到某试图的layer层
 
 5、播放
 
 */


#import "MY_GLOwnInfoHeaderView.h"
#import "DYBaseView.h"
#import <AVFoundation/AVFoundation.h>


@interface MY_GLOwnInfoHeaderView()<ZFPlayerDelegate>
{
    CGRect nickRect;
    AVPlayer * player;
}

@property (strong, nonatomic) UIButton*    isPlayerBtn;//暂停播放

@property (strong, nonatomic) UIView  *    playCoverView;//灰色背景


@end

@implementation MY_GLOwnInfoHeaderView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
        
    }
    return self;
}

-(void)setupUI{
    
    CGRect rect = self.bounds;
    
    //头像
    self.headerImageView = [[UIImageView alloc]initWithFrame:rect];
//    self.headerImageView.backgroundColor = [UIColor blueColor];
    [self addSubview:self.headerImageView];
    self.headerImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *headerImageViewGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerImageViewDidClick)];
    [self.headerImageView addGestureRecognizer:headerImageViewGest];
    
    self.playCoverView = [[UIView alloc]init];
    [self addSubview:self.playCoverView];
    [self.playCoverView setBackgroundColor:[Utility colorWithHexString:@"000000" alpha:0.2]];
    [self.playCoverView mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.left.equalTo(self.headerImageView.mas_left).offset(0);
        make.right.equalTo(self.headerImageView.mas_right).offset(0);
        make.top.equalTo(self.headerImageView.mas_top).offset(0);
        make.height.equalTo(self.headerImageView.mas_height);
    }];
    
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    //  毛玻璃视图
    self.effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    //添加到要有毛玻璃特效的控件中
    self.effectView.frame = self.headerImageView.bounds;
    
    //设置模糊透明度
    self.effectView.alpha = .9f;
    
//    [self.playerView resetToPlayNewVideo:self.playerModel];


//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureMethod)];
//    [self.headerImageView addGestureRecognizer:tap];
//    
//    self.isPlayerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.playCoverView addSubview:self.isPlayerBtn];
//    [self.isPlayerBtn setContentHorizontalAlignment:(UIControlContentHorizontalAlignmentCenter)];
//    [self.isPlayerBtn addTarget:self action:@selector(isShowPlayBtnClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
//    [self.isPlayerBtn setImage:[UIImage imageNamed:@"Home_videoPlaying"] forState:(UIControlStateNormal)];
//    [self.isPlayerBtn setImage:[UIImage imageNamed:@"Home_videoPause"] forState:(UIControlStateSelected)];
//    
//    [self.isPlayerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.centerX.equalTo(self.playCoverView.mas_centerX);
//        make.centerY.equalTo(self.playCoverView.mas_centerY);
//        make.width.mas_equalTo(46);
//        make.height.mas_equalTo(46);
//    }];
//    
//    self.playCoverView.hidden = YES;
    
    //状态
    rect.size.width = 80;
    rect.size.height = 18;
    rect.origin.y = 90;
    rect.origin.x = SCREEN_WIDTH - 10 - 80;
 
    self.onlineStatus = [[MY_GLAlphaLabel alloc]init];
    self.onlineStatus.titleLabel.text = @"1分钟前";
    self.onlineStatus.bgAlpha = 0.0;
    self.onlineStatus.titleColor = @"fefefe";
    [self addSubview:self.onlineStatus];

    
    
    //认证
    rect.origin.x = 10;
    rect.origin.y = SCREEN_WIDTH- 12 - 14;
    rect.size.width = 14;
    rect.size.height = 15;
    nickRect = rect;
    self.AddVCerImgView = [[UIImageView alloc]initWithFrame:rect];
    [self addSubview:self.AddVCerImgView];
    
    //类型
    rect.origin.x = rect.origin.x + rect.size.width + 6;
    rect.size.width = 200;
    self.typeLabel = [[UILabel alloc]initWithFrame:rect];
    self.typeLabel.textColor = [Utility colorWithHexString:@"FFFFFF" alpha:1.0];
    self.typeLabel.font = [UIFont systemFontOfSize:14];
    self.typeLabel.numberOfLines = 0;
    [self addSubview:self.typeLabel];

    //昵称
    rect.origin.y = 321;
    rect.origin.x = 9;
    rect.size.height = 22;
    rect.size.width = 150;
    
    self.nickLabel = [[UILabel alloc]initWithFrame:rect];
    self.nickLabel.font = [UIFont systemFontOfSize:20];
    self.nickLabel.textColor = [Utility colorWithHexString:@"#333333" alpha:1.0f];
    [self addSubview:self.nickLabel];
    
    //vip
    rect.origin.x = rect.origin.x + rect.size.width + 10;
    rect.size.height = 15;
    rect.size.width = 35;
    
    self.vipLevelLabel = [[UILabel alloc]initWithFrame:rect];
    self.vipLevelLabel.font = [UIFont boldSystemFontOfSize:9];
    self.vipLevelLabel.backgroundColor = GOLDCOLOR;
    self.vipLevelLabel.textColor = [Utility colorWithHexString:@"FFFFFF" alpha:1.0];
    self.vipLevelLabel.clipsToBounds = YES;
    self.vipLevelLabel.textAlignment = NSTextAlignmentCenter;
    self.vipLevelLabel.layer.cornerRadius = rect.size.height * 0.5;
    [self addSubview:self.vipLevelLabel];
    
    //私聊
    rect.origin.x = SCREEN_WIDTH - 10 - 57 - 15 - 57;
    rect.origin.y = SCREEN_WIDTH - 12 - 24;
    rect.size.width = 57;
    rect.size.height = 24;
    UIFont * font = [UIFont systemFontOfSize:15];
    
    self.chatbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.chatbtn setFrame:rect];
    [self.chatbtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [self.chatbtn setTitle:@"私聊" forState:(UIControlStateNormal)];
    self.chatbtn.tag = 1100;
    [self.chatbtn setBackgroundColor:GOLDCOLOR];
    [self.chatbtn addTarget:self action:@selector(selectedUserStyleIndex2ClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    self.chatbtn.layer.cornerRadius = 12;
    [self.chatbtn.layer setMasksToBounds:YES];
    self.chatbtn.titleLabel.font = font;
    [self addSubview:self.chatbtn];
    
     //关注
    rect.origin.x = rect.origin.x + 15 + 57 ;
//    rect.origin.y = SCREEN_WIDTH - 12;
    self.attentionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.attentionBtn setFrame:rect];
    [self.attentionBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [self.attentionBtn setTitleColor:GOLDCOLOR forState:(UIControlStateSelected)];
    [self.attentionBtn setTitle:@"+关注" forState:(UIControlStateNormal)];
    [self.attentionBtn setTitle:@"已关注" forState:(UIControlStateSelected)];

    self.attentionBtn.tag = 1101;
    [self.attentionBtn setBackgroundColor:GOLDCOLOR];
    [self.attentionBtn addTarget:self action:@selector(selectedUserStyleIndex2ClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    self.attentionBtn.layer.cornerRadius = 12;
    [self.attentionBtn.layer setMasksToBounds:YES];
    self.attentionBtn.titleLabel.font = font;
    [self addSubview:self.attentionBtn];
    
    //视频认证
    rect.origin.x = SCREEN_WIDTH - 10 - 86 ;
    rect.origin.y = 64;
    rect.size.width = 86;
    rect.size.height = 20;
    
    self.videoCerLabel = [[UIImageView alloc]initWithFrame:rect];
    self.videoCerLabel.image = [UIImage imageNamed:@"icon_videoYiRenzheng"];
    [self addSubview:self.videoCerLabel];
    
}


-(void)selectedUserStyleIndex2ClickMethod:(UIButton*)sender{
    
    //私聊
    if (1100 == sender.tag ) {
        
        if (self.privateChatBlock) {
            self.privateChatBlock(sender.tag - 1100,self.model);
        }
        
    }else{
    //关注  0为关注，1为取消关注
        
        NSDictionary * dict = @{@"onkey":@(self.model.userId),@"type":@(self.model.isFollow)};
        
        [TLHTTPRequest MY_postWithBaseUrl:AttentionURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            
            if ([[data objectForKey:@"ret"] boolValue] == 0) {
                
                
                self.model.isFollow = !self.model.isFollow;
                
                self.attentionBtn.selected = (BOOL)self.model.isFollow;
                
                // 更改数据源数组
                if (self.privateChatBlock) {
                    self.privateChatBlock(sender.tag - 1100,self.model);
                }
                
                if (self.model.isFollow) {
                    //如果是关注
                    [self.attentionBtn setBackgroundColor:[UIColor clearColor]];
                    self.attentionBtn.layer.borderColor = GOLDCOLOR.CGColor;
                    self.attentionBtn.layer.borderWidth = 1.0f;
                    [LQProgressHud showMessage:@"关注成功"];
                    
                }else{
                    [self.attentionBtn setBackgroundColor:GOLDCOLOR];
                    self.attentionBtn.layer.borderColor = GOLDCOLOR.CGColor;
                    self.attentionBtn.layer.borderWidth = 1.0f;
                    [LQProgressHud showMessage:@"取消关注"];
                    
                }
                
//                [[ChatDemoHelper shareHelper] addAttentionWithUserId:[dict[@"onkey"] integerValue] nickName:model.nickName headIcon:model.headIcon];
                }
            else {
                if (dict[@"msg"]) {
                    [LQProgressHud showMessage:dict[@"msg"]];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            
        }];
    }
}

-(void)headerImageViewDidClick{
    
    PhotoLibModel * model = [[PhotoLibModel alloc]init];
    model.photoUrl = self.model.headIcon;
    
    DYBaseView *baseView = [[DYBaseView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    baseView.iconArray = @[model];
    baseView.rectArray = @[NSStringFromCGRect(CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH))];
    baseView.index = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:baseView];
    baseView.backgroundColor = [UIColor blackColor];
}

//-(void)tapGestureMethod{
//    
//    
//    if ([Utility isBlankString:self.model.indexVideo]) {
//        
//        if (!self.playCoverView.hidden) {
//            self.playCoverView.hidden = YES;
//        }
//        return;
//    }
//    
//    self.playCoverView.hidden = !self.playCoverView.hidden;
//    /*
//     ZFPlayerStateFailed,     // 播放失败
//     ZFPlayerStateBuffering,  // 缓冲中
//     ZFPlayerStatePlaying,    // 播放中
//     ZFPlayerStateStopped,    // 停止播放
//     ZFPlayerStatePause       // 暂停播放
//     */
//    switch ([self.playerView state]) {
//        case ZFPlayerStatePlaying://正在播放
//        {
//            self.isPlayerBtn.selected = NO;
//            
//            break;
//        }
//        case ZFPlayerStatePause://暂停播放
//        {
//            self.isPlayerBtn.selected = YES;
//            break;
//        }
//        case ZFPlayerStateStopped://停止播放
//        {
//            self.isPlayerBtn.selected = YES;
//            break;
//        }
//        default:
//            
//            [self.playerView play];
//            self.isPlayerBtn.selected = YES;
//            break;
//    }
//}
//
//
//////播放或暂停
//-(void)isShowPlayBtnClickMethod:(UIButton*)sender{
//    
//    
//    if (!self.model.indexVideo || [self.model.indexVideo length] == 0) return;
//    
//    switch ([self.playerView state]) {
//        case ZFPlayerStatePlaying://正在播放
//        {
//            [self.playerView pause];
//            sender.selected = YES;
//            
//            break;
//        }
//        case ZFPlayerStatePause://暂停播放
//        {
//            [self.playerView play];
//
//            sender.selected = NO;
//            
//            break;
//        }
//        case ZFPlayerStateStopped://停止播放
//        {
//            [self.playerView play];
//            sender.selected = NO;
//            
//            break;
//        }
//        default:
//            [self.playerView play];
//            sender.selected = NO;
//            break;
//    }
//}


-(void)setModel:(MY_LYPersonInfoModel *)model{
    
    _model = model;
    
    // 头像
    if (![Utility isBlankString:_model.headIcon]) {
        
        NSURL * url = [NSURL URLWithString:_model.headIcon];
        
        [self.headerImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"占位图"]];
    }

    if ([_model.indexVideo length]) {
        
        self.playCoverView.hidden = YES;
        if (self.playerView.state != ZFPlayerStatePlaying) {
            
            if (![self.effectView superview]) {
                
                [self.headerImageView addSubview:self.effectView];

                [self.effectView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.mas_equalTo(UIEdgeInsetsZero);
                }];
            }
            
            // 取出字典中的第一视频URL
            NSURL *videoURL = [NSURL URLWithString:_model.indexVideo];
            ZFPlayerModel  *playerModel = [[ZFPlayerModel alloc] init];
            playerModel.videoURL         = videoURL;
            playerModel.nickName         = _model.nickName;
            playerModel.userId           = @(_model.userId);
            playerModel.placeholderImageURLString = _model.indexIcon;
            //    playerModel.scrollView       = weakSelf.tableView;
            playerModel.indexPath        = [NSIndexPath indexPathWithIndex:0];
            playerModel.fatherView = self.headerImageView;
            
            if (self.model.videoWidth > _model.videoHeight) {
                playerModel.isWideVideo = YES;
            }
            else
            {
                playerModel.isWideVideo = NO;
            }
            
//            self.playerModel = playerModel;
            
            // 设置播放控制层和model
            [self.playerView playerControlView:nil playerModel:playerModel];
            
            // 自动播放
            [self.playerView autoPlayTheVideo];
        
        }
    }else{
        self.playCoverView.hidden = NO;

    }

    // 昵称
    if (![Utility isBlankString:_model.nickName]) {
        self.nickLabel.text = _model.nickName;
    }else{
        self.nickLabel.text = @"暂无昵称";
    }
    CGSize nicksize = [Utility stringSizeWithString:self.nickLabel.text textSize:20 width:0 height:22];
    CGRect nickrect = self.nickLabel.frame;
    nickrect.size.width = nicksize.width + 4;
    self.nickLabel.frame = nickrect;
    
    if (_model.nobleLevel) {//VIP
        
        self.nickLabel.textColor = GOLDCOLOR;
    }else{
        self.nickLabel.textColor = [UIColor whiteColor];
    }
    
    //如果有类型 则显示类型 如果没有 昵称在最下面
    //是否认证
    if (_model.isAuthen) {
    
        self.AddVCerImgView.hidden = NO;
        [self.AddVCerImgView setImage:[UIImage imageNamed:@"home_addV"]];
    }else{

        self.AddVCerImgView.hidden = YES;

        CGRect rect = self.nickLabel.frame;
        rect.origin.y = SCREEN_WIDTH - 12 - 17;
        self.nickLabel.frame = rect;
    }
    
    if (![Utility isBlankString:_model.certificationName]) {
    
        self.typeLabel.text = [NSString stringWithFormat:@"%@", _model.certificationName];
        
        CGSize typesize = [Utility stringSizeWithString:self.typeLabel.text textSize:14 width:200 height:0];
        
        if(typesize.height > 30)
        {
            CGRect rect = self.typeLabel.frame;
            rect.origin.y = rect.origin.y - typesize.height/2;
            rect.size.height = typesize.height;
            self.typeLabel.frame = rect;
            
            CGRect rectnick = self.nickLabel.frame;
            CGRect rectvip = self.vipLevelLabel.frame;
            CGRect rectCer = self.AddVCerImgView.frame;
            
            rectnick.origin.y = rectnick.origin.y - typesize.height/2;
            rectvip.origin.y = rectvip.origin.y - typesize.height/2;
            rectCer.origin.y = rectCer.origin.y - typesize.height/2;
            
            self.nickLabel.frame = rectnick;
            self.vipLevelLabel.frame = rectvip;
            self.AddVCerImgView.frame = rectCer;
            
        }
        
        // @"认证：模特,歌手";
    }else{
        self.typeLabel.text = @"";
    }
    
    //vip等级
//    if (_model.consumptionLevel > 0) {
    
        //        [self.imgvVipLevel setImage:[UIImage imageNamed:@"home_addV"]];
        self.vipLevelLabel.hidden = NO;
    
//    NSString * vipLevelStr = [NSString stringWithFormat:@"VIP%td",_model.consumptionLevel];
    NSString * vipLevelStr  = GetVipLevel(_model.consumptionLevel);
    self.vipLevelLabel.text = vipLevelStr;
    
    CGSize levelSize = [vipLevelStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 10) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:9]} context:nil].size;
    
    CGRect rect = self.vipLevelLabel.frame;
    rect.origin.y = self.nickLabel.frame.origin.y + 4;
    rect.origin.x = CGRectGetMaxX(self.nickLabel.frame) + 8;
    rect.size.width = levelSize.width + 10;
    self.vipLevelLabel.frame = rect;
        
    //在线状态
    if (_model.lastLoginTime > 0) {
        
        self.onlineStatus.hidden = NO;
        
        NSString * timeStr = [Utility onLineShowDateString:_model.lastLoginTime];
        
        CGFloat StatusWidth = [self.onlineStatus setViewTitle:timeStr withFont:[UIFont systemFontOfSize:12]];
        
        CGRect onlineStatusRect = self.onlineStatus.frame;
        onlineStatusRect.size.width = StatusWidth;
        onlineStatusRect.origin.x = SCREEN_WIDTH - 6 - StatusWidth;
        onlineStatusRect.size.height = 18;
        onlineStatusRect.origin.y = 90;
        self.onlineStatus.frame = onlineStatusRect;
        
    }else{
        self.onlineStatus.hidden = YES;
    }
    
    
    //视频认证
    if (_model.isVideoVerify) {
        self.videoCerLabel.image = [UIImage imageNamed:@"icon_homeVideoYiRenZheng"];
//        self.videoCerLabel.hidden = NO;
    }else{
        self.videoCerLabel.image = [UIImage imageNamed:@"icon_homeWeideoYiRenZheng"];
//        self.videoCerLabel.hidden = YES;
//        CGRect onlineStatusRect = self.onlineStatus.frame;
//        onlineStatusRect.origin.y = 64;
//        self.onlineStatus.frame = onlineStatusRect;
    }
    
    //判断是不是自己 如果是隐藏关注和私聊
    if (_model.userId == [USERID integerValue]) {
        
        self.chatbtn.hidden = YES;
        self.attentionBtn.hidden = YES;
    }else{
        self.chatbtn.hidden = NO;
        self.attentionBtn.hidden = NO;
    }
    
    
    if (_model.isFollow) {
        
        self.attentionBtn.selected = YES;
         [self.attentionBtn setBackgroundColor:[UIColor clearColor]];
        self.attentionBtn.layer.borderColor = GOLDCOLOR.CGColor;
        self.attentionBtn.layer.borderWidth = 1.0f;
        
    }else{
        self.attentionBtn.selected = NO;
    }
}

#pragma mark - - 播放视频

//- (UIStatusBarStyle)preferredStatusBarStyle {
//    // 这里设置横竖屏不同颜色的statusbar
//    if (ZFPlayerShared.isLandscape) {
//        return UIStatusBarStyleLightContent;
//    }
//    return UIStatusBarStyleLightContent;
//}
//
//- (BOOL)prefersStatusBarHidden {
//    return ZFPlayerShared.isStatusBarHidden;
//}

//- (ZFPlayerControlView *)controlView {
//    if (!_controlView) {
////        __weak typeof(self) wSelf = self;
//        _controlView = [[ZFPlayerControlView alloc] init];
//        
//        _controlView.ShareAndAboutBlock = ^(BOOL isShare, NSIndexPath *indexPath) {
//            
////            if (!USERKEY) {
////                [wSelf loginOut];
////                return;
////            }
////            if (isShare) {
////                [wSelf rightBarButtonClick];
////            }
////            else {
////                [wSelf aboutOrderWithModel];
////            }
//        };
//    }
//    return _controlView;
//}

- (ZFPlayerView *)playerView {
    if (!_playerView) {
        _playerView = [[ZFPlayerView alloc] init];
        
        /**********************************************************
         *   // 指定控制层(可自定义)
         *   // ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
         *   // 设置控制层和播放模型
         *   // 控制层传nil，默认使用ZFPlayerControlView(如自定义可传自定义的控制层)
         *   // 等效于 [_playerView playerModel:self.playerModel];
         **********************************************************/
//        [_playerView playerControlView:nil playerModel:self.playerModel];
        
        // 设置代理
        _playerView.delegate = self;
        
        //（可选设置）可以设置视频的填充模式，内部设置默认（ZFPlayerLayerGravityResizeAspect：等比例填充，直到一个维度到达区域边界）
         _playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspectFill;
        
        // 打开下载功能（默认没有这个功能）
        _playerView.hasDownload    = NO;
        
        // 打开预览图
        _playerView.hasPreviewView = YES;
        
    }
    return _playerView;
}

//  视频参数初始化
//- (ZFPlayerModel *)playerModel {
//    if (!_playerModel) {
//        _playerModel = [[ZFPlayerModel alloc] init];
//        _playerModel.videoURL = [NSURL URLWithString:self.model.indexVideo];
//        _playerModel.placeholderImageURLString = self.model.indexIcon;
//        if (self.model.videoWidth > self.model.videoHeight) {
//            _playerModel.isWideVideo = YES;
//        }
//        else
//        {
//            _playerModel.isWideVideo = NO;
//        }
//        _playerModel.fatherView = self.headerImageView;
//        
//    }
//    return _playerModel;
//}

#pragma mark #### ZFPlayerDelegate
- (void)zf_playerBackAction {
    
    if (self.playBackBlock) {
        
//        [self.playerView stop]
        
        self.playBackBlock();
    
    }
}
//- (void)zf_playerControlViewWillShow:(UIView *)controlView isFullscreen:(BOOL)fullscreen {
//    //    self.backBtn.hidden = YES;
//    [UIView animateWithDuration:0.25 animations:^{
//        //        self.backBtn.alpha = 0;
//    }];
//}
//
- (void)zf_playerControlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen {
    //    self.backBtn.hidden = fullscreen;
    [UIView animateWithDuration:0.25 animations:^{
        //        self.backBtn.alpha = !fullscreen;
    }];
}

- (void)dealloc{
    [self.playerView resetPlayer];
    [self.playerView stopPlayWhileCellNotVisable];
    self.playerView = nil;
    NSLog(@"MY_GLOwnInfoHeaderView --dealloc");
}


@end
