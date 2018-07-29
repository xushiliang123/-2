//
//  MyViewController.m
//  TogetherLu
//
//  Created by Louie on 16/12/15.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLMyDynamicViewController.h"
#import "MyInfomationViewController.h"      //  消息
#import "MY_TTLDynamicIssueViewController.h"   //  发布
#import "MY_XTRewardredpacketsListViewController.h"

#import "ZFPlayer.h"
#import "ParallelButton.h"
#import "VideoResolutionModel.h"
#import "VideoTableViewCell.h"
#import "DYBaseView.h"
#import "MY_LLSingleChatRedPacketView.h"
@interface MY_TTLMyDynamicViewController ()<ZFPlayerDelegate,VideoTableViewCellDelegate,MY_LLPayViewControllerDelegate,MY_LLChatRedPacketViewDelegate,MY_LLChatRedPacketSayHWViewDelegate>
{
    UIImageView* _gradientImage;
    BOOL _btnState;
    UIImageView * _imgeView;
    NSInteger _page;
    NSInteger _noteBt; // 1私聊 2 动态红包
}
@property (nonatomic, strong) UIImageView * topImageView;

@property (strong, nonatomic) UITableView* myTableView;

@property (nonatomic, strong) NSMutableArray * dataArray;


@property (strong, nonatomic) UIButton * navRightBtn;
@property (strong, nonatomic) UIView * tipsBtnBadgeView;

@property (nonatomic, strong) ZFPlayerView        *playerView;
@property (nonatomic, strong) ZFPlayerControlView *controlView;

@property (nonatomic, strong) UILabel * nullTitleLabel;

@end

@implementation MY_TTLMyDynamicViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];

        [defaultCenter addObserver:self selector:@selector(hiddenRedBadgeView:) name:@"hiddenRedBadgeView" object:nil];
        
//        [defaultCenter addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的动态";
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(1, 1, 1, 1)];
    [self.view addSubview:view];
    
    _btnState = YES;
    
    self.view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    //  设置UI
    [self createUI];
    
//    [self headerRefreshing];
    [self registerKeyboardNotification];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _noteBt = 0;
    [self headerRefreshing];
}

#pragma mark - UI相关
- (void)createUI{

//  右边
    self.navRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.navRightBtn.frame = CGRectMake(0, 0, 40, 40);
    if (_isShowBadgeView) {
        [self.navRightBtn setImage:[UIImage imageNamed:@"PointMore_read"] forState:UIControlStateNormal];
    } else {
        [self.navRightBtn setImage:[UIImage imageNamed:@"PointMore"] forState:UIControlStateNormal];
    }
    [self.navRightBtn addTarget:self action:@selector(rightBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:self.navRightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;

    
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];

    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //  关闭自动布局
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:_myTableView];
    
    
    [_myTableView registerClass:[VideoTableViewCell class] forCellReuseIdentifier:@"VideoTableViewCell"];
    
    _myTableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    
    _myTableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
    [self.myTableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    
    self.nullTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, ScaleWidth(218), SCREEN_WIDTH, 60)];
    self.nullTitleLabel.numberOfLines = 0;
    self.nullTitleLabel.font = [UIFont systemFontOfSize:15];
    self.nullTitleLabel.textColor = [Utility colorWithHexString:@"c9c9c9" alpha:1.0];
    self.nullTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.nullTitleLabel];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.alignment = NSTextAlignmentCenter;
    paraStyle.lineSpacing = 13; //设置行间距
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:15], NSParagraphStyleAttributeName:paraStyle};
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:@"你还没有发过动态呢\n赶紧去发个动态吧~" attributes:dic];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:[Utility colorWithHexString:@"c9c9c9" alpha:1] range:NSMakeRange(0, attributeStr.length)];
    
    self.nullTitleLabel.attributedText = attributeStr;
    
}


#pragma mark ---刷新
- (void)headerRefreshing
{
    _page = 1;
    [self downLoadData:_page isReshing:YES];
}

