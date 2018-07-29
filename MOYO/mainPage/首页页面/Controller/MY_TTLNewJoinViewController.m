//
//  MY_TTLNewActiveViewController.m
//  VTIME
//
//  Created by MadridLee on 2017/9/6.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLNewJoinViewController.h"
#import "MY_TTLActiveHomeTableViewCell.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_TTLSelfCenterViewController.h"

//播放视频Tool
#import "UIView+WebVideoCache.h"
#import "UITableView+VideoPlay.h"

//model
#import "MY_GLHomeModel.h"
static BOOL _isPlayer;//是否需要播放

@interface MY_TTLNewJoinViewController ()<UITableViewDelegate,UITableViewDataSource,MY_LLPayViewControllerDelegate,MY_LLChatRedPacketSayHWViewDelegate>
{
    NSInteger _page;
    MY_LYPersonInfoModel *_userModel; //我自己的信息
}
@property (strong, nonatomic) NSMutableArray* dataArray;


/**
 * Arrary of video paths.
 * 播放路径数组集合.
 */
@property(nonatomic, strong, nonnull)NSMutableArray *pathStrings;

/**
 * For calculate the scroll derection of tableview, we need record the offset-Y of tableview when begain drag.
 * 刚开始拖拽时scrollView的偏移量Y值, 用来判断滚动方向.
 */
@property(nonatomic, assign)CGFloat offsetY_last;

/**
 * Center indicator line.
 * 中心指示线.
 */
@property(nonatomic, strong, nonnull)UIView *tableViewRange;

@end
#warning 注意: 播放视频的工具类是单例, 单例生命周期为整个应用生命周期, 故而须在 `-viewWillDisappear:`(推荐)或其他方法里 调用 `stopPlay` 方法来停止视频播放, 否则当前控制器销毁了, 视频仍然在后台播放, 虽然看不到图像, 但是能听到声音(如果有).

static NSString *JPVideoPlayerDemoReuseID = @"MY_TTLNewActiveViewControllerReuseID";
@implementation MY_TTLNewJoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self uiConfig];
}


-(void)uiConfig
{

    [self createTableView];
    
    CGRect rect = self.tableView.frame;
    rect.size.height = SCREEN_HEIGHT- NavigationHeight - StatusHeight - TabbarHeight;
    self.tableView.frame = rect;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    [self.tableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    self.tableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];

    [self.tableView registerClass:[MY_TTLActiveHomeTableViewCell class] forCellReuseIdentifier:@"MY_TTLActiveHomeTableViewCell"];
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    self.tableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
    
    if (USERKEY) {
        [self.tableView.mj_header beginRefreshing];
    }
}


#pragma mark ---刷新
// 刷新
- (void)headerRefreshing
{
    _page = 1;
    [self downLoadData:_page isReshing:YES];
}

- (void)footerRefreshing
{
    [self downLoadData:_page isReshing:NO];
}


#pragma mark - 下载数据

- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing{
    
    
    [self.selecteDictionary setObject:@(page) forKey:@"page"];
    
    [TLHTTPRequest MY_postWithBaseUrl:HomeNewAddUrl parameters:self.selecteDictionary success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            if (1 == [self.selecteDictionary[@"page"] integerValue]) {
                [self.dataArray removeAllObjects];
                [self.pathStrings removeAllObjects];
            }
            
            if ([[data objectForKey:@"info"] count] ) {
                NSArray * dataArray = [data objectForKey:@"info"];
                
                for (NSDictionary* dic in dataArray) {
                    
                    MY_GLHomeModel * model = [[MY_GLHomeModel alloc]init];
                    [model setValuesForKeysWithDictionary:dic];
                    if (model.indexVideo) {
                        [self.pathStrings addObject:model.indexVideo];
                    }else{
                        [self.pathStrings addObject:@""];
                    }
                    
                    [self.dataArray addObject:model];
                }
                
                [self.tableView reloadData];
                
                [self.tableView playVideoInVisiableCells];

//                NSURL *url = [NSURL URLWithString:self.tableView.playingCell.videoPath];
//                
//                [self.tableView.playingCell.imgvHead jp_playVideoMutedDisplayStatusViewWithURL:url];
                
                
//                [self viewDidAppear:YES];
                
                _page ++;
            }else{
                
                [LQProgressHud showMessage:@"暂没有符合要求的！"];
            }
            
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        
        if (isReshing) {
            [self.tableView.mj_header endRefreshing];
        }else {
            [self.tableView.mj_footer endRefreshing];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        if (isReshing) {
            [self.tableView.mj_header endRefreshing];
        }else {
            [self.tableView.mj_footer endRefreshing];
        }
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
    
}

//-(void)viewWillAppear:(BOOL)animated{
//    
//    [super viewWillAppear:animated];
//    [self.tableView.mj_header beginRefreshing];
//    
//}


#pragma mark -- tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JPVideoPlayerDemoRowHei;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"MY_TTLActiveHomeTableViewCell";
    MY_TTLActiveHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //  NSString * vedioUrl = @"http://lavaweb-10015286.video.myqcloud.com/ideal-pick-2.mp4";
    if ([self.pathStrings count] > indexPath.row) {
        cell.videoPath = self.pathStrings[indexPath.row];
    }else{
        //cell.videoPath = vedioUrl;
    }
    
    if ([self.dataArray count] > indexPath.row) {
        MY_GLHomeModel *model = [self.dataArray objectAtIndex:indexPath.row];
        cell.homeModel = model;
        if ([_userModel.region isEqualToString:model.region]) {
            if ([model.region isEqualToString:@"角落里"]) {
                cell.labelDistance.text =  model.region;
            }else{
                if([model.distance floatValue] >= 300)
                {
                    cell.labelDistance.text =  model.region;
                }
                else
                {
                    cell.labelDistance.text  = [NSString stringWithFormat:@"%.1fkm",[model.distance floatValue]];
                }
            }
        }else{
            cell.labelDistance.text =  model.region;
        }
    }
    

    __weak typeof(self) weakSelf = self;
    cell.KnownTaBlock = ^(MY_GLHomeModel * mod){
        
        if ([Utility isAuditEnvironment] == NO) {   //非审核创建按钮
            
            //ChatStatusUrl 判断是否可以聊天
            NSDictionary * chatDic = @{@"userId":mod.userId};
            
            [TLHTTPRequest MY_postWithBaseUrl:ChatStatusUrl parameters:chatDic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                if ([[data objectForKey:@"ret"] integerValue] == 0) {
                    
                    if ([[data[@"info"] objectForKey:@"status"] integerValue]) {
                        // 1 可以聊天
                        
                        MY_LYPersonInfoModel * model = [[MY_LYPersonInfoModel alloc] init];
                        model.userId = [mod.userId integerValue];
                        model.nickName = mod.nickName;
                        model.headIcon = mod.headIcon;
                        model.isNoble  = [mod.nobleLevel integerValue];
                        model.isVideoVerify = mod.isVideoVerify;
                        ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:[mod.userId stringValue] conversationType:EMConversationTypeChat];
                        chatController.model = model;
                        chatController.isPayPush = YES;
//                        [chatController setHidesBottomBarWhenPushed:YES];
                        [self.controllerView.navigationController pushViewController:chatController animated:YES];
                        
                    }else{
                        // 0 不能聊天
                        MY_LYPersonInfoModel *mo = [[MY_LYPersonInfoModel alloc]init];
                        mo.userId = [mod.userId integerValue];
                        mo.headIcon = mod.headIcon;
                        mo.nickName = mod.nickName;
                        mo.consumptionLevel = [mod.consumptionLevel integerValue];
                        mo.isAuthen = [mod.isAuthen integerValue];
                        mo.nobleLevel = [mod.nobleLevel integerValue];
                        
                        MY_LLChatRedPacketView * chatRedPacketView = [[MY_LLChatRedPacketView alloc] init];
                        chatRedPacketView.userId = [NSString stringWithFormat:@"%td", [mod.userId integerValue]];
                        chatRedPacketView.delegate =self;
                        chatRedPacketView.model = mo;
                        chatRedPacketView.affirmBtnblock = ^(NSInteger price) {
                            
                            MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
                            payVC.userId = [NSString stringWithFormat:@"%td", [mod.userId integerValue]];
                            payVC.price = [NSString stringWithFormat:@"%td", price];
                            payVC.payType = 1;
                            payVC.headIconStr = mod.headIcon;
                            payVC.nickName = mod.nickName;
                            payVC.redType = RedPacket_sayHolle;
                            payVC.delegate = self;
                            payVC.redSingleType = RedPacketSayHolle;
                            [weakSelf.controllerView.navigationController pushViewController:payVC animated:YES];
                        };
                        chatRedPacketView.GetNobilityBlock = ^(NSInteger index) {
                            
                            if (index == 1) {
                                
                                MY_TTLToBeNobilityViewController* noVc = [[MY_TTLToBeNobilityViewController alloc]init];
//                                noVc.hidesBottomBarWhenPushed = YES;
                                [self.controllerView.navigationController pushViewController:noVc animated:YES];
                            }
                        };
                        [chatRedPacketView show];
                        
                    }
                }else{
                    if ([data objectForKey:@"msg"]) {
                        [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                
                [LQProgressHud showMessage:@"没网怎能忍？"];
                
            }];
            
        }else{
            
            // 1 可以聊天
            
            MY_LYPersonInfoModel * model = [[MY_LYPersonInfoModel alloc] init];
            model.userId = [mod.userId integerValue];
            model.nickName = mod.nickName;
            model.headIcon = mod.headIcon;
            model.isNoble  = [mod.nobleLevel integerValue];

            ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:[mod.userId stringValue] conversationType:EMConversationTypeChat];
            chatController.model = model;
            chatController.isPayPush = YES;
//            [chatController setHidesBottomBarWhenPushed:YES];
            [self.controllerView.navigationController pushViewController:chatController animated:YES];
            
        }
        
        
    };
    
    
    cell.indexPath = indexPath;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (self.tableView.maxNumCannotPlayVideoCells > 0) {
        if (indexPath.row <= self.tableView.maxNumCannotPlayVideoCells-1) { // 上不可及
            cell.cellStyle = JPPlayUnreachCellStyleUp;
        }
        else if (indexPath.row >= self.pathStrings.count-self.tableView.maxNumCannotPlayVideoCells){ // 下不可及
            cell.cellStyle = JPPlayUnreachCellStyleDown;
        }
        else{
            cell.cellStyle = JPPlayUnreachCellStyleNone;
        }
    }
    else{
        cell.cellStyle = JPPlayUnreachCellStyleNone;
    }
    
    return cell;
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
    MY_TTLSelfCenterViewController* selfVc = [[MY_TTLSelfCenterViewController alloc]init];
    
    MY_GLHomeModel * model = [self.dataArray objectAtIndex:indexPath.row];
    selfVc.userID = [model.userId stringValue];
    
    [self.controllerView.navigationController pushViewController:selfVc animated:YES];}


#pragma mark - - 视频播放

//-(void)viewWillAppear:(BOOL)animated{

//    [super viewWillAppear: animated];
    
//    [self headerRefreshing];
    
//}

#pragma mark - - 视频播放
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //    self.tableView.delegate = self;
    _isPlayer = YES;
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (_isPlayer) {
        
        // 用来防止选中 cell push 到下个控制器时, tableView 再次调用 scrollViewDidScroll 方法, 造成 playingCell 被置空.
        self.tableView.delegate = self;
        
        if (!self.tableView.playingCell) {
            
            // Find the first cell need to play video in visiable cells.
            // 在可见cell中找第一个有视频的进行播放.
            [self.tableView playVideoInVisiableCells];
        }
        else{
            
            NSURL *url = [NSURL URLWithString:self.tableView.playingCell.videoPath];
//            [self.tableView.playingCell.imgvHead jp_playVideoMutedDisplayStatusViewWithURL:url];
//            [self.tableView.playingCell.imgvHead jp_playVideoWithURL:url];
            [self.tableView.playingCell.imgvHead jp_playVideoWithURL:url options:JPVideoPlayerContinueInBackground | JPVideoPlayerLayerVideoGravityResizeAspectFill | JPVideoPlayerShowActivityIndicatorView | JPVideoPlayerShowProgressView progress:nil completed:nil];

        }
        
    }
//     if (USERKEY) {
//
//         [self headerRefreshing];
//}

    
    //    self.tableViewRange.hidden = NO;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    _isPlayer = NO;

    
    // 用来防止选中 cell push 到下个控制器时, tableView 再次调用 scrollViewDidScroll 方法, 造成 playingCell 被置空.
//    self.tableView.delegate = nil;
    
    
    if (self.tableView.playingCell) {
        [self.tableView.playingCell.imgvHead jp_stopPlay];
    }
    
    //    self.tableViewRange.hidden = YES;
}


