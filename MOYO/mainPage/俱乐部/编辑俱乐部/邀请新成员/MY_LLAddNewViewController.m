//
//  MY_LLAddNewViewController.m
//  VTIME
//
//  Created by tingting on 2017/10/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLAddNewViewController.h"
#import "MY_LLAddNewMemberCell.h"

@interface MY_LLAddNewViewController () <UISearchBarDelegate>
{
    NSString* _strSearch;
    NSInteger _page;
}
@property (strong, nonatomic) NSMutableArray* dataArray;
@property (strong, nonatomic) NSMutableArray* searchArray;

@end

@implementation MY_LLAddNewViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(1, 1, 1, 1)];
    [self.view addSubview:view];
    
    [self uiConfig];
    [self createHeaderView];
    
//    [_tableView.mj_header beginRefreshing];
    [self downLoadData];
}


-(void)createHeaderView
{
    // 创建UISearchBar对象
    UISearchBar* searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
    
    // 设置没有输入时的提示占位符
    [searchBar setPlaceholder:@"搜索对方昵称"];
    // 显示Cancel按钮
    searchBar.showsCancelButton = NO;
    // 设置代理
    searchBar.delegate = self;

    searchBar.layer.borderWidth = 1;
    searchBar.layer.borderColor = [BGCOLOR CGColor];
    searchBar.barTintColor = BGCOLOR;
    self.tableView.tableHeaderView = searchBar;
}


#pragma mark - UISearchBarDelegate
// UISearchBarDelegate定义的方法，当搜索文本框内文本改变时激发该方法
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
//    NSLog(@"%@",searchText);
    if ([Utility isBlankString:searchText]) {
        // 放弃作为第一个响应者，关闭键盘
        [searchBar resignFirstResponder];
        _strSearch = searchText;
//        if ([self.tableView.mj_header isRefreshing] == YES) {
//            [self.tableView.mj_header endRefreshing];
//        }
//        [self headerRefreshing];
    }else{
        [self.tableView reloadData];
    }
}

// UISearchBarDelegate定义的方法，用户单击虚拟键盘上Search按键时激发该方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"----searchBarSearchButtonClicked------");
    // 调用filterBySubstring:方法执行搜索
    [self filterBySubstring:searchBar.text];
    // 放弃作为第一个响应者，关闭键盘
    [searchBar resignFirstResponder];
}

- (void)filterBySubstring:(NSString*) subStr
{
    NSLog(@"----filterBySubstring------");
    _strSearch = subStr;
    [self.dataArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *str = obj[@"nickName"];
        if ([str containsString:_strSearch]) {
            [self.searchArray addObject:obj];
        }
    }];
    
//    if ([self.tableView.mj_header isRefreshing] == YES) {
//        [self.tableView.mj_header endRefreshing];
//    }
//    [self headerRefreshing];
}

-(void)uiConfig
{
    [self addNavBtn:@"完成" isLeft:NO target:self action:@selector(rightBarAction:) bgImageName:nil];

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = BGCOLOR;
    //    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //去掉多余的分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableView];
//    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    
    [self.tableView setSeparatorColor:[Utility colorWithHexString:@"#efefef" alpha:1]];
}


- (void)rightBarAction:(UIButton *)btn {
     [LQProgressHud showLoading:@"正在加载..."];
    __block NSMutableArray *array = [NSMutableArray array];
    if ([Utility isBlankString:_strSearch]) {
        [self.dataArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            MY_LLAddNewMemberCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0]];
            if (cell.selectBtn.selected) {
                [array addObject:obj[@"id"]];
            }
        }];
    }else{
        [self.searchArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            MY_LLAddNewMemberCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0]];
            if (cell.selectBtn.selected) {
                [array addObject:obj[@"id"]];
            }
        }];
    }
    if (array.count<1)
    {
//        [LQProgressHud hide];
        [LQProgressHud showMessage:@"当前无选中好友"];
        return;
    }
    
    NSString *strList =  [array componentsJoinedByString:@","];
    [TLHTTPRequest MY_postWithBaseUrl:ClubInviteFriendJoin parameters:@{@"clubId":self.clubId,@"inviteList":strList} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([data[@"ret"] intValue] == 0) {
            [LQProgressHud hide];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"updateClubDetailUI" object:nil];
            [self.navigationController popViewControllerAnimated:NO];
        }else{
            [LQProgressHud showMessage:data[@"msg"]];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//        [LQProgressHud hide];
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
    
}

#pragma mark ---刷新
// 刷新
//- (void)headerRefreshing
//{
//    _page = 0;
//    [self downLoadData:_page isReshing:YES];
//}


#pragma mark - 下载数据
- (void)downLoadData{
    [LQProgressHud showLoading:@"正在加载..."];
    [TLHTTPRequest MY_getWithBaseUrl:ClubInvitedFriendList parameters:@{@"clubId":self.clubId} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([data[@"ret"] intValue] == 0) {
            self.dataArray = data[@"info"];
//            NSLog(@"%@",data);
            [LQProgressHud hide];
            if (self.dataArray.count>0) {
                [self.tableView reloadData];
            }
        }else{
             [LQProgressHud showMessage:data[@"msg"]];
        }
       
       
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud hide];
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
        
  
}

#pragma mark -- tableView 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (![Utility isBlankString:_strSearch]) {
        
        return [self.searchArray count];
    }
    else{
        
        return [self.dataArray count];
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return [Utility isBlankString:_strSearch] == NO ?  25 : 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict;
    if ([Utility isBlankString:_strSearch]) {
        dict = self.dataArray[indexPath.row];
    }else{
        dict = self.searchArray[indexPath.row];
    }
    
    static NSString *cellId = @"MY_LLAddNewMemberCell";
    MY_LLAddNewMemberCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_LLAddNewMemberCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.nickName.text = dict[@"nickName"];
    [cell.headIcon sd_setImageWithURL:dict[@"headIcon"]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MY_LLAddNewMemberCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.selectBtn.selected = !cell.selectBtn.selected;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 25)];
    
    headView.backgroundColor = BGCOLOR;
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH - 15, 25)];
    
//    if ([Utility isBlankString:_strSearch]) {
//        if ([self.dataArray count] == 0) {
//            titleLabel.text = @"";
//        }
//    } else {
//        if ([self.searchArray count] == 0) {
//            titleLabel.text = @"";
//        }
//    }
    titleLabel.textColor = [Utility colorWithHexString:@"#999999" alpha:1.0];
    titleLabel.text = @"我关注的人";
    titleLabel.font = [UIFont systemFontOfSize:12];
    
    [headView addSubview:titleLabel];
    
    return headView;
}



#pragma mark --数据源初始化
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
- (NSMutableArray *)searchArray{
    if (!_searchArray) {
        _searchArray = [[NSMutableArray alloc] init];
    }
    return _searchArray;
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
