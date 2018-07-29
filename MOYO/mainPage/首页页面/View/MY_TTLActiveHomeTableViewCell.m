//
//  MY_TTLActiveHomeTableViewCell.m
//  VTIME
//
//  Created by MadridLee on 2017/9/7.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLActiveHomeTableViewCell.h"
#import "UIView+WebVideoCache.h"

@interface MY_TTLActiveHomeTableViewCell()<JPVideoPlayerDelegate,JPVideoPlayerManagerDelegate>
{
    BOOL _isShowPlayBtn;
}

@end
@implementation MY_TTLActiveHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self uiConfig];
        
    }
    return self;
}

-(void)uiConfig
{
    self.backView = [[UIView alloc]init];
//    self.backView.layer.masksToBounds = YES;
    self.backView.layer.cornerRadius  = 7;
    self.backView.backgroundColor = [UIColor whiteColor];
    self.backView.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.backView.layer.shadowOffset = CGSizeMake(4,4);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.backView.layer.shadowOpacity = 0.2;//阴影透明度，默认0
    self.backView.layer.shadowRadius = 4;//阴影半径，默认3
    
    [self.contentView addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(5);
        make.right.equalTo(self.contentView.mas_right).offset(-5);
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.height.mas_equalTo(410);
    }];
    
    
    self.imgvHead = [[UIImageView alloc]init];
    [self.backView addSubview:self.imgvHead];
    [self.imgvHead setContentMode:UIViewContentModeScaleAspectFill];
    self.imgvHead.clipsToBounds = YES;
    self.imgvHead.userInteractionEnabled = YES;

    [self.imgvHead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView.mas_left).offset(0);
        make.right.equalTo(self.backView.mas_right).offset(0);
        make.top.equalTo(self.backView.mas_top).offset(0);
        make.height.mas_equalTo(355);
    }];
    
    
//    UIView * bgImgView = [[UIView alloc]init];
//    [self.backView addSubview:bgImgView];
//    [bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.backView.mas_left).offset(0);
//        make.right.equalTo(self.backView.mas_right).offset(0);
//        make.top.equalTo(self.backView.mas_top).offset(0);
//        make.height.mas_equalTo(55);
//    }];
    
//    UIColor *colorOne = [UIColor colorWithRed:(33/255.0)  green:(33/255.0)  blue:(33/255.0)  alpha:1.0];
//    UIColor *colorTwo = [UIColor colorWithRed:(33/255.0)  green:(33/255.0)  blue:(33/255.0)  alpha:0.0];
//    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
//    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
//    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
//    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
//    
//    //crate gradient layer
//    CAGradientLayer *headerLayer = [CAGradientLayer layer];
//    
//    headerLayer.colors = colors;
//    headerLayer.locations = locations;
//    headerLayer.frame = bgImgView.bounds;
//    [bgImgView.layer insertSublayer:headerLayer atIndex:0];
    
    
    self.playCoverView = [[UIView alloc]init];
    [self.backView addSubview:self.playCoverView];
    [self.playCoverView setBackgroundColor:[Utility colorWithHexString:@"030303" alpha:0.2]];
    [self.playCoverView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.backView.mas_left).offset(0);
        make.right.equalTo(self.backView.mas_right).offset(0);
        make.top.equalTo(self.backView.mas_top).offset(0);
        make.bottom.equalTo(self.imgvHead.mas_bottom).offset(0);// mas_equalTo(355);
    }];
    
    
    self.statusImg = [[UIImageView alloc]init];
    [self.backView addSubview:self.statusImg];
    self.statusImg.userInteractionEnabled = YES;
    self.statusImg.clipsToBounds = YES;
    [self.statusImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView.mas_left).offset(0);
        make.top.equalTo(self.backView.mas_top).offset(0);
        make.height.mas_equalTo(ScaleWidth(40));
        make.width.mas_equalTo(ScaleWidth(64));
    }];
    
    self.onlineStatus = [[MY_GLAlphaLabel alloc]init];
    self.onlineStatus.titleLabel.text = @"1分钟前";
    self.onlineStatus.bgAlpha = 0.0;
    self.onlineStatus.titleColor = @"fefefe";
