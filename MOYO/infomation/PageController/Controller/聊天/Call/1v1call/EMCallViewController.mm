//
//  EMCallViewController.m
//  ChatDemo-UI3.0
//
//  Created by XieYajie on 22/11/2016.
//  Copyright © 2016 XieYajie. All rights reserved.
//

#import "EMCallViewController.h"

#if DEMO_CALL == 1

//#import "EMVideoRecorderPlugin.h"

#import "DemoCallManager.h"
#import "EMVideoInfoViewController.h"
#import "MY_LYMessageInfoModel.h"
@interface EMCallViewController () <EMCallManagerDelegate>
{
    MY_LYPersonInfoModel * _myUserModel;
}
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *remoteNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *remoteImgView;
@property (weak, nonatomic) IBOutlet UIButton *speakerOutButton;
@property (weak, nonatomic) IBOutlet UILabel *speakerOutLabel;

@property (weak, nonatomic) IBOutlet UIView *actionView;

@property (weak, nonatomic) IBOutlet UIButton *silenceButton;
@property (weak, nonatomic) IBOutlet UILabel *silenceLabel;

@property (weak, nonatomic) IBOutlet UIButton *minimizeButton;
//@property (weak, nonatomic) IBOutlet UIButton *rejectButton;    挂断
//@property (weak, nonatomic) IBOutlet UIButton *hangupButton;    挂断
//@property (weak, nonatomic) IBOutlet UIButton *answerButton;    接听

@property (weak, nonatomic) IBOutlet UIButton *switchCameraButton;
@property (weak, nonatomic) IBOutlet UILabel *switchCameraLabel;

@property (weak, nonatomic) IBOutlet UIButton *showVideoInfoButton;
@property (weak, nonatomic) IBOutlet UIView *voiceBGview;
@property (weak, nonatomic) IBOutlet UILabel *voiceTime;

@property (weak, nonatomic) IBOutlet UIButton *voiceSilenceButton;
@property (weak, nonatomic) IBOutlet UILabel *voiceSilenceLabel;

@property (weak, nonatomic) IBOutlet UIView *callBGView;

@property (weak, nonatomic) IBOutlet UIButton *rejectButton;
@property (weak, nonatomic) IBOutlet UILabel *rejectLabel;



@property (weak, nonatomic) IBOutlet UIButton *hangupButton;
@property (weak, nonatomic) IBOutlet UILabel *hangupLabel;

@property (weak, nonatomic) IBOutlet UIButton *answerButton;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

//@property (weak, nonatomic) IBOutlet UIButton *videoButton;
@property (weak, nonatomic) IBOutlet UIButton *videoButton;
@property (weak, nonatomic) IBOutlet UILabel *videoLabel;

@property (weak, nonatomic) IBOutlet UIImageView *headIcon;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *mystatusLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *belowLine;
@property (weak, nonatomic) IBOutlet UILabel *CallStatusLabel;

//  my
//@property (weak, nonatomic) IBOutlet UIView *voiceBGView;
//@property (weak, nonatomic) IBOutlet UIView *headIcon;
//@property (weak, nonatomic) IBOutlet UILabel *firstName;
//@property (weak, nonatomic) IBOutlet UILabel *myStatusLabe;
@property (weak, nonatomic) IBOutlet UIButton *videoHangupBtn;


@property (strong, nonatomic) AVAudioPlayer *ringPlayer;
@property (nonatomic) int timeLength;
@property (strong, nonatomic) NSTimer *timeTimer;

@end

#endif

@implementation EMCallViewController

#if DEMO_CALL == 1

- (instancetype)initWithCallSession:(EMCallSession *)aCallSession
{
    NSString *xibName = @"EMCallViewController";
    self = [super initWithNibName:xibName bundle:nil];
    if (self) {
        _callSession = aCallSession;
        _isDismissing = NO;
        
        if (aCallSession.type == EMCallTypeVideo) {
            AVAudioSession *audioSession = [AVAudioSession sharedInstance];
            [audioSession overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];
            BOOL ret = [audioSession setActive:NO error:nil];
            if (!ret) {
                NSLog(@"1234567");
            }
        }
    }
    
    return self;
}

