//
//  EssenceViewController.m
//  TogetherLu
//
//  Created by gll on 2016/12/24.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "EssenceViewController.h"
#import "VideoTableViewCell.h"
#import "ParallelButton.h"
#import "ReportDynamicViewController.h"
#import "DYBaseView.h"
#import "MY_LLSingleChatRedPacketView.h"
#import "MY_XTRewardredpacketsListViewController.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_LYDynamicViewController.h"
@interface EssenceViewController ()<ZFPlayerDelegate,VideoTableViewCellDelegate,MY_LLPayViewControllerDelegate,GetifpayattentionDelegate,MY_LLChatRedPacketViewDelegate,MY_LLChatRedPacketSayHWViewDelegate>
{
    NSInteger _page;
//    UITableView * _tabbliView;
    VideoTableViewCell *_xq_currRedcell; // 当前点击的cell发送的小红包
    VideoTableViewCell *_xq_currattentioncell; // 当前点击的cell上的关注
    VideoTableViewCell *_xq_playCell;//当前播放视屏的cell
    MY_LYPersonInfoModel *_xq_personalModel;
    NSInteger _noteBt; // 1私聊 2 动态红包
}

@property (strong, nonatomic) NSMutableArray* dataArray;
@property (strong, nonatomic) NSMutableArray* dataGiftArray;
@property (strong, nonatomic) NSMutableArray * giftinfoArray;

@property (nonatomic, strong) ZFPlayerView        *playerView;
@property (nonatomic, strong) ZFPlayerControlView *controlView;

@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIView * view= [[UIView alloc]initWithFrame:CGRectMake(1, 1, 1, 1)];
//    [self.view addSubview:view];
    
    _page = 1;
    [self xq_initUI];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _noteBt = 0;
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    _xq_personalModel = arry.firstObject;
//    _xq_personalModel =  [[MessageInfoModel sharedManager] loadPersonModelWithID:[USERID integerValue]];
}

-(void)xq_initUI
{
    [self registerKeyboardNotification];

    _page = 1;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT- NavigationHeight - StatusHeight - TabbarHeight) style:UITableViewStyleGrouped];
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    //    self.tabView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.sectionFooterHeight = 0.1;
    self.tableView.sectionHeaderHeight = 0.1;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[VideoTableViewCell class] forCellReuseIdentifier:@"VideoTableViewCell"];
    [self.tableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    [self.view addSubview:self.tableView];
    
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    self.tableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
    [self.tableView.mj_header beginRefreshing];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

#pragma mark ---刷新
// 刷新
- (void)xq_headerRefreshing
{
    _page = 1;
    [self xq_downLoadData:_page isReshing:YES];
}

- (void)footerRefreshing
{
    [self xq_downLoadData:_page isReshing:NO];
}


#pragma mark - 下载数据

- (void)xq_downLoadData:(NSInteger)page isReshing:(BOOL)isReshing{
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@2 forKey:@"type"];
    [dict setObject:@(_page) forKey:@"page"];
    MY_LYDynamicViewController *dym = (MY_LYDynamicViewController*)self.controllerView;
    [dym refreshDataHideRedPoint];
    [TLHTTPRequest MY_getWithBaseUrl:DynamicListURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            if (1 == _page) {
                [self.dataArray removeAllObjects];
            }
            if ([data objectForKey:@"info"]) {
                for (NSDictionary* dictData in [data objectForKey:@"info"]) {
                    
                    VideoResolutionModel* model = [[VideoResolutionModel alloc]init];
                    
                    [model setValuesForKeysWithDictionary:dictData];
                    model.dynamicHeight = [Utility stringSizeWithString:model.content textSize:14 width:SCREEN_WIDTH - 20 height:0].height;
                    [self.dataArray addObject:model];
                }
                _page ++;
//                if (self.dataArray.count > 0) {
//                    self.nullTitleLabel.hidden = YES;
//                }
//                else {
//                    self.nullTitleLabel.hidden = NO;
//                }
                [self.tableView reloadData];
            }
            
        }else {
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
        [LQProgressHud showMessage:@"请求失败，请检查网络"];
        if (isReshing) {
            [self.tableView.mj_header endRefreshing];
        }else {
            [self.tableView.mj_footer endRefreshing];
        }
    }];
}