//    self.onlineStatus.shadowColor = @"fefefe";
//    self.labelTime.layer.shadowColor = [Utility colorWithHexString:@"00aa04" alpha:1.0].CGColor;
    
    [self.backView addSubview:self.onlineStatus];
    [self.onlineStatus mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backView.mas_right).offset(-10);
        make.top.equalTo(self.backView.mas_top).offset(10);
        make.height.mas_equalTo(14);
        make.width.mas_equalTo(81);
    }];
    
    
//    self.labelVideoAuthen = [[UILabel alloc]init];
//    self.labelVideoAuthen.text = @"视频认证";
//    self.labelVideoAuthen.font = [UIFont systemFontOfSize:14];
//    self.labelVideoAuthen.textColor = [Utility colorWithHexString:@"fefefe" alpha:1];
//    [self.backView addSubview:self.labelVideoAuthen];
//    [self.labelVideoAuthen mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.backView.mas_right).offset(-10);
//        make.top.equalTo(self.onlineStatus.mas_bottom).offset(10);
//        make.height.mas_equalTo(16);
//        make.width.mas_equalTo(62);
//    }];
    
    self.imgVideoAuthen = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [self.imgVideoAuthen setImage:[UIImage imageNamed:@"icon_homeVideoYiRenZheng"] forState:(UIControlStateSelected)];
    [self.imgVideoAuthen setImage:[UIImage imageNamed:@"icon_homeWeideoYiRenZheng"] forState:(UIControlStateNormal)];

    [self.backView addSubview:self.imgVideoAuthen];
    [self.imgVideoAuthen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backView.mas_right).offset(-10);
        make.top.equalTo(self.onlineStatus.mas_bottom).offset(10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(86);
    }];
    
    self.labelName = [[UILabel alloc]init];
    self.labelName.textColor = COlOR333;
    self.labelName.text = @"闻醉山清风";
    self.labelName.font = [UIFont systemFontOfSize:17];
//    self.labelName.backgroundColor = [UIColor redColor];
    [self.backView addSubview:self.labelName];
    [self.labelName sizeToFit];
    [self.labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView.mas_left).offset(8);
        make.top.equalTo(self.imgvHead.mas_bottom).offset(10);
        make.height.mas_equalTo(20);
    }];
    
    
    // 加 V 认证
    self.imgvVip = [[UIImageView alloc]init];
    [self.backView addSubview:self.imgvVip];
    [self.imgvVip mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.labelName.mas_right).offset(10);
        make.centerY.equalTo(self.labelName.mas_centerY).offset(0);

        make.height.mas_equalTo(15);
        make.width.mas_equalTo(15);
    }];
    