#endif

- (void)viewDidLoad {
    if (self.isDismissing) {
        return;
    }
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
//    EMCallOptions *options = [[EMClient sharedClient].callManager getCallOptions];
//    //当对方不在线时，是否给对方发送离线消息和推送，并等待对方回应
//    options.isSendPushIfOffline = YES;
//    options.offlineMessageText = @"xxcxzx来电";
//    [[EMClient sharedClient].callManager setCallOptions:options];
    
    //  获取本地存的昵称和图片
//    NSString * where = [NSString stringWithFormat:@"userId = %@", _callSession.remoteName];
//    NSLog(@"yyuserId --:%@",where);
//    [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//
//        if (dataArray) {
//            for (BaseModel * pModel in dataArray) {
//
//                if ([pModel isKindOfClass:[MY_LLPersonInfoModel class]]) {
//                    MY_LLPersonInfoModel * userModel = (MY_LLPersonInfoModel *)pModel;
//
//                    self.remoteNameLabel.text = userModel.nickName;
//                    self.nameLabel.text = userModel.nickName;
//
//                    [self.headIcon sd_setImageWithURL:[NSURL URLWithString:userModel.headIcon] placeholderImage:[UIImage imageNamed:@"占位图"] options:SDWebImageAllowInvalidSSLCertificates];
//                    }
//                }
//            }
//    }];
    NSString * where = [NSString stringWithFormat:@"userId = %td",[_callSession.remoteName integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *personModel = arry.firstObject;
    
//     MY_LLPersonInfoModel *personModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:_callSession.remoteName.intValue];
    NSString *headIcon;
    if (personModel) {
        self.remoteNameLabel.text = personModel.nickName;
        self.nameLabel.text = personModel.nickName;
        headIcon = personModel.headIcon;
    }else{
        NSString *extStr = self.callSession.ext;
        if (extStr.length >0) {
            NSDictionary *dict = [Utility dictionaryWithJsonString:extStr];
            self.remoteNameLabel.text =  [dict objectForKey:@"nickname"];
            self.nameLabel.text = [dict objectForKey:@"nickname"];
            headIcon = [dict objectForKey:@"avatarURLPath"];
        }
        
    }
    
    NSString * where1 = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry1 = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where1];
    MY_LYPersonInfoModel *mmodel = arry1.firstObject;
//    MY_LLPersonInfoModel *mmodel = [[MessageInfoModel sharedManager] loadPersonModelWithID:[USERID integerValue]];
    _myUserModel = mmodel;
    
    [self.headIcon sd_setImageWithURL:[NSURL URLWithString:headIcon] placeholderImage:[UIImage imageNamed:@"占位图"] options:SDWebImageAllowInvalidSSLCertificates];
    [[EMClient sharedClient].callManager addDelegate:self delegateQueue:nil];

    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognizerAction)];
    [self.view addGestureRecognizer:tap];
    
#if DEMO_CALL == 1
    
    [self _layoutSubviews];
    
#endif
    
    //  获取自己信息
//    [self setMyinfo];
}

//- (void)setMyinfo {
//
//    //  获取本地存的昵称和图片
//    NSString * where = [NSString stringWithFormat:@"userId = %@", USERID];
//
//    [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//
//        if (dataArray) {
//            for (BaseModel * pModel in dataArray) {
//
//                if ([pModel isKindOfClass:[MY_LLPersonInfoModel class]]) {
//                    MY_LLPersonInfoModel * userModel = (MY_LLPersonInfoModel *)pModel;
//
//                    if (userModel.userId == [USERID integerValue]) {
//
//                        _myUserModel = userModel;
//
//                    }
//                }
//            }
//        }
//    }];
//}