- (void)footerRefreshing
{
    [self downLoadData:_page isReshing:NO];
}


//  导航右边按钮tips
- (void)createRightBtnUI{
    
    _imgeView = [Utility createImageViewFrame:CGRectMake(SCREEN_WIDTH - 135, 5, 125, 109) imageName:@"myShareTips"];
    
    _imgeView.userInteractionEnabled = YES;
    NSArray * btnTitles = @[@"发布", @"消息"];
    for (NSInteger i = 0; i < btnTitles.count; ++i) {
        
        NSString * btnTitle = btnTitles[i];
        
        UIButton * btn = [Utility createButtonWithTitle:btnTitle titleColor:[Utility colorWithHexString:@"#666666" alpha:1.0] frame:CGRectMake(CGRectGetWidth(_imgeView.frame) / 2 - 15, 10 + 50 * i, CGRectGetWidth(_imgeView.frame) / 2, 50) setBackgroundImage:nil target:self action:@selector(tipsBtnClick:)];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        btn.tag = 1000 + i;
        
        if (i == 1) {
            
            self.tipsBtnBadgeView = [[UIView alloc] initWithFrame:CGRectMake(45, 10, 10, 10)];
            self.tipsBtnBadgeView.backgroundColor = [UIColor redColor];
            self.tipsBtnBadgeView.layer.masksToBounds = YES;
            self.tipsBtnBadgeView.layer.cornerRadius = 5;
            [btn addSubview:self.tipsBtnBadgeView];
            
            if (_isShowBadgeView) {
                self.tipsBtnBadgeView.hidden = NO;
            } else {
                self.tipsBtnBadgeView.hidden = YES;
            }
        }
        
        [_imgeView addSubview:btn];
    }
    
    [self.view addSubview:_imgeView];
}


#pragma mark - 数据相关
- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing {
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    
    [dict setObject:@(_page) forKey:@"page"];
    
    [TLHTTPRequest MY_getWithBaseUrl:MyDynamicURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            NSArray *arr = [data objectForKey:@"info"];
            if (_page == 1 && self.dataArray.count>0) {
                [self.dataArray removeAllObjects];
            }
            if (arr.count>0) {
                
                for (NSDictionary* dictData in arr) {
                    VideoResolutionModel * model = [[VideoResolutionModel alloc]init];
                    [model setValuesForKeysWithDictionary:dictData];
                    CGSize size = [Utility stringSizeWithString:model.content textSize:15 width:SCREEN_WIDTH - 30 height:0];
                    model.dynamicHeight = size.height;
                    
                    [self.dataArray addObject:model];
                }
                if (self.dataArray.count > 0) {
                    self.nullTitleLabel.hidden = YES;
                }
                else {
                    self.nullTitleLabel.hidden = NO;
                }
                _page ++;
               
            }
             [_myTableView reloadData];
        }else {
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        [_myTableView.mj_header endRefreshing];
        [_myTableView.mj_footer endRefreshing];

    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        [LQProgressHud showMessage:@"加载失败，请查看网络"];
        if (isReshing) {
            [_myTableView.mj_header endRefreshing];
        }else {
            [_myTableView.mj_footer endRefreshing];
        }
    }];
    
}




