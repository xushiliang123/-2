//
//  MY_XTActivityViewController.m
//  VTIME
//
//  Created by tingting on 2017/11/7.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTActivityViewController.h"
#import "MY_XTActivityTableViewCell.h"
#import "MY_XTCreateAnActivityViewController.h"
#import "MY_XTDetailActivityViewController.h"

@interface MY_XTActivityViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _page;
}
@property (strong, nonatomic) NSMutableArray* dataArray;

@end

@implementation MY_XTActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self uiConfig];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.controllerView.tabBarController.tabBar.hidden = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addheight" object:self userInfo:@{@"height":@(SCREEN_HEIGHT)}];
    [self.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
}

-(void)UpdateUI
{
    _page = 1;
    [self downLoadData:_page isReshing:YES];
}

-(void)uiConfig
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleSingleLine)];
    [self.tableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    self.tableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    [self.view addSubview:self.tableView];
    //    [self.tableView registerClass:[MY_TTLClubHomeTableViewCell class] forCellReuseIdentifier:@"MY_TTLClubHomeTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_XTActivityTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_XTActivityTableViewCell"];
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    self.tableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
    [self.tableView.mj_header beginRefreshing];
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
    
    
//    [self.selecteDictionary setObject:@(page) forKey:@"page"];
//
//
//    [TLHTTPRequest MY_getWithBaseUrl:ClubListUrl parameters:self.selecteDictionary success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull dict) {
//
//        if ([[dict objectForKey:@"ret"] integerValue] == 0) {
//
//
//            if ([[dict objectForKey:@"info"] count] ) {
//                NSArray * dataArray = [dict objectForKey:@"info"];
//
//                if ( 1 == _page) {
//                    [self.dataArray removeAllObjects];
//                }
//
//                for (NSDictionary* dic in dataArray) {
//
//                    MY_GLClubModel * model = [[MY_GLClubModel alloc]init];
//                    [model setValuesForKeysWithDictionary:dic];
//
//                    [self.dataArray addObject:model];
//                }
//
//                [self.tableView reloadData];
//
//                _page ++;
//            }else{
//
//                if ( 1 == _page) {
//                    [self.dataArray removeAllObjects];
//                }
//                [LQProgressHud showMessage:@"没有符合条件的!"];
//            }
//
//        }else{
//            if ([dict objectForKey:@"msg"]) {
//                [LQProgressHud showMessage:[dict objectForKey:@"msg"]];
//            }
//        }
//
//        if (isReshing) {
//            [self.tableView.mj_header endRefreshing];
//        }else {
//            [self.tableView.mj_footer endRefreshing];
//        }
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
    
        if (isReshing) {
            [self.tableView.mj_header endRefreshing];
        }else {
            [self.tableView.mj_footer endRefreshing];
        }
//        [LQProgressHud showMessage:@"没网怎能忍？"];
//    }];
    
}

#pragma mark -- tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return [self.dataArray count];
    return 5;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 156;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"MY_XTActivityTableViewCell";
    MY_XTActivityTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MY_XTDetailActivityViewController *detailVC = [[MY_XTDetailActivityViewController alloc]init];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.controllerView.navigationController pushViewController:detailVC animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.controllerView.tabBarController.tabBar.hidden = NO;
    
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