- (void)tapRecognizerAction{
    
    if (_callBGView.hidden) {
        
        if (self.topLine.constant > 0) {
            
            self.topLine.constant = 0;
            self.belowLine.constant = 0;
        } else {
            
            self.topLine.constant = 160;
            self.belowLine.constant = 230;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.isDismissing) {
        return;
    }
    
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    if (self.isDismissing) {
        return;
    }
    
    [super viewDidAppear:animated];
}

#if DEMO_CALL == 1

#pragma mark - private

- (void)_layoutSubviews
{
    [self.silenceButton setImage:[UIImage imageNamed:@"Button_Mute active"] forState:UIControlStateSelected];
    self.timeLabel.hidden = YES;

//    NSString * headKey = [NSString stringWithFormat:@"avatarURLPath%@", self.callSession.remoteName];
//    
//    [headIcon sd_setImageWithURL:[NSURL URLWithString:UserObject(headKey)]];
//
//    [messageModel addDictionaryWithValue:model.nickName key:[NSString stringWithFormat:@"nickname%@", model.userId]];
    self.videoButton.selected = NO;
    self.silenceButton.selected = NO;
    self.switchCameraButton.selected = NO;
    self.voiceSilenceButton.selected = NO;
    self.speakerOutButton.selected = NO;
    
    [self.videoButton setBackgroundImage:[UIImage imageNamed:@"videoOpen"] forState:UIControlStateSelected];
    [self.videoButton setBackgroundImage:[UIImage imageNamed:@"videoClose"] forState:UIControlStateNormal];
    
    self.voiceSilenceButton.hidden = YES;
    self.voiceSilenceLabel.hidden = YES;
    self.speakerOutButton.hidden = YES;
    self.speakerOutLabel.hidden = YES;
    
    BOOL isCaller = self.callSession.isCaller;
    switch (self.callSession.type) {
        case EMCallTypeVoice:
        {
            [self.speakerOutButton setImage:[UIImage imageNamed:@"Button_Speaker active"] forState:UIControlStateSelected];
            [self.voiceSilenceButton setBackgroundImage:[UIImage imageNamed:@"Button_Mute active"] forState:UIControlStateSelected];
            if (isCaller) {
                self.rejectButton.hidden = YES;
                self.rejectLabel.hidden = YES;
                self.answerButton.hidden = YES;
                self.answerLabel.hidden = YES;
                self.CallStatusLabel.text = @"等待对方接受邀请";
            } else {    // 被叫
                self.hangupButton.hidden = YES;
                self.hangupLabel.hidden = YES;
                self.CallStatusLabel.text = @"对方邀请您语音聊天";
                [self _beginRing];
            }
        }
            break;
        case EMCallTypeVideo:
        {
            self.showVideoInfoButton.hidden = NO;
//            self.speakerOutButton.hidden = YES;
            self.switchCameraButton.hidden = NO;
            
            if (isCaller) {
                self.rejectButton.hidden = YES;
                self.rejectLabel.hidden = YES;
                self.answerButton.hidden = YES;
                self.answerLabel.hidden = YES;
                self.CallStatusLabel.text = @"等待对方接受邀请";
                
            } else {
                self.hangupButton.hidden = YES;
                self.hangupLabel.hidden = YES;
                self.CallStatusLabel.text = @"对方正在向您发起视频";
                [self _beginRing];
            }
            
            [self _setupLocalVideoView];
//            [self.view bringSubviewToFront:self.topView];
//            [self.view bringSubviewToFront:self.actionView];
        }
            break;
            
        default:
            break;
    }
    self.voiceBGview.hidden = YES;
    self.showVideoInfoButton.hidden = YES;
}

- (void)_setupRemoteVideoView
{
    if (self.callSession.type == EMCallTypeVideo && self.callSession.remoteVideoView == nil) {
        NSLog(@"\n########################_setupRemoteView");
        self.callSession.remoteVideoView = [[EMCallRemoteView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        self.callSession.remoteVideoView.hidden = YES;
        self.callSession.remoteVideoView.backgroundColor = [UIColor clearColor];
        self.callSession.remoteVideoView.scaleMode = EMCallViewScaleModeAspectFill;
        [self.view addSubview:self.callSession.remoteVideoView];
        [self.view sendSubviewToBack:self.callSession.remoteVideoView];
        
        __weak EMCallViewController *weakSelf = self;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            weakSelf.callSession.remoteVideoView.hidden = NO;
        });
    }
}

- (void)_setupLocalVideoView
{
    //2.自己窗口
    CGFloat width = 110;
    CGFloat height = 143;
    self.callSession.localVideoView = [[EMCallLocalView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - width - 15, 95, width, height)];
    [self.view addSubview:self.callSession.localVideoView];
    [self.view bringSubviewToFront:self.callSession.localVideoView];
    
    self.callSession.localVideoView.hidden = YES;
}

#pragma mark - private ring

- (void)_beginRing
{
    [self.ringPlayer stop];
    
    NSString *musicPath = [[NSBundle mainBundle] pathForResource:@"Linkin" ofType:@"mp3"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:musicPath];
    
    self.ringPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.ringPlayer setVolume:1];
    self.ringPlayer.numberOfLoops = -1; //设置音乐播放次数  -1为一直循环
    if([self.ringPlayer prepareToPlay])
    {
        [self.ringPlayer play]; //播放
    }
}

