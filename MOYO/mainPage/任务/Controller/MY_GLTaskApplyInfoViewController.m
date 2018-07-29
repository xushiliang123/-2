//
//  MY_GLTaskApplyInfoViewController.m
//  VTIME
//
//  Created by gll on 2017/12/16.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLTaskApplyInfoViewController.h"

#import "MY_GLTaskApplyTableViewCell.h"//cell

#import "MY_LYTaskApplyModel.h"
@interface MY_GLTaskApplyInfoViewController ()<MY_LLPayViewControllerDelegate,MY_LLChatRedPacketSayHWViewDelegate>
{

    NSInteger _page;
    
}
@property (strong, nonatomic) NSMutableArray* dataArray;
@property (strong, nonatomic) NSMutableDictionary* selecteDictionary;
@property (nonatomic, strong) UILabel * nullTitleLabel;//   没有参与报名的

@end

@implementation MY_GLTaskApplyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self uiConfig];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.tabBarController.tabBar.hidden = YES;
    [self.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
}

-(void)UpdateUI
{
    _page = 1;
    [self downLoadData:_page isReshing:YES];
}

-(void)uiConfig
{
    self.navigationItem.title = @"报名信息";
    
    [self createTableView];
    
    CGRect rect = self.tableView.frame;
    rect.size.height = SCREEN_HEIGHT-64;
    self.tableView.frame = rect;
    
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleSingleLine)];
    [self.tableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    self.tableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    self.tableView.tableFooterView = [[UIView alloc]init];

    //    [self.view addSubview:self.tableView];
    //    [self.tableView registerClass:[MY_TTLClubHomeTableViewCell class] forCellReuseIdentifier:@"MY_TTLClubHomeTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_GLTaskApplyTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_GLTaskApplyTableViewCell"];
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    self.tableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
    [self.tableView.mj_header beginRefreshing];
    
    self.nullTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, ScaleWidth(218), SCREEN_WIDTH, 16)];
    self.nullTitleLabel.font = [UIFont systemFontOfSize:15];
    self.nullTitleLabel.textColor = [Utility colorWithHexString:@"c9c9c9" alpha:1.0];
    self.nullTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.nullTitleLabel.text = @"还没有人参与你的任务哦~";
    [self.view addSubview:self.nullTitleLabel];
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
    [self.selecteDictionary setObject:self.taskId forKey:@"taskId"];

	[TLHTTPRequest MY_getWithBaseUrl:TaskMembersURL parameters:self.selecteDictionary success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull dict) {
    
        if ([[dict objectForKey:@"ret"] integerValue] == 0) {
            if ( 1 == _page) {
                [self.dataArray removeAllObjects];
            }
            if ([[dict objectForKey:@"info"] count] ) {
                NSArray * dataArray = [dict objectForKey:@"info"];
        
                    for (NSDictionary* dic in dataArray) {
    
                        MY_LYTaskApplyModel * model = [[MY_LYTaskApplyModel alloc]init];
                        [model setValuesForKeysWithDictionary:dic];
    
                        [self.dataArray addObject:model];
                    }
    
                    [self.tableView reloadData];
    
                    _page ++;
                
                    if (self.dataArray.count > 0) {
                        self.nullTitleLabel.hidden = YES;
                    }else {
                        self.nullTitleLabel.hidden = NO;
                    }
                
                }else{
    
                    if ( 1 == _page) {
                        [self.dataArray removeAllObjects];
                    }
//                    [LQProgressHud showMessage:@"没有符合条件的!"];
                }
    
            }else{
                if ([dict objectForKey:@"msg"]) {
                    [LQProgressHud showMessage:[dict objectForKey:@"msg"]];
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

#pragma mark -- tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return [self.dataArray count];
//    return 5;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"MY_GLTaskApplyTableViewCell";
    MY_GLTaskApplyTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if(indexPath.row < [self.dataArray count]){
    
        MY_LYTaskApplyModel * model = [self.dataArray objectAtIndex:indexPath.row];
        cell.model = model;
    }
    // 更改数据源
    cell.taskApplyBlock = ^(MY_GLTaskApplyTableViewCell *taskApplyCell) {
        
        [TLHTTPRequest MY_postWithBaseUrl:TaskAgreeURL parameters:@{@"userId":taskApplyCell.model.userId,@"type":@(1)} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
                
                [LQProgressHud showMessage:@"已同意"];
                
                //  本地改变 报名状态 数据
                NSMutableArray * stmpAry = [NSMutableArray arrayWithCapacity:0];
                
                for (NSInteger i = 0; i < self.dataArray.count; i++) {
                    
                    MY_LYTaskApplyModel * model = [self.dataArray objectAtIndex:i];

                    model.status = @(4);
                    if (indexPath.row == i) {
                        
                        model.status = @(1);
                    }
                    [stmpAry addObject:model];
                }
                
                [self.dataArray removeAllObjects];

                [self.dataArray addObjectsFromArray:stmpAry];
                
                [self.tableView reloadData];
                
//                [self.tableView.mj_header beginRefreshing];

            }else{
                [LQProgressHud showMessage:data[@"msg"]];
    
            }
            
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showFailure:@"请求失败，请检查网络"];
            
        }];
    };

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.dataArray.count > indexPath.row) {
        
        MY_LYTaskApplyModel * model = [self.dataArray objectAtIndex:indexPath.row];
        [self ChatStatus:model];
    }
}
// 聊天
- (void)ChatStatus:(MY_LYTaskApplyModel *)model {
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
- (void)pushChatVCWithModel:(MY_LYTaskApplyModel *)userModel {
    
    MY_LYPersonInfoModel * model = [[MY_LYPersonInfoModel alloc] init];
    model.userId = userModel.userId.integerValue;
    model.nickName = userModel.nickName;
    model.headIcon = userModel.headIcon;
    model.isNoble  = [userModel.nobleLevel integerValue];
    NSString * userId =[NSString stringWithFormat:@"%td", model.userId];
    ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:userId conversationType:EMConversationTypeChat];
    chatController.model = model;
    chatController.isTaskPagePush = YES;
    //  有没有跳到支付页
    chatController.isPayPush = YES;
//    [chatController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:chatController animated:YES];
}