//    self.imgvVipLevel = [[UIImageView alloc]init];
//    [self.backView addSubview:self.imgvVipLevel];
//    [self.imgvVipLevel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.labelName.mas_right).offset(10);
//        make.top.equalTo(self.imgvHead.mas_bottom).offset(10);
//        make.height.mas_equalTo(15);
//        make.width.mas_equalTo(30);
//    }];
    
    // 等级
    self.labelVipLevel = [[UILabel alloc]init];
    self.labelVipLevel.backgroundColor = GOLDCOLOR;
    self.labelVipLevel.textColor = [Utility colorWithHexString:@"fefefe" alpha:1.0];
    self.labelVipLevel.layer.cornerRadius = 7.5;
    self.labelVipLevel.clipsToBounds = YES;
    self.labelVipLevel.textAlignment = NSTextAlignmentCenter;
    self.labelVipLevel.font = [UIFont boldSystemFontOfSize:9];
    [self.backView addSubview:self.labelVipLevel];
    [self.labelVipLevel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.labelName.mas_right).offset(35);// 15 38
        make.centerY.equalTo(self.labelName.mas_centerY).offset(0);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(30);
    }];
    
    // 年龄
    self.labelAge = [[UILabel alloc]init];
    self.labelAge.text = @"20岁";
    self.labelAge.font = [UIFont systemFontOfSize:11];
    self.labelAge.textColor = [Utility colorWithHexString:@"bec1ba" alpha:1];
    [self.backView addSubview:self.labelAge];
    [self.labelAge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView.mas_left).offset(8);
        make.top.equalTo(self.imgvVip.mas_bottom).offset(10);
        make.height.mas_equalTo(11);
        make.width.mas_equalTo(30);
    }];
    
    //星座
    self.labelStarSign = [[UILabel alloc]init];
    self.labelStarSign.text = @"双子座";
    self.labelStarSign.font = [UIFont systemFontOfSize:11];
    self.labelStarSign.textColor = [Utility colorWithHexString:@"bec1ba" alpha:1];
    [self.backView addSubview:self.labelStarSign];
    [self.labelStarSign mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.labelAge.mas_right).offset(2);
        make.top.equalTo(self.imgvVip.mas_bottom).offset(10);
        make.height.mas_equalTo(11);
        make.width.mas_equalTo(30);
    }];
    
    // 身高
    self.labelHeight = [[UILabel alloc]init];
    self.labelHeight.text = @"170cm";
    self.labelHeight.font = [UIFont systemFontOfSize:11];
    self.labelHeight.textColor = [Utility colorWithHexString:@"bec1ba" alpha:1];
    [self.backView addSubview:self.labelHeight];
    [self.labelHeight mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.labelStarSign.mas_right).offset(2);
        make.top.equalTo(self.imgvVip.mas_bottom).offset(10);
        make.height.mas_equalTo(11);
        make.width.mas_equalTo(40);

    }];

    // 距离
    self.labelDistance = [[UILabel alloc]init];
    self.labelDistance.text = @"10km";
    self.labelDistance.font = [UIFont systemFontOfSize:11];
    self.labelDistance.textColor = [Utility colorWithHexString:@"bec1ba" alpha:1];
    [self.backView addSubview:self.labelDistance];
    [self.labelDistance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.labelHeight.mas_right).offset(2);
        make.top.equalTo(self.imgvVip.mas_bottom).offset(10);
        make.height.mas_equalTo(11);
        make.width.mas_equalTo(40);
    }];
    
    
    self.btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnAdd.layer.masksToBounds = YES;
    self.btnAdd.layer.cornerRadius  = 14;
    [self.backView addSubview:self.btnAdd];
    [self.btnAdd setBackgroundColor:GOLDCOLOR];
    self.btnAdd.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.btnAdd setTitle:@"认识TA" forState:UIControlStateNormal];
    [self.btnAdd addTarget:self action:@selector(knownTaClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.btnAdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backView.mas_right).offset(-15);
        make.top.equalTo(self.imgvHead.mas_bottom).offset(15);
        make.height.mas_equalTo(28);
        make.width.mas_equalTo(69);
    }];
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureMethod:)];
    [self.imgvHead addGestureRecognizer:tap];
    
    self.isPlayerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playCoverView addSubview:self.isPlayerBtn];
    [self.isPlayerBtn setContentHorizontalAlignment:(UIControlContentHorizontalAlignmentCenter)];
    [self.isPlayerBtn addTarget:self action:@selector(isShowPlayBtnClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.isPlayerBtn setImage:[UIImage imageNamed:@"Home_videoPlaying"] forState:(UIControlStateNormal)];
    [self.isPlayerBtn setImage:[UIImage imageNamed:@"Home_videoPause"] forState:(UIControlStateSelected)];

    [self.isPlayerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.playCoverView.mas_right).offset(-10);
        make.bottom.equalTo(self.playCoverView.mas_bottom).offset(-10);
        make.width.mas_equalTo(36);
        make.height.mas_equalTo(36);
    }];
    
    self.isPlayerBtn.hidden = YES;
}