- (void)_stopRing
{
    [self.ringPlayer stop];
}

#pragma mark - private timer

- (void)timeTimerAction:(id)sender
{
    self.timeLength += 1;
    int hour = self.timeLength / 3600;
    int m = (self.timeLength - hour * 3600) / 60;
    int s = self.timeLength - hour * 3600 - m * 60;
    
    if (hour > 0) {
        self.timeLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i", hour, m, s];
        self.voiceTime.text = [NSString stringWithFormat:@"%02i:%02i:%02i", hour, m, s];
    }
    else if(m > 0){
        self.timeLabel.text = [NSString stringWithFormat:@"%02i:%02i", m, s];
        self.voiceTime.text = [NSString stringWithFormat:@"%02i:%02i", m, s];

    }
    else{
        self.timeLabel.text = [NSString stringWithFormat:@"00:%02i", s];
        self.voiceTime.text = [NSString stringWithFormat:@"00:%02i", s];

    }
}

- (void)_startTimeTimer
{
    self.timeLength = 0;
    self.timeTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeTimerAction:) userInfo:nil repeats:YES];
}

- (void)_stopTimeTimer
{
    if (self.timeTimer) {
        [self.timeTimer invalidate];
        self.timeTimer = nil;
    }
}

#pragma mark - action

- (IBAction)speakerOutAction:(id)sender
{
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    self.speakerOutButton.selected = !self.speakerOutButton.selected;
    if (!self.speakerOutButton.selected) {
        [audioSession overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:nil];
        self.speakerOutLabel.textColor = [UIColor whiteColor];
    }else {
        [audioSession overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];
        self.speakerOutLabel.textColor = GOLDCOLOR;
    }
    [audioSession setActive:YES error:nil];
}

- (IBAction)silenceAction:(id)sender
{
    self.silenceButton.selected = !self.silenceButton.selected;
    if (self.silenceButton.selected) {
        [self.callSession pauseVoice];
        self.silenceLabel.textColor = GOLDCOLOR;
    } else {
        [self.callSession resumeVoice];
        self.silenceLabel.textColor = [UIColor whiteColor];
    }

}
- (IBAction)voiceSilenceAction:(UIButton *)sender {
    
    self.voiceSilenceButton.selected = !self.voiceSilenceButton.selected;
    
    if (self.voiceSilenceButton.selected) {
        [self.callSession pauseVoice];
        self.voiceSilenceLabel.textColor = GOLDCOLOR;
    } else {
        [self.callSession resumeVoice];
        self.voiceSilenceLabel.textColor = [UIColor whiteColor];
    }

}

- (IBAction)switchCameraAction:(id)sender
{
    if (self.switchCameraButton.selected) {
        self.switchCameraLabel.textColor = [UIColor whiteColor];
    }
    else {
        self.switchCameraLabel.textColor = GOLDCOLOR;
    }
    [self.callSession switchCameraPosition:self.switchCameraButton.selected];
    self.switchCameraButton.selected = !self.switchCameraButton.selected;
}