- (NSMutableArray *)dataArray{
    if (nil == _dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

#pragma mark - 代理相关
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    VideoResolutionModel * model = self.dataArray[indexPath.section];
    
    CGFloat dymaicH = model.dynamicHeight + 10 + 13;    //  文字头部 + 文字 + 文字底部
    if (model.content.length == 0) {
        dymaicH = 13;   //  没有文字，高度为文字底部
    }
    
    NSInteger h = model.videoHeight;
    NSInteger w = model.videoWidth;
    
    //  动态图片
    CGFloat imgH = SCREEN_WIDTH - 20;
    if (model.dynamicType.integerValue) {
        if (w > h) {
            imgH = h * imgH / w;
        }
        else {
            imgH = imgH;
        }
    }
    
    //  动态文字 + 头像顶部 + 头像 + 动态图片 + 底部按钮
    return dymaicH + 10 + 55 + imgH + 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (_dataArray.count - 1 == section) {
        return 0.1;
    }
    else {
        return 10;
    }
    
//    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    __block VideoResolutionModel * model = nil;
    if (_dataArray.count - 1 >= indexPath.section) {
        model = _dataArray[indexPath.section];
    }

    static NSString * cellId = @"VideoTableViewCell";
        
    VideoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.delegate = self;
//    cell.isMyDynamic = YES;
    // 赋值model
    cell.model = model;

    __block NSIndexPath *weakIndexPath = indexPath;
    __block VideoTableViewCell *weakCell = cell;
    __weak typeof(self) weakSelf = self;
    
    // 点击播放的回调
    cell.playBlock = ^(UIButton *btn){
        
        // 取出字典中的第一视频URL
        NSURL *videoURL = [NSURL URLWithString:model.videoUrl];
        
        ZFPlayerModel *playerModel = [[ZFPlayerModel alloc] init];
        playerModel.videoURL         = videoURL;
        playerModel.nickName         = model.nickName;
        playerModel.userId           = model.userId;
        playerModel.placeholderImageURLString = model.img;
        playerModel.scrollView       = weakSelf.myTableView;
        playerModel.indexPath        = weakIndexPath;
        
        if (model.videoWidth > model.videoHeight) {
            playerModel.isWideVideo = YES;
        }
        else
        {
            playerModel.isWideVideo = NO;
        }
        
        // player的父视图tag
        playerModel.fatherViewTag    = weakCell.picView.tag;
        
        // 设置播放控制层和model
        [weakSelf.playerView playerControlView:self.controlView playerModel:playerModel];
        // 下载功能
        //        weakSelf.playerView.hasDownload = YES;
        
        // 自动播放
        [weakSelf.playerView autoPlayTheVideo];
        
        [self addViewLargeImageWithModel:model cell:weakCell];
        
    };
    
    cell.ViewLargeImageBlock = ^(VideoResolutionModel *model, CGFloat cellOriginY) {
        
        [weakSelf viewLargeImageWithModel:model cell:weakCell];
    };
    
    if (cell.zanBtn) {
        cell.zanBtn.tag = 1000 + indexPath.section;
        [cell.zanBtn addTarget:self action:@selector(zanBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    else {
        [cell.zanBtn removeTarget:self action:@selector(zanBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (cell.privateChat) {
        cell.privateChat.tag = 2000 + indexPath.section;
        [cell.privateChat addTarget:self action:@selector(privateChatBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    else {
        [cell.privateChat removeTarget:self action:@selector(privateChatBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}


//  点赞  tag 1000 +
- (void)zanBtnClick:(UIButton *)button {
    
    VideoResolutionModel * model = self.dataArray[button.tag - 1000];
    
    if (model.isFollow.integerValue)  return;
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    
    [dict setObject:[model.did stringValue] forKey:@"did"];
    
    NSInteger isThunUp = [model.isClick integerValue];
    
    [dict setObject:@(isThunUp) forKey:@"type"];
    
    [TLHTTPRequest MY_postWithBaseUrl:ZanURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        ParallelButton * btn = (ParallelButton *)button;
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            if ([dict[@"type"] integerValue]) {
                
                NSInteger zanNumber = model.thumbNum.integerValue - 1;
                if (zanNumber > 0) {
                    btn.title = [NSString stringWithFormat:@"%td", zanNumber];
                }
                else {
                    btn.title = @"点赞";
                }
                //  修改状态
                model.isClick = @0;
                
                model.thumbNum = @(zanNumber);
                
                btn.leftImageView.image = [UIImage imageNamed:@"dianZan"];
            }
            else {
                
                NSInteger zanNumber = model.thumbNum.integerValue + 1;
                if (zanNumber > 0) {
                    btn.title = [NSString stringWithFormat:@"%td", zanNumber];
                }
                //  修改状态
                model.isClick = @1;
                
                model.thumbNum = @(zanNumber);
                
                btn.leftImageView.image = [UIImage imageNamed:@"yiZan"];
            }
            
            //  修改数据源数组
            NSInteger index = button.tag - 1000;
            if (self.dataArray.count >= index) {
                [self.dataArray replaceObjectAtIndex:index withObject:model];
            }
            
        }else {
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
//        _page--;
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}

//  私聊
- (void)privateChatBtnClick:(UIButton *)btn {
    
    
    VideoResolutionModel * model = self.dataArray[btn.tag - 2000];
    
    //  自己删除动态
    if (model.userId.integerValue == [USERID integerValue]) {
        
        [self deleteDyanmicWithModel:model];
    }
    else {
        
        [self helloWithModel:model];
    }
}

//  删除自己动态
- (void)deleteDyanmicWithModel:(VideoResolutionModel *)model {
    
    [Utility alertViewWithTitle:@"是否删除您的动态?" withBlockCancle:^{
        
    } withBlockSure:^{
        __weak typeof(self) wSelf = self;
        NSDictionary * dict = [NSMutableDictionary dictionaryWithObject:model.did forKey:@"did"];
        [TLHTTPRequest MY_postWithBaseUrl:DeleteDynamicURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            
            if ([[data objectForKey:@"ret"] boolValue] == 0) {
                 [wSelf headerRefreshing];
                [LQProgressHud showMessage:@"删除成功"];
                
            }else {
                if ([data objectForKey:@"msg"]) {
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showMessage:@"删除动态失败"];
        }];
    } withBlock:^(UIAlertController *alertView) {
         [self presentViewController:alertView animated:YES completion:nil];
    }];
    
    
}

//  打招呼红包
- (void)helloWithModel:(VideoResolutionModel *)model {
    _noteBt = 1;
    __weak typeof(self) wSelf = self;
    MY_LYPersonInfoModel *mo = [[MY_LYPersonInfoModel alloc]init];
    mo.userId = [model.userId integerValue];
    mo.headIcon = model.headIcon;
    mo.nickName = model.nickName;
    mo.consumptionLevel = [model.consumptionLevel integerValue];
    mo.isAuthen = [model.isAuthen integerValue];
    mo.nobleLevel = [model.nobleLevel integerValue];
    
    MY_LLChatRedPacketView * chatRedPacketView = [[MY_LLChatRedPacketView alloc] init];
    chatRedPacketView.userId =  [NSString stringWithFormat:@"%@", model.userId];
    chatRedPacketView.delegate = self;
    chatRedPacketView.model = mo;
    chatRedPacketView.affirmBtnblock = ^(NSInteger price) {
        
        MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
        payVC.userId = [NSString stringWithFormat:@"%@", model.userId];
        payVC.price = [NSString stringWithFormat:@"%td", price];
        payVC.payType = 1;
        payVC.headIconStr = model.headIcon;
        payVC.nickName = model.nickName;
        payVC.redType = RedPacket_sayHolle;
        payVC.redSingleType = RedPacketSayHolle;
        [wSelf.navigationController pushViewController:payVC animated:YES];
    };
    [chatRedPacketView show];
}

#pragma mark - 视频相关--开始
#pragma mark ##### 分享&下单
/*
- (void)shareWithModel:(VideoResolutionModel *)model{
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    [manager downloadImageWithURL:[NSURL URLWithString:model.img] options:SDWebImageAllowInvalidSSLCertificates progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
        NSString * timeStr = [NSString stringWithFormat:@"%lf", (double)timeInterval];
        
        NSString *titleStr = [NSString stringWithFormat:@"%@达人的个人动态，点击查看。", model.nickName];
        NSString *detailsStr = [NSString stringWithFormat:@"V时代，男神女神约起来，组队开黑，声优聊天，线下k歌"];
        NSString *urlStr = ShareDynamic([model.userId intValue], [model.did intValue], [USERID intValue], timeStr);
        
        NSArray* array = @[titleStr, detailsStr, urlStr];
        
        MY_TTLShareOnlyView* alert = [[MY_TTLShareOnlyView alloc]initWithFrame:ShareFrame withArray:array image:image type:4 typeId:model.did];
        
        [UIView animateWithDuration:0.2 animations:^{
            [alert show];
        }];
    }];
}

*/

#pragma mark ----- 浏览量 -----
- (void)addViewLargeImageWithModel:(VideoResolutionModel *)model cell:(VideoTableViewCell *)cell{
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    
    //    [dict setObject:[model.userId stringValue] forKey:@"onkey"];
    [dict setObject:[model.did stringValue] forKey:@"did"];
    
    [TLHTTPRequest MY_postWithBaseUrl:addViewUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    model.viewNum = [NSNumber numberWithInteger:model.viewNum.integerValue+1];
    cell.pageViewBtn.title = model.viewNum.stringValue;
}

- (void)viewLargeImageWithModel:(VideoResolutionModel *)model cell:(VideoTableViewCell *)cell {
    
    [self addViewLargeImageWithModel:model cell:cell];
    
    //查看大图
    DYBaseView *baseView = [[DYBaseView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    PhotoLibModel * phoModel = [[PhotoLibModel alloc]init];
    phoModel.photoUrl = model.img;
    phoModel.smallPhotoUrl = model.img;
    
    if (model.dynamicType.integerValue) {
        phoModel.photoType = @1;
    }
    else {
        phoModel.photoType = @0;
    }
    baseView.iconArray = @[phoModel];
    // 获取图片在屏幕中的位置
    NSIndexPath *indexPath = [_myTableView indexPathForCell:cell];
    CGRect rectInTableView = [_myTableView rectForRowAtIndexPath:indexPath];//获取cell在tableView中的位置
    CGRect rectInSuperview = [_myTableView convertRect:rectInTableView toView:[_myTableView superview]];
    
    CGRect contenetVR = [cell.contentView convertRect:cell.picView.bounds toView:cell.contentView];
    CGRect imgRect = [cell.picView convertRect:contenetVR toView:cell.contentView];
    
    CGFloat y = rectInSuperview.origin.y + imgRect.origin.y + 64;
    
    baseView.rectArray = @[NSStringFromCGRect(CGRectMake(10, y, SCREEN_WIDTH - 20, SCREEN_WIDTH - 20))];
    baseView.index = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:baseView];
    baseView.backgroundColor = [UIColor blackColor];
}
#pragma mark VideoTableViewCellDelegate
- (void)VideoTableViewCellHongBaoBtnClickWithCell:(VideoTableViewCell *)cell withModel:(VideoResolutionModel *)model{
    
    if([[NSString stringWithFormat:@"%@",model.userId] isEqualToString:USERID])
    {
        MY_XTRewardredpacketsListViewController* noVc = [[MY_XTRewardredpacketsListViewController alloc]init];
//        noVc.hidesBottomBarWhenPushed = YES;
        noVc.did = [NSString stringWithFormat:@"%@",model.did];
        [self.navigationController pushViewController:noVc animated:YES];
    }
    else
    {
        _noteBt = 2;
        MY_LLSingleChatRedPacketView * chatRedPacketView = [[MY_LLSingleChatRedPacketView alloc] init];
        chatRedPacketView.delegate = self;
        chatRedPacketView.userId = model.userId.stringValue;
        chatRedPacketView.payType = 4;
        chatRedPacketView.did =model.did.stringValue;
        __weak typeof(self)weakSelf = self;
        chatRedPacketView.affirmBtnblock = ^(NSInteger price) {
            MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
            payVC.userId = model.userId.stringValue;
            payVC.price = [NSString stringWithFormat:@"%td", price];
            payVC.payType = 4;
            payVC.delegate = self;
            payVC.redSingleType = RedPacketDynamic;
            payVC.did = model.did.stringValue;
            payVC.headIconStr = model.headIcon;   
            payVC.nickName = model.nickName;
            payVC.redType = RedPacket_sayHolle;
            [weakSelf.navigationController pushViewController:payVC animated:YES];
        };
        
        [chatRedPacketView show];
    }
}
#pragma mark --MY_LLPayViewControllerDelegate
- (void)paySucessForViewController:(MY_LLPayViewController *)vc withPrice:(NSString *)price{
    if (_noteBt == 1) {
        MY_LYPersonInfoModel * model = [[MY_LYPersonInfoModel alloc] init];
        model.userId = [vc.userId integerValue];
        model.nickName = vc.nickName;
        model.headIcon = vc.headIconStr;
        //    model.isNoble  = [vc.nobleLevel integerValue];
        ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:vc.userId conversationType:EMConversationTypeChat];
        chatController.model = model;
//        [chatController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:chatController animated:YES];
    }else{
        [LQProgressHud showMessage:@"发送成功"];
    }
//    [self headerRefreshing];
}
#pragma mark --MY_LLChatRedPacketViewDelegate
- (void)paySucessForChatRedPacketView:(MY_LLSingleChatRedPacketView *)view withPrice:(NSString *)price{
   
}

- (void)paySucessForSayHellowRedPacketView:(MY_LLChatRedPacketView *)view withPrice:(NSString *)price{
//    MY_LLPersonInfoModel * model = [[MY_LLPersonInfoModel alloc] init];
//    model.userId = [vc.userId integerValue];
//    model.nickName = vc.nickName;
//    model.headIcon = vc.headIconStr;
    //    model.isNoble  = [vc.nobleLevel integerValue];
    ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:view.userId conversationType:EMConversationTypeChat];
    chatController.model = view.model;
//    [chatController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:chatController animated:YES];
}
- (ZFPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView = [[ZFPlayerControlView alloc] init];
    }
    return _controlView;
}

// 页面消失时候
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.playerView resetPlayer];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    // 这里设置横竖屏不同颜色的statusbar
    if (ZFPlayerShared.isLandscape) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return ZFPlayerShared.isStatusBarHidden;
}


- (ZFPlayerView *)playerView {
    if (!_playerView) {
        _playerView = [ZFPlayerView sharedPlayerView];
        _playerView.delegate = self;
        // 当cell播放视频由全屏变为小屏时候，不回到中间位置
        _playerView.cellPlayerOnCenter = NO;
        
        // 当cell划出屏幕的时候停止播放
        _playerView.stopPlayWhileCellNotVisable = YES;
        //（可选设置）可以设置视频的填充模式，默认为（等比例填充，直到一个维度到达区域边界）
        _playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspect;
        // 静音
        // _playerView.mute = YES;
    }
    return _playerView;
}
#pragma mark ##### 视频相关--结束


#pragma mark - 事件相关
- (void)rightBarButtonClick{
    
    if (_btnState) {
        
        [self createRightBtnUI];
        _btnState = NO;
    }else{
        
        [_imgeView removeFromSuperview];
        _btnState = YES;
    }
}


- (void)tipsBtnClick:(UIButton *)btn{
    
    if (btn.tag == 1000) {
    
        MY_TTLDynamicIssueViewController * dynVC = [[MY_TTLDynamicIssueViewController alloc] init];
        dynVC.vcTitle = @"发布动态";
        [self.navigationController pushViewController:dynVC animated:YES];
    }else{

        MyInfomationViewController * infoVC = [[MyInfomationViewController alloc] init];
        infoVC.vcTitle = @"消息";
        [self.navigationController pushViewController:infoVC animated:YES];
    }
    [_imgeView removeFromSuperview];
    _btnState = YES;
}

- (void)networkDidReceiveMessage:(NSNotification *)not{
    self.isShowBadgeView = YES;
    [self.navRightBtn setImage:[UIImage imageNamed:@"PointMore_read"] forState:UIControlStateNormal];

}

- (void)hiddenRedBadgeView:(NSNotification *)not{
    
    self.isShowBadgeView = NO;
    [self.navRightBtn setImage:[UIImage imageNamed:@"PointMore"] forState:UIControlStateNormal];
}

-(void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