-(void)knownTaClickMethod:(UIButton*)sender{
    
    if (self.KnownTaBlock) {
        self.KnownTaBlock(self.homeModel);
    }
}


//播放或暂停
-(void)isShowPlayBtnClickMethod:(UIButton*)sender{
    

    if (!self.homeModel.indexVideo || [self.homeModel.indexVideo length] == 0) return;
    
    switch ([self.imgvHead playingStatus]) {
        case JPVideoPlayerPlayingStatusPlaying://正在播放
        {
            [self.imgvHead jp_pause];
            sender.selected = YES;

            break;
        }
        case JPVideoPlayerPlayingStatusPause://暂停播放
        {
            [self.imgvHead jp_resume];
            sender.selected = NO;
            
            break;
        }
//        case JPVideoPlayerPlayingStatusStop://停止播放
//        {
//            NSURL * url = [NSURL URLWithString:self.homeModel.indexVideo];
////            [self.imgvHead jp_playVideoWithURL:url];
//            [self.imgvHead jp_playVideoWithURL:url options:JPVideoPlayerContinueInBackground | JPVideoPlayerLayerVideoGravityResizeAspectFill | JPVideoPlayerShowActivityIndicatorView | JPVideoPlayerShowProgressView progress:nil completed:nil];
//            sender.selected = NO;
//
//            break;
//        }
        default:
//            [self.imgvHead jp_setPlayerMute:NO];
//            sender.selected = NO;
        {
            NSURL * url = [NSURL URLWithString:self.homeModel.indexVideo];
            //            [self.imgvHead jp_playVideoWithURL:url];
            [self.imgvHead jp_playVideoWithURL:url options:JPVideoPlayerContinueInBackground | JPVideoPlayerLayerVideoGravityResizeAspectFill | JPVideoPlayerShowActivityIndicatorView | JPVideoPlayerShowProgressView progress:nil completed:nil];
            sender.selected = NO;
            break;
        }
            
    }
}

-(void)tapGestureMethod:(UITapGestureRecognizer*)tap{
    
//    if ([Utility isBlankString:self.homeModel.indexVideo]) {
//        
//        if (!self.playCoverView.hidden) {
//            self.playCoverView.hidden = YES;
//        }
//        return;
//    }
//    self.isPlayerBtn.hidden = YES;

    self.isPlayerBtn.hidden = !self.isPlayerBtn.hidden;
    
    switch ([self.imgvHead playingStatus]) {
        case JPVideoPlayerPlayingStatusPlaying://正在播放
        {
            self.isPlayerBtn.selected = NO;
            break;
        }
        case JPVideoPlayerPlayingStatusPause://暂停播放
        {
            self.isPlayerBtn.selected = YES;
            break;
        }
        case JPVideoPlayerPlayingStatusStop://停止播放
        {
            self.isPlayerBtn.selected = YES;
            break;
        }
        default:
            
            [self.imgvHead jp_playerIsMute];
            self.isPlayerBtn.selected = YES;
            break;
    }
}