- (IBAction)showVideoInfoAction:(id)sender
{
    EMVideoInfoViewController *videoInfoController = [[EMVideoInfoViewController alloc] initWithNibName:@"EMVideoInfoViewController" bundle:nil];
    videoInfoController.callSession = self.callSession;
    videoInfoController.currentTime = self.timeLabel.text;
    [videoInfoController startTimer:self.timeLength];
    [self presentViewController:videoInfoController animated:YES completion:nil];
}



- (IBAction)videoButtonAction:(UIButton *)sender {
    
    if (!sender.selected) {
        
        [self.callSession pauseVideo];
        self.videoLabel.textColor = GOLDCOLOR;
    } else {
        
        [self.callSession resumeVideo];
        self.videoLabel.textColor = [UIColor whiteColor];
    }
    
    sender.selected = !sender.selected;
    
}

- (IBAction)answerAction:(UIButton *)sender {
    
    self.CallStatusLabel.hidden = YES;
    switch (self.callSession.type) {
        case EMCallTypeVoice:
        {
            self.voiceSilenceButton.hidden = NO;
            self.voiceSilenceLabel.hidden = NO;
            self.speakerOutButton.hidden = NO;
            self.speakerOutLabel.hidden = NO;
            self.mystatusLabel.hidden = YES;
            self.voiceBGview.hidden = NO;
        }
            break;
        case EMCallTypeVideo:
        {
            self.callBGView.hidden = YES;
        }
            break;
        default:
            break;
    }
    
    [self _stopRing];
    [[DemoCallManager sharedManager] answerCall:self.callSession.callId];
}


- (IBAction)rejectAction:(UIButton *)sender {

    [self _stopTimeTimer];
    [self _stopRing];
    
    [[DemoCallManager sharedManager] hangupCallWithReason:EMCallEndReasonDecline];
}

//hangupAction
- (IBAction)hangupAction:(UIButton *)sender {

    [self _stopTimeTimer];
    [self _stopRing];
    
    [[DemoCallManager sharedManager] hangupCallWithReason:EMCallEndReasonHangup];
}

- (IBAction)videoHangupAction:(UIButton *)sender  {

    [self _stopTimeTimer];
    [self _stopRing];
    
    [[DemoCallManager sharedManager] hangupCallWithReason:EMCallEndReasonHangup];
}



#pragma mark - public

- (void)stateToConnecting
{
    if (self.callSession.isCaller) {
        self.statusLabel.text = NSLocalizedString(@"call.connecting", @"Connecting...");
    } else {
        self.statusLabel.text = NSLocalizedString(@"call.connecting", "Incomimg call");
    }
}

- (void)stateToConnected
{
    self.statusLabel.text = NSLocalizedString(@"call.finished", "Establish call finished");
}

- (void)stateToAnswered
{
    [self _startTimeTimer];
    
    if (self.callSession.type == EMCallTypeVideo) {
        self.callSession.localVideoView.hidden = NO;
        self.callBGView.hidden = YES;
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        [audioSession overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];
    }
    
    if (self.callSession.type == EMCallTypeVoice) {
        self.mystatusLabel.hidden = YES;
        self.voiceBGview.hidden = NO;
        self.voiceSilenceButton.hidden = NO;
        self.voiceSilenceLabel.hidden = NO;
        self.speakerOutButton.hidden = NO;
        self.speakerOutLabel.hidden = NO;
    }
    
    NSString *connectStr = @"None";
    if (_callSession.connectType == EMCallConnectTypeRelay) {
        connectStr = @"Relay";
    } else if (_callSession.connectType == EMCallConnectTypeDirect) {
        connectStr = @"Direct";
    }
    
    self.statusLabel.text = [NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"call.speak", @"Can speak..."), connectStr];
    self.timeLabel.hidden = NO;
    self.hangupButton.hidden = NO;
    self.hangupLabel.hidden = NO;
    self.statusLabel.hidden = YES;
    self.rejectButton.hidden = YES;
    self.rejectLabel.hidden = YES;
    self.answerButton.hidden = YES;
    self.answerLabel.hidden = YES;
    
    [self _setupRemoteVideoView];
    
