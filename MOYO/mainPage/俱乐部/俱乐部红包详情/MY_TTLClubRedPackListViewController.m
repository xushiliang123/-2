//
//  MY_TTLClubRedPackListViewController.m
//  VTIME
//
//  Created by MadridLee on 2017/10/14.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLClubRedPackListViewController.h"
#import "MY_TTLClubRedHeadTableViewCell.h"
#import "MY_TTLClubRedDetailTableViewCell.h"

// model
#import "MY_GLClubRedInfoModel.h"

@interface MY_TTLClubRedPackListViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _page;
}
@property (strong, nonatomic) NSMutableArray* dataArray;
@property (strong, nonatomic) NSMutableDictionary * selecteDictionary;

@property (strong, nonatomic) MY_GLClubRedInfoModel * redListModel;

@property (strong, nonatomic) UILabel * titleLabel;

@end

@implementation MY_TTLClubRedPackListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiConfig];
}

-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.translucent = YES;
}

//-(void)viewWillAppear:(BOOL)animated{
//
//    [super viewWillAppear:animated];
//
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackTranslucent;
//}

//  view
//-(void)viewWillDisappear:(BOOL)animated{
//
//    [super viewWillDisappear:animated];
//
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
//}

-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)uiConfig
{
    self.view.backgroundColor = [Utility colorWithHexString:@"191919" alpha:1.0];
    [self addNavBtn:nil isLeft:YES target:self action:@selector(backClick) bgImageName:@"editInfo_backButton"];

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    [self.tableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    self.tableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    [self.view addSubview:self.tableView];
    self.tableView.bounces = NO;
    //    [self.tableView registerClass:[MY_TTLClubHomeTableViewCell class] forCellReuseIdentifier:@"MY_TTLClubHomeTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_TTLClubRedHeadTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_TTLClubRedHeadTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_TTLClubRedDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_TTLClubRedDetailTableViewCell"];
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    self.tableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
//    [self.tableView.mj_header beginRefreshing];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@的红包",self.redListModel.nickName];
    
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    self.titleLabel.textColor = GOLDCOLOR;
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.titleLabel setTextAlignment:(NSTextAlignmentCenter)];
    self.navigationItem.titleView = self.titleLabel;
    
    [self downLoadData:_page isReshing:YES];
}


#pragma mark ---刷新
// 刷新
//- (void)headerRefreshing
//{
//    _page = 1;
//    [self downLoadData:_page isReshing:YES];
//}
//
//- (void)footerRefreshing
//{
//    [self downLoadData:_page isReshing:NO];
//}


#pragma mark - 下载数据

- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing{
    
//    self.hid = @(108);
    
    if (self.hid) {
        [self.selecteDictionary setObject:self.hid forKey:@"hid"];
    }
    
    [TLHTTPRequest MY_postWithBaseUrl:ListMultipleHongbaoGrep parameters:self.selecteDictionary success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            if ([[data objectForKey:@"info"] count] ) {
                
                self.redListModel = [[MY_GLClubRedInfoModel alloc]init];
                [self.redListModel setValuesForKeysWithDictionary:data[@"info"]];
                self.titleLabel.text = [NSString stringWithFormat:@"%@的红包",self.redListModel.nickName];
                self.redListModel.list = [NSMutableArray arrayWithCapacity:0];
                
                for (NSDictionary * perDict in data[@"info"][@"list"]) {
                    
                    MY_GLClubRedListModel * listMod = [[MY_GLClubRedListModel alloc]init];
                    [listMod setValuesForKeysWithDictionary:perDict];
                    [self.redListModel.list addObject:listMod];
                }
                
                [self.tableView reloadData];
                
            }else{
                
//                if ( 1 == _page) {
//                    [self.dataArray removeAllObjects];
//                }
//                [LQProgressHud showMessage:@"没有符合条件的人呢!"];
            }
            
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        
//        if (isReshing) {
//            [self.tableView.mj_header endRefreshing];
//        }else {
//            [self.tableView.mj_footer endRefreshing];
//        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
//        if (isReshing) {
//            [self.tableView.mj_header endRefreshing];
//        }else {
//            [self.tableView.mj_footer endRefreshing];
//        }
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
    
}

#pragma mark -- tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.redListModel.list count] +1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row == 0 ? 231 : 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString * cellId = @"MY_TTLClubRedHeadTableViewCell";
        MY_TTLClubRedHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (self.redListModel) {
             cell.model = self.redListModel;
        }
        return cell;
    }else{
        static NSString * cellId = @"MY_TTLClubRedDetailTableViewCell";
        MY_TTLClubRedDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if ([self.redListModel.list count] >= indexPath.row) {
            cell.model = self.redListModel.list[indexPath.row - 1];
        }
        
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
    
}


#pragma mark --数据源初始化
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

-(NSMutableDictionary*)selecteDictionary{
    
    if (!_selecteDictionary) {
        _selecteDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
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
