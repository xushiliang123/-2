//
//  MY_TTLClubHomeViewController.m
//  VTIME
//
//  Created by MadridLee on 2017/10/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLClubHomeViewController.h"
#import "MY_TTLClubHomeTableViewCell.h"
#import "MY_TTLClubDetailViewController.h"

#import "MY_GLClubModel.h"
#import "MY_TTLClubChatViewController.h"
@interface MY_TTLClubHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _page;
}
@property (strong, nonatomic) NSMutableArray* dataArray;

@end

@implementation MY_TTLClubHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UpdateUI) name:@"updateClubDetailUI" object:nil];
    
    [self uiConfig];
}

-(void)UpdateUI
{
    _page = 1;
    [self downLoadData:_page isReshing:YES];
}

-(void)uiConfig
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NavigationHeight - StatusHeight  - TabbarHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleSingleLine)];
    [self.tableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    self.tableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    [self.view addSubview:self.tableView];
//    [self.tableView registerClass:[MY_TTLClubHomeTableViewCell class] forCellReuseIdentifier:@"MY_TTLClubHomeTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_TTLClubHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_TTLClubHomeTableViewCell"];
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
    
   
    [TLHTTPRequest MY_getWithBaseUrl:ClubListUrl parameters:self.selecteDictionary success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull dict) {
        
        if ([[dict objectForKey:@"ret"] integerValue] == 0) {
            
            if (1 == [self.selecteDictionary[@"page"] integerValue]) {
                [self.dataArray removeAllObjects];
            }
            
            if ([[dict objectForKey:@"info"] count] ) {
                NSArray * dataArray = [dict objectForKey:@"info"];
                
                for (NSDictionary* dic in dataArray) {
                    
                    MY_GLClubModel * model = [[MY_GLClubModel alloc]init];
                    [model setValuesForKeysWithDictionary:dic];
                    
                    [self.dataArray addObject:model];
                }
                
                [self.tableView reloadData];

                _page ++;
            }else{
                
                if ( 1 == _page) {
                    [self.dataArray removeAllObjects];
                }
                [LQProgressHud showMessage:@"没有更多了"];
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
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 76;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * cellId = @"MY_TTLClubHomeTableViewCell";
    MY_TTLClubHomeTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    
    MY_GLClubModel * model = [self.dataArray objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = model.roomName;
    
    [cell.iconImgv sd_setImageWithURL:model.roomHeadIcon placeholderImage:[UIImage imageNamed:@"占位图"]];
    cell.vipLevel.text = [NSString stringWithFormat:@"LV%@",model.level];
    cell.vipLevel.layer.masksToBounds = YES;
    cell.vipLevel.layer.cornerRadius = 7.5;
    cell.numAreaLabel.text = [NSString stringWithFormat:@"%@/%@",model.userNum,model.limitNum];
    cell.AreaLabel.text = [NSString stringWithFormat:@"%@",model.location];
    cell.detailLabel.text = model.roomInfo;
    
    NSArray *TagArr =  [NSArray arrayWithObjects:@"第一",@"第二",@"皇冠", nil];
    
    if(indexPath.row > 2)
    {
        [cell.HuangguanLabel setHidden:YES];
    }
    else
    {
        [cell.HuangguanLabel setHidden:NO];
        cell.HuangguanLabel.image = [UIImage imageNamed:[TagArr objectAtIndex:indexPath.row]];
    }
//    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
    
    MY_GLClubModel * model = [self.dataArray objectAtIndex:indexPath.row];
    if (!model) {
        return;
    }
    if ([model.isAddClub intValue] == 1)
    {
        MY_TTLClubChatViewController *clubChatVC = [[MY_TTLClubChatViewController alloc]initWithConversationChatter:model.roomGroupId conversationType:EMConversationTypeGroupChat];
        clubChatVC.groupModel = model;
//        clubChatVC.hidesBottomBarWhenPushed = YES;
        [self.controllerView.navigationController pushViewController:clubChatVC animated:YES];
    }
    else
    {
        MY_TTLClubDetailViewController* clubVc = [[MY_TTLClubDetailViewController alloc]init];
        clubVc.ClubID = [model.roomId intValue];
        [self.controllerView.navigationController pushViewController:clubVc animated:YES];
    }
    
    
    //    MY_LLAddNewViewController *addvc = [[MY_LLAddNewViewController alloc]init];
    //    addvc.clubId = model.roomId;
    //    [self.controllerView.navigationController pushViewController:addvc animated:YES];
    //
//    MY_GLClubModel * modelw = [[MY_GLClubModel alloc] init];
//    modelw.roomGroupId = model.roomGroupId;
//    modelw.roomName = model.roomName;
//    MY_TTLClubChatViewController *clubChatVC = [[MY_TTLClubChatViewController alloc]initWithConversationChatter:modelw.roomGroupId conversationType:EMConversationTypeGroupChat];
//    clubChatVC.hidesBottomBarWhenPushed = YES;
//    clubChatVC.model = modelw;
//
//    [self.controllerView.navigationController pushViewController:clubChatVC animated:YES];

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