#pragma mark -- tableView 代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    if (_dataArray.count - 1 == section) {
        return 0.1;
    }
    else {
        return 10;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.5;
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    __block VideoResolutionModel *model = nil;
    if (_dataArray.count - 1 >= indexPath.section) {
        model = _dataArray[indexPath.section];
    }
    static NSString * cellId = @"VideoTableViewCell";
    
    VideoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.personalModel = _xq_personalModel; //把我自己的model传进去
    cell.delegate = self;
    // 赋值model
    cell.model = model;
    __block NSIndexPath *weakIndexPath = indexPath;
    __block VideoTableViewCell *weakCell = cell;
    __weak typeof(self) weakSelf = self;
    
    // 点击播放的回调
    cell.playBlock = ^(UIButton *btn){
        _xq_playCell = weakCell;
        // 取出字典中的第一视频URL
        NSURL *videoURL = [NSURL URLWithString:model.videoUrl];
        if (!model.videoUrl) {
            btn.hidden = YES;
            return ;
        }
        ZFPlayerModel *playerModel = [[ZFPlayerModel alloc] init];
        playerModel.videoURL         = videoURL;
        playerModel.nickName         = model.nickName;
        playerModel.userId           = model.userId;
        playerModel.placeholderImageURLString = model.img;
        playerModel.scrollView       = weakSelf.tableView;
        playerModel.indexPath        = weakIndexPath;
        
        if (model.videoWidth > model.videoHeight) {
            playerModel.isWideVideo = YES;
        }
        else{
            playerModel.isWideVideo = NO;
        }
        
        // player的父视图tag
        playerModel.fatherViewTag    = weakCell.picView.tag;
        
        //        [self.controlView.barrageView startBarrageMessage];
        
        //        self.controlView.ShareAndAboutBlock = ^(BOOL isShare, NSIndexPath *indexPath) {
        //            if (isShare) {
        //                [weakSelf shareWithModel:model];
        //            }
        //            else {
        //                [weakSelf aboutOrderWithModel:model];
        //            }
        //        };
        
        // 设置播放控制层和model
        [weakSelf.playerView playerControlView:self.controlView playerModel:playerModel];
        // 下载功能
        weakSelf.playerView.hasDownload = YES;
        // 自动播放
        [weakSelf.playerView autoPlayTheVideo];
        
        [self addViewLargeImageWithModel:model cell:weakCell];
    };
    
    cell.ViewLargeImageBlock = ^(VideoResolutionModel *model, CGFloat cellOriginY) {
        
        [weakSelf viewLargeImageWithModel:model cell:weakCell];
    };
    
    if (cell.avatarBtn) {
        cell.avatarBtn.tag = 300 + indexPath.section;
        [cell.avatarBtn addTarget:self action:@selector(avatarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    else {
        [cell.avatarBtn removeTarget:self action:@selector(avatarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    if (cell.attentionBtn) {
        cell.attentionBtn.tag = 500 + indexPath.section;
        [cell.attentionBtn addTarget:self action:@selector(attentionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    else {
        [cell.attentionBtn removeTarget:self action:@selector(attentionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }

    
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
    
    UILongPressGestureRecognizer *longPressed = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressedAct:)];
    
    longPressed.minimumPressDuration = 1;
    
    [cell.contentView addGestureRecognizer:longPressed];
    
    return cell;
}


//  长按举报
-(void)longPressedAct:(UILongPressGestureRecognizer *)gesture {
    
    if(gesture.state == UIGestureRecognizerStateEnded)
    {
        UIAlertAction * canAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        UIAlertAction * affAction = [UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            VideoTableViewCell * cell = (VideoTableViewCell*)gesture.view.superview;
            VideoResolutionModel * model = cell.model;
            
            ReportDynamicViewController * reportVC = [[ReportDynamicViewController alloc] init];
            reportVC.reportOfImageUrl = model.img;
            reportVC.repotrDynamicId = model.did;
            reportVC.reportOfPerson = model.nickName;
            reportVC.repotrOfUserId = model.userId.integerValue;
//            [reportVC setHidesBottomBarWhenPushed:YES];
            [self.controllerView.navigationController pushViewController:reportVC animated:YES];
            
        }];
        
        UIAlertController * alertCtr = [UIAlertController alertControllerWithTitle:@"举报该动态" message:@"举报成功后，我们将48小时之内处理" preferredStyle:UIAlertControllerStyleActionSheet];
        
        [alertCtr addAction:canAction];
        [alertCtr addAction:affAction];
        
        [self presentViewController:alertCtr animated:YES completion:nil];
    }
}




#pragma mark - cell按钮点击
//  头像点击 tag  300 +
- (void)avatarBtnClick:(UIButton *)btn {
    
    VideoResolutionModel * model = self.dataArray[btn.tag - 300];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:btn.tag - 300];
    _xq_currattentioncell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    MY_TTLSelfCenterViewController* selfVc = [[MY_TTLSelfCenterViewController alloc]init];
    
    selfVc.userID = [NSString stringWithFormat:@"%@", model.userId];
    selfVc.delegate = self;
    
    [self.controllerView.navigationController pushViewController:selfVc animated:YES];
}

//  关注
- (void)attentionBtnClick:(UIButton *)btn {
    
    VideoResolutionModel * model = self.dataArray[btn.tag - 500 ];
    
    
    
    if (model.isFollow.integerValue)  return;
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    
    [dict setObject:[model.userId stringValue] forKey:@"onkey"];
    
    [dict setObject:@"0" forKey:@"type"];
    
    [TLHTTPRequest MY_postWithBaseUrl:AttentionURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            model.isFollow = @(1);
            btn.hidden = YES;
            
            [[ChatDemoHelper shareHelper] addAttentionWithUserId:[dict[@"onkey"] integerValue] nickName:model.nickName headIcon:model.headIcon];

        }
        else {
            if (dict[@"msg"]) {
                [LQProgressHud showMessage:dict[@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}

//  点赞  tag 1000 +
- (void)zanBtnClick:(UIButton *)button {
    
    VideoResolutionModel * model = self.dataArray[button.tag - 1000];
        
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
        
        [self ChatStatus:model];
    }
}

- (void)ChatStatus:(VideoResolutionModel *)model {
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    [dict setObject:model.userId forKey:@"userId"];
    
    [TLHTTPRequest MY_getWithBaseUrl:ChatStatusUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
            NSDictionary * infoDict = data[@"info"];
            
            if ([infoDict[@"status"] integerValue] == 1) {
                [self pushChatVCWithModel:model];
            }
            else {
                [self helloWithModel:model];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"请求失败，请检查网络"];
    }];
}


//  跳转聊天
- (void)pushChatVCWithModel:(VideoResolutionModel *)userModel {
    
    MY_LYPersonInfoModel * model = [[MY_LYPersonInfoModel alloc] init];
    model.userId = userModel.userId.integerValue;
    model.nickName = userModel.nickName;
    model.headIcon = userModel.headIcon;
    model.isNoble  = [userModel.nobleLevel integerValue];

    NSString * userId =[NSString stringWithFormat:@"%td", model.userId];
    
    ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:userId conversationType:EMConversationTypeChat];
    
    chatController.model = model;
    chatController.isPayPush = YES;
//    [chatController setHidesBottomBarWhenPushed:YES];
    [self.controllerView.navigationController pushViewController:chatController animated:YES];
}

//  删除自己动态
- (void)deleteDyanmicWithModel:(VideoResolutionModel *)model {
    
    [Utility alertViewWithTitle:@"是否删除您的动态?" withBlockCancle:^{
        
    } withBlockSure:^{
        __weak typeof(self) wSelf = self;
        NSDictionary * dict = [NSMutableDictionary dictionaryWithObject:model.did forKey:@"did"];
        [TLHTTPRequest MY_postWithBaseUrl:DeleteDynamicURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            
            if ([[data objectForKey:@"ret"] boolValue] == 0) {
                
                [LQProgressHud showMessage:@"删除成功"];
                [wSelf xq_headerRefreshing];
                
            }else {
                if ([data objectForKey:@"msg"]) {
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            
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
    chatRedPacketView.userId = [NSString stringWithFormat:@"%@", model.userId];
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
        [wSelf.controllerView.navigationController pushViewController:payVC animated:YES];
    };
    [chatRedPacketView show];
}
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
    //查看大图
    
    [self addViewLargeImageWithModel:model cell:cell];
    
    DYBaseView *baseView = [[DYBaseView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    PhotoLibModel * phoModel = [[PhotoLibModel alloc]init];
    phoModel.photoUrl = model.img;
    phoModel.smallPhotoUrl = model.img;
    phoModel.videoUrl = model.videoUrl;
    if (model.dynamicType.integerValue) {
        phoModel.photoType = @1;
    }
    else {
        phoModel.photoType = @0;
    }
    baseView.iconArray = @[phoModel];
    // 获取图片在屏幕中的位置
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    CGRect rectInTableView = [self.tableView rectForRowAtIndexPath:indexPath];//获取cell在tableView中的位置
    CGRect rectInSuperview = [self.tableView convertRect:rectInTableView toView:[self.tableView superview]];
    
    CGRect contenetVR = [cell.contentView convertRect:cell.picView.bounds toView:cell.contentView];
    CGRect imgRect = [cell.picView convertRect:contenetVR toView:cell.contentView];
    
    CGFloat y = rectInSuperview.origin.y + imgRect.origin.y + 64;
    
    baseView.rectArray = @[NSStringFromCGRect(CGRectMake(10, y, SCREEN_WIDTH - 20, SCREEN_WIDTH - 20))];
    baseView.index = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:baseView];
    baseView.backgroundColor = [UIColor blackColor];
}

#pragma mark --VideoTableViewCellDelegate
- (void)VideoTableViewCellHongBaoBtnClickWithCell:(VideoTableViewCell *)cell withModel:(VideoResolutionModel *)model{
    _xq_currRedcell = cell;
    if([[NSString stringWithFormat:@"%@",model.userId] isEqualToString:USERID])
    {
        MY_XTRewardredpacketsListViewController* noVc = [[MY_XTRewardredpacketsListViewController alloc]init];
//        noVc.hidesBottomBarWhenPushed = YES;
        noVc.did = [NSString stringWithFormat:@"%@",model.did];
        [self.controllerView.navigationController pushViewController:noVc animated:YES];
    }
    else
    {
        _noteBt = 2;
        MY_LLSingleChatRedPacketView * chatRedPacketView = [[MY_LLSingleChatRedPacketView alloc] init];
        chatRedPacketView.bigTitle = @"这么美的TA,我要给ta发个红包！";
        chatRedPacketView.detailTitle = @"";
        chatRedPacketView.userId = model.userId.stringValue;
        chatRedPacketView.payType = 4;
        chatRedPacketView.did =model.did.stringValue;
        chatRedPacketView.redPacketType = RedPacketVDynamic;
        __weak typeof(self)weakSelf = self;
        chatRedPacketView.delegate = self;
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
            payVC.redType = RedPacket_dashang;
            [weakSelf.controllerView.navigationController pushViewController:payVC animated:YES];
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
        [self.controllerView.navigationController pushViewController:chatController animated:YES];
    }else{
        [LQProgressHud showMessage:@"发送成功"];
        float enco = _xq_currRedcell.model.encourageMoney.floatValue;
        float addP = price.floatValue;
        int currMoney =  (int)(enco + addP);
        _xq_currRedcell.hongBaoChat.title = [NSString stringWithFormat:@"%d",currMoney];
        _xq_currRedcell.model.encourageMoney = @(currMoney);
    }
   
    
}
#pragma mark --MY_LLChatRedPacketViewDelegate
- (void)paySucessForChatRedPacketView:(MY_LLSingleChatRedPacketView *)view withPrice:(NSString *)price{
    float enco = _xq_currRedcell.model.encourageMoney.floatValue;
    float addP = price.floatValue;
    int currMoney =  (int)(enco + addP);
    _xq_currRedcell.hongBaoChat.title = [NSString stringWithFormat:@"%d",currMoney];
    _xq_currRedcell.model.encourageMoney = @(currMoney);
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
#pragma mark --返回是否关注
-(void)GetifpayattentionWithStatus:(BOOL)payattention
{
    if(payattention)
    {
        _xq_currattentioncell.attentionBtn.hidden = YES;
    }
    else
    {
        _xq_currattentioncell.attentionBtn.hidden = NO;
    }
    
}

#pragma mark --数据源初始化
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (NSMutableArray *)dataGiftArray{
    if (!_dataGiftArray) {
        _dataGiftArray = [[NSMutableArray alloc] init];
    }
    return _dataGiftArray;
}

- (NSMutableArray *)giftinfoArray{
    if (!_giftinfoArray) {
        _giftinfoArray = [[NSMutableArray alloc] init];
    }
    return _giftinfoArray;
}


#pragma mark - 视频相关
// 页面消失时候
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.playerView resetPlayer];
    [_xq_playCell.effectView removeFromSuperview];
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
        _playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspectFill;
        // 静音
        // _playerView.mute = YES;
    }
    return _playerView;
}

- (ZFPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView = [[ZFPlayerControlView alloc] init];
        _controlView.hiddeShareAndAbout = YES;
    }
    return _controlView;
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