//  打招呼红包
- (void)helloWithModel:(MY_LYTaskApplyModel *)model {
    MY_LYPersonInfoModel *mo = [[MY_LYPersonInfoModel alloc]init];
    mo.userId = [model.userId integerValue];
    mo.headIcon = model.headIcon;
    mo.nickName = model.nickName;
    mo.consumptionLevel = [model.consumptionLevel integerValue];
    mo.isAuthen = [model.isAuthen integerValue];
    mo.nobleLevel = [model.nobleLevel integerValue];
    
    __weak typeof(self) wSelf = self;
    MY_LLChatRedPacketView * chatRedPacketView = [[MY_LLChatRedPacketView alloc] init];
    chatRedPacketView.userId = [NSString stringWithFormat:@"%@", model.userId];
    chatRedPacketView.model = mo;
    chatRedPacketView.delegate = self;
    chatRedPacketView.affirmBtnblock = ^(NSInteger price) {
        MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
        payVC.userId = [NSString stringWithFormat:@"%@", model.userId];
        payVC.price = [NSString stringWithFormat:@"%td", price];
        payVC.payType = 1;
        payVC.headIconStr = model.headIcon;
        payVC.nickName = model.nickName;
        payVC.redType = RedPacket_sayHolle;
        payVC.delegate = self;
        payVC.redSingleType = RedPacketSayHolle;
        [wSelf.navigationController pushViewController:payVC animated:YES];
        
    };
    chatRedPacketView.GetNobilityBlock = ^(NSInteger index) {
        if (index == 1) {
            MY_TTLToBeNobilityViewController* noVc = [[MY_TTLToBeNobilityViewController alloc]init];
//            noVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:noVc animated:YES];
        }
        
    };
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
    chatController.isTaskPagePush = YES;
//    [chatController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:chatController animated:YES];
}
- (void)paySucessForSayHellowRedPacketView:(MY_LLChatRedPacketView *)view withPrice:(NSString *)price{
//    MY_LLPersonInfoModel * model = [[MY_LLPersonInfoModel alloc] init];
//    model.userId = [view.userId integerValue];
//    model.nickName = view.nickName;
//    model.headIcon = view.headIconStr;
    //    model.isNoble  = [vc.nobleLevel integerValue];
    ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:view.userId conversationType:EMConversationTypeChat];
    chatController.model = view.model;
    chatController.isTaskPagePush = YES;
//    [chatController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:chatController animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
//    self.tabBarController.tabBar.hidden = NO;
    
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