//    NSString *recordPath = NSHomeDirectory();
//    recordPath = [NSString stringWithFormat:@"%@/Library/appdata/chatbuffer",recordPath];
//    NSFileManager *fm = [NSFileManager defaultManager];
//    if(![fm fileExistsAtPath:recordPath]) {
//        [fm createDirectoryAtPath:recordPath
//      withIntermediateDirectories:YES
//                       attributes:nil
//                            error:nil];
//    }
//    [[EMVideoRecorderPlugin sharedInstance] startVideoRecordingToFilePath:recordPath error:nil];
}

- (void)clearData
{
//    [[EMVideoRecorderPlugin sharedInstance] stopVideoRecording:nil];
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:nil];
    [audioSession setActive:YES error:nil];
    
    self.callSession.remoteVideoView.hidden = YES;
    self.callSession.remoteVideoView = nil;
    _callSession = nil;
    
    [self _stopTimeTimer];
    [self _stopRing];
}

- (void)callDidEnd:(EMCallSession *)aSession
            reason:(EMCallEndReason)aReason
             error:(EMError *)aError
{
    
    NSString * time = nil;
    if (aSession.type == 0) {
        time = self.voiceTime.text;
    } else {
        time = self.timeLabel.text;
    }
    
    NSString * isCaller = [NSString stringWithFormat:@"%d", aSession.isCaller];
    
//  只有对方点击挂断的时候，才会插入消息，其他情况，自己在实时通话的回调中模仿使用
    NSMutableString * second = [NSMutableString stringWithFormat:@"%@", time];
    
    NSRange range = NSMakeRange(second.length - 2, 2);
    NSString * secondStr = [second substringWithRange:range];
    
    NSInteger timeInt = [secondStr integerValue];
//    if (timeInt <= 0) {
//        [second replaceCharactersInRange:range withString:@"01"];
//    }
    
    NSString * messageStr = nil;
    switch (aReason) {
        case EMCallEndReasonHangup:  //对方已挂断
        {

            messageStr = @"对方已挂断";
        }
            break;
        case EMCallEndReasonNoResponse:  //对方没有响应
        {

            messageStr = @"对方没有响应";
        }
            break;
        case EMCallEndReasonDecline:  //对方拒接
        {
            
            messageStr = @"对方拒接";
        }
            break;
        case EMCallEndReasonBusy:  //对方占线
        {
            messageStr = @"对方占线";
        }
            break;
        case EMCallEndReasonFailed:  //呼叫失败
        {
            messageStr = @"呼叫失败";
        }
            break;
        case EMCallEndReasonUnsupported:  //功能不支持
        {
            messageStr = @"功能不支持";
        }
            break;
        case EMCallEndReasonRemoteOffline:  //对方不在线
        {
            messageStr = @"对方不在线";
        }
            break;
        default:
            
            if (timeInt > 0) {
                messageStr = [NSString stringWithFormat:@"聊天时长 %@", second];
            }
            else {
                messageStr = @"已取消";
            }

//            switch (aSession.status) {
//                case EMCallSessionStatusDisconnected:
//                case EMCallSessionStatusConnecting:
//                case EMCallSessionStatusConnected:
//
//                    NSLog(@"%d", aSession.status);
//                    messageStr = @"已取消";
//                    break;
//                    
//                case EMCallSessionStatusAccepted:
//                    
//                    NSLog(@"%d", aSession.status);
//                    break;
//                    
//                default:
//                    messageStr = [NSString stringWithFormat:@"聊天时长 %@", second];
//                    break;
//            }
            
            break;
    }
    NSMutableDictionary * ext = [NSMutableDictionary dictionaryWithObject:@"YES" forKey:@"realTimeCall"];
    [ext setObject:@(aSession.type) forKey:@"callType"];
    [ext setObject:isCaller forKey:@"isCaller"];
    [ext setObject:messageStr forKey:@"message"];
    [ext setObject:_myUserModel.nickName forKey:@"nickname"];
    [ext setObject:_myUserModel.headIcon forKey:@"avatarURLPath"];

    [self _insertMessageStr:ext];
}

//  通话结束发送通知
- (void)_insertMessageStr:(NSDictionary *)dict{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"insertMessage" object:nil userInfo:dict];
    //     postNotificationName:@"insertMessage" object:nil];
}

#endif

@end