-(void)setHomeModel:(MY_GLHomeModel *)homeModel{
    
    _homeModel = homeModel;
//    self.imgvHead.jp_videoPlayerDelegate = nil;
    NSString * coverImg = nil;
    //大图     图片 indexIcon  视频 headIcon

    if ([Utility isBlankString:_homeModel.indexVideo]) {
        
        self.isPlayerBtn.hidden = YES;
        self.imgvHead.userInteractionEnabled = NO;

        self.imgvHead.jp_videoPlayerDelegate = nil;
        
        [self.imgvHead jp_stopPlay];
        
        coverImg = _homeModel.indexIcon;

    }else{
        
        self.isPlayerBtn.hidden = NO;
        
        self.imgvHead.userInteractionEnabled = YES;

        self.imgvHead.jp_videoPlayerDelegate = self;
        
        coverImg = _homeModel.headIcon;
    }
    
    self.isPlayerBtn.selected = YES;
    //大图     图片 indexIcon  视频 headIcon

	[self.imgvHead sd_setImageWithURL:[NSURL URLWithString:coverImg] placeholderImage:[UIImage imageNamed:@"占位图"]];
    
    
    
    //在线状态
    if ([_homeModel.lastLoginTime  integerValue]) {// statement
        
        self.onlineStatus.hidden = NO;
        
        NSString * timeStr = [Utility onLineShowDateString:[_homeModel.lastLoginTime longLongValue]];
        
        CGFloat StatusWidth = [self.onlineStatus setViewTitle:timeStr withFont:[UIFont systemFontOfSize:12]];

//        self.onlineStatus.titleLabel.text = timeStr;
        
        [self.onlineStatus mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(StatusWidth);

        }];
    }else{
        self.onlineStatus.hidden = YES;
    }
    //资料保密隐藏在线时间
    if ([[NSString stringWithFormat:@"%@",_homeModel.secretStatus] isEqualToString:@"1"]) {
        self.onlineStatus.hidden = YES;
    }else{
        self.onlineStatus.hidden = NO;
    }
    // 昵称
    NSString * nick = @"暂无昵称";
    if (![Utility isBlankString:_homeModel.nickName]) {
        nick = _homeModel.nickName;
    }
    
    self.labelName.text = nick;
//    CGSize size = [Utility stringSizeWithString:nick textSize:17 width:0 height:20];
//
//    [self.labelName mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(size.width);
//    }];
    
//    self.labelName.adjustsFontSizeToFitWidth = YES;
    // 是否是VIP
    if ([_homeModel.nobleLevel integerValue]) {
        
        self.labelName.textColor = GOLDCOLOR;
    }else{
        self.labelName.textColor = COlOR333;

    }
    
    // 加V认证
    NSInteger labelLeft = 10;
    if ([_homeModel.isAuthen integerValue]) {
        
        self.imgvVip.hidden = NO;
        [self.imgvVip setImage:[UIImage imageNamed:@"home_addV"]];
        
        labelLeft = 35;
    }else{
        self.imgvVip.hidden = YES;
    }

    // vip等级

//    NSString * vipLevelStr = [NSString stringWithFormat:@"VIP%td",[_homeModel.consumptionLevel integerValue]];
    NSString * vipLevelStr = GetVipLevel([_homeModel.consumptionLevel integerValue]);
    self.labelVipLevel.text = vipLevelStr;
    
    CGSize levelSize = [vipLevelStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 10) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:9]} context:nil].size;
    
    [self.labelVipLevel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.labelName.mas_right).offset(labelLeft);
        make.width.mas_equalTo(levelSize.width+10);
    }];
        
    //年龄
    self.labelAge.text = [NSString stringWithFormat:@"%td岁",[_homeModel.age integerValue]];
    
    // 星座
    if (![Utility isBlankString:_homeModel.constellation]) {
        self.labelStarSign.text = _homeModel.constellation;
    }else{
        self.labelStarSign.text = @"白羊";
    }
    
    //身高
    self.labelHeight.text = [NSString stringWithFormat:@"%tdcm",[_homeModel.height integerValue]];
    
    //距离
//    NSString * distance = nil;
//    if (1 > [_homeModel.distance integerValue]){
////        distance = @"300km";
//        self.labelDistance.text =  @"500m";
//    }else{
//        self.labelDistance.text =  [NSString stringWithFormat:@"%tdkm",[_homeModel.distance integerValue]];
//    }

    
    //  distanceStatus