/**
 * Called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
 * 松手时已经静止, 只会调用scrollViewDidEndDragging
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if (decelerate == NO)
        // scrollView已经完全静止
        [self.tableView handleScrollStop];
}

/**
 * Called on tableView is static after finger up if the user dragged and tableView is scrolling.
 * 松手时还在运动, 先调用scrollViewDidEndDragging, 再调用scrollViewDidEndDecelerating
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    // scrollView已经完全静止
    [self.tableView handleScrollStop];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    // 处理滚动方向
    [self handleScrollDerectionWithOffset:scrollView.contentOffset.y];
    
    // Handle cyclic utilization
    // 处理循环利用
    [self.tableView handleQuickScroll];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.offsetY_last = scrollView.contentOffset.y;
}

- (void)handleScrollDerectionWithOffset:(CGFloat)offsetY{
    self.tableView.currentDerection = (offsetY-self.offsetY_last>0) ? JPVideoPlayerDemoScrollDerectionUp : JPVideoPlayerDemoScrollDerectionDown;
    self.offsetY_last = offsetY;
}

#pragma mark - Setup

- (void)setup{
    NSArray * ary = @[
                         
                         // This url will redirect.
                         @"http://v.polyv.net/uc/video/getMp4?vid=9c9f71f62d5f24a7f9c6273e469a71a0_9",
                         
                         @"http://lavaweb-10015286.video.myqcloud.com/%E5%B0%BD%E6%83%85LAVA.mp4",
                         @"http://lavaweb-10015286.video.myqcloud.com/lava-guitar-creation-2.mp4",
                         @"http://lavaweb-10015286.video.myqcloud.com/hong-song-mei-gui-mu-2.mp4",
                         @"http://lavaweb-10015286.video.myqcloud.com/ideal-pick-2.mp4",
                         
                         // This path is a https.
                         // "https://bb-bang.com:9002/Test/Vedio/20170110/f49601b6bfe547e0a7d069d9319388f4.mp4",
                         // "http://123.103.15.1JPVideoPlayerDemoNavAndStatusTotalHei:8880/myVirtualImages/14266942.mp4",
                         
                         // This video saved in amazon, maybe load sowly.
                         // "http://vshow.s3.amazonaws.com/file147801253818487d5f00e2ae6e0194ab085fe4a43066c.mp4",
                         @"http://120.25.226.186:32812/resources/videos/minion_01.mp4",
                         @"http://120.25.226.186:32812/resources/videos/minion_02.mp4",
                         @"http://120.25.226.186:32812/resources/videos/minion_03.mp4",
                         @"http://120.25.226.186:32812/resources/videos/minion_04.mp4",
                         @"http://120.25.226.186:32812/resources/videos/minion_05.mp4",
                         @"http://120.25.226.186:32812/resources/videos/minion_06.mp4",
                         @"http://120.25.226.186:32812/resources/videos/minion_07.mp4",
                         @"http://120.25.226.186:32812/resources/videos/minion_08.mp4",
                         
                         // To simulate the cell have no video to play.
                         // "",
                         @"http://120.25.226.186:32812/resources/videos/minion_10.mp4",
                         @"http://120.25.226.186:32812/resources/videos/minion_11.mp4",
                         @"http://lavaweb-10015286.video.myqcloud.com/%E5%B0%BD%E6%83%85LAVA.mp4",
                         @"http://lavaweb-10015286.video.myqcloud.com/lava-guitar-creation-2.mp4",
                         @"http://lavaweb-10015286.video.myqcloud.com/hong-song-mei-gui-mu-2.mp4",
                         @"http://lavaweb-10015286.video.myqcloud.com/ideal-pick-2.mp4",
                         
                         // The vertical video.
                         @"https://bb-bang.com:9002/Test/Vedio/20170425/74ba5b355c6742c084414d4ebd520696.mp4",
                         
                         @"http://static.smartisanos.cn/common/video/video-jgpro.mp4",
                         @"http://static.smartisanos.cn/common/video/smartisanT2.mp4",
                         @"http://static.smartisanos.cn/common/video/m1-white.mp4",
                         @"http://static.smartisanos.cn/common/video/t1-ui.mp4",
                         @"http://static.smartisanos.cn/common/video/smartisant1.mp4",
                         @"http://static.smartisanos.cn/common/video/ammounition-video.mp4",
                         @"http://static.smartisanos.cn/common/video/proud-driver.mp4",
                         @"http://static.smartisanos.cn/common/video/proud-farmer.mp4"
                         ];
    
    [self.selecteDictionary setDictionary:@{@"sex":@"-1",@"height":@"-1",@"page":@"1"}];

}




#pragma mark --数据源初始化
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (NSMutableDictionary *)selecteDictionary{
    if (!_selecteDictionary) {
        _selecteDictionary = [[NSMutableDictionary alloc]initWithCapacity:0];
    }
    return _selecteDictionary;
}
- (NSMutableArray *)pathStrings{
    if (!_pathStrings) {
        _pathStrings = [[NSMutableArray alloc] init];
    }
    return _pathStrings;
}
#pragma mark --MY_LLPayViewControllerDelegate
- (void)paySucessForViewController:(MY_LLPayViewController *)vc withPrice:(NSString *)price{
    MY_LYPersonInfoModel * model = [[MY_LYPersonInfoModel alloc] init];
    model.userId = [vc.userId integerValue];
    model.nickName = vc.nickName;
    model.headIcon = vc.headIconStr;
    //    model.isNoble  = [vc.nobleLevel integerValue];
    ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:vc.userId conversationType:EMConversationTypeChat];
    chatController.model = model;
//    [chatController setHidesBottomBarWhenPushed:YES];
    [self.controllerView.navigationController pushViewController:chatController animated:YES];
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
    [self.controllerView.navigationController pushViewController:chatController animated:YES];
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