//    NSString * cityString = @"";
//    if (UserObject(@"city")) {
//        
//        cityString = UserObject(@"city");
//    }
//    
//    NSMutableString * city = [[NSMutableString alloc]initWithString:cityString];
//    NSString * distance =nil;
//    
//    if (_homeModel.distanceStatus.integerValue) {
//        distance = @"隐身";
//        
//    }else{
//        NSRange rang = [city rangeOfString:@"市"];
//        if (rang.length >0 ) {
//            [city deleteCharactersInRange:rang];
//        }
//        if ([_homeModel.region isEqualToString:city]) {
//            distance = [Utility isBlankString:_homeModel.distance]?@"0.1km":[NSString stringWithFormat:@"%@km",_homeModel.distance];
//        }else{
//            if ([Utility isBlankString:_homeModel.region]) {
//                distance = @"上海";
//            }else{
//                distance = _homeModel.region;
//            }
//        }
//    }
    
    //视频认证
    if ([_homeModel.isVideoVerify integerValue]) {

        self.imgVideoAuthen.selected = YES;

    }else{
        self.imgVideoAuthen.selected = NO;

    }
    
    // 挂状态
        //home_meeting  home_hand  home_dull  home_hungry  home_singK  home_wine
        
        switch ([_homeModel.statement integerValue]) {
            case 1:{//想喝酒
                [self.statusImg setImage:[UIImage imageNamed:@"home_wine"]];
                
                break;
            }
            case 2:{//有点饿
                
                [self.statusImg setImage:[UIImage imageNamed:@"home_hungry"]];
                
                break;
            }case 3:{//想唱K
                
                [self.statusImg setImage:[UIImage imageNamed:@"home_singK"]];
                
                break;
            }case 4:{//去甩手
                
                [self.statusImg setImage:[UIImage imageNamed:@"home_hand"]];
                
                break;
            }case 5:{//无聊中
                
                [self.statusImg setImage:[UIImage imageNamed:@"home_dull"]];
                
                break;
            }case 6:{//求偶遇
                
                [self.statusImg setImage:[UIImage imageNamed:@"home_meeting"]];
                
                break;
            }
            default:
                
                [self.statusImg setImage:[UIImage imageNamed:@"aa"]];
                
                break;
        }
    
    // 如果是自己 认识他隐藏
    if ([_homeModel.userId integerValue] == [USERID integerValue]) {
        self.btnAdd.hidden = YES;
    }else{
        self.btnAdd.hidden = NO;
    }
    
}


#pragma mark - JPVideoPlayerDelegate
- (void)playingStatusDidChanged:(JPVideoPlayerPlayingStatus)playingStatus{
    if([self.imgvHead playingStatus] ==JPVideoPlayerPlayingStatusPlaying){
        self.isPlayerBtn.selected = NO;
    }else{
        self.isPlayerBtn.selected = YES;
    }
}
- (BOOL)videoPlayerManager:(JPVideoPlayerManager *)videoPlayerManager shouldAutoReplayForURL:(NSURL *)videoURL{
    // do something here.
    
    self.isPlayerBtn.hidden = NO;
    self.isPlayerBtn.selected = NO;
    [self.imgvHead jp_stopPlay];
    
    return NO;
}

- (BOOL)shouldDownloadVideoForURL:(nonnull NSURL *)videoURL
{
    return YES;
}

- (BOOL)videoPlayerManager:(JPVideoPlayerManager *)videoPlayerManager shouldDownloadVideoForURL:(NSURL *)videoURL{
    // do something here.
    return YES;
}

- (BOOL)shouldAutoReplayAfterPlayCompleteForURL:(nonnull NSURL *)videoURL{
    
    self.isPlayerBtn.hidden = NO;
    self.isPlayerBtn.selected = YES;
    [self.imgvHead jp_stopPlay];
    
    return NO;
    
}
//- (BOOL)shouldProgressViewOnTop{
//    return YES;
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
