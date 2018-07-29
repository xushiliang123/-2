//
//  MY_LLAddressListViewController.m
//  VTIME
//
//  Created by Louie on 2017/9/9.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LYAddressListViewController.h"
#import "JGTeamMemberManager.h"
#import "MY_LLAddressListCell.h"

// 俱乐部列表VC
#import "MY_GLClubListViewController.h"
@interface MY_LYAddressListViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
    UITableView* _tableView;
    NSInteger _page;
    //    NSMutableDictionary* _dataAccountDict;
    NSString* _strSearch;
    
    NSInteger _newFriendNum;
    UILabel * _footLabel;
    NSInteger _numberOfPeople;
    
    UILabel* _labelNum;
    
}

@property (strong, nonatomic)NSMutableArray *keyArray;
@property (strong, nonatomic)NSMutableArray *listArray;

@property (strong, nonatomic)NSMutableArray *keyArrayNew;
@property (strong, nonatomic)NSMutableArray *listArrayNew;

@property (strong, nonatomic) NSMutableArray* dataArray;
@property (strong, nonatomic) NSMutableArray* searchArray;

@property (strong, nonatomic)UIButton * clubLabtn;
@property (strong, nonatomic)UIView * tableHeader;

@end



@implementation MY_LYAddressListViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(1, 1, 1, 1)];
    [self.view addSubview:view];
    
    //    _dataAccountDict = [[NSMutableDictionary alloc]init];
    
    [self uiConfig];
    [self createHeaderView];
    
    [_tableView.mj_header beginRefreshing];
    
}


-(void)createHeaderView
{
    // 创建UISearchBar对象
    
    self.tableHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , 98)];
    self.tableHeader.backgroundColor = BGCOLOR;
    
    // 搜索框
    UISearchBar* searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 12, 49)];
    // 设置没有输入时的提示占位符
    [searchBar setPlaceholder:@"对方昵称"];
    // 显示Cancel按钮
    searchBar.showsCancelButton = NO;
    // 设置代理
    searchBar.delegate = self;
    //    searchBar.searchBarStyle = UISearchBarStyleMinimal;
    //    [searchBar setBackgroundImage:[UIImage new]];
    searchBar.layer.borderWidth = 1;
    searchBar.layer.borderColor = [BGCOLOR CGColor];
    searchBar.barTintColor = BGCOLOR;
    [self.tableHeader addSubview:searchBar];
    
    // 俱乐部列表
    
    self.clubLabtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.clubLabtn setFrame:CGRectMake(0, CGRectGetMaxY(searchBar.frame), SCREEN_WIDTH, 49)];
    [self.clubLabtn addTarget:self action:@selector(gotoGroupListClickMethod:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.clubLabtn setImage:[UIImage imageNamed:@"clubListIcon"] forState:(UIControlStateNormal)];
    [self.clubLabtn setTitleColor:COlOR333 forState:(UIControlStateNormal)];
    [self.clubLabtn setTitle:@"  俱乐部" forState:(UIControlStateNormal)];
    self.clubLabtn.titleLabel.font = [UIFont systemFontOfSize:14];
    self.clubLabtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.clubLabtn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    self.clubLabtn.imageEdgeInsets = UIEdgeInsetsMake(10, 15,10, 0);
    self.clubLabtn.backgroundColor = [UIColor whiteColor];
    [self.tableHeader addSubview:self.clubLabtn];

    _tableView.tableHeaderView = self.tableHeader;
    
}


#pragma mark - UISearchBarDelegate
// UISearchBarDelegate定义的方法，当搜索文本框内文本改变时激发该方法
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{

    if ([Utility isBlankString:searchText]) {
        // 放弃作为第一个响应者，关闭键盘
        [searchBar resignFirstResponder];
        _strSearch = searchText;
        if ([_tableView.mj_header isRefreshing] == YES) {
            [_tableView.mj_header endRefreshing];
        }
        [self headerRefreshing];
        
        if (!_strSearch.length) {
            // 把俱乐部Btn  隐藏
            self.clubLabtn.hidden = NO;
            self.tableHeader.bounds = CGRectMake(0, 0, SCREEN_WIDTH, 98);
        }
        
    }
}

// UISearchBarDelegate定义的方法，用户单击虚拟键盘上Search按键时激发该方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    // 把俱乐部Btn  隐藏
    self.clubLabtn.hidden = YES;
    self.tableHeader.bounds = CGRectMake(0, 0, SCREEN_WIDTH, 49);
    
//    NSLog(@"----searchBarSearchButtonClicked------");
    // 调用filterBySubstring:方法执行搜索
    [self filterBySubstring:searchBar.text];
    // 放弃作为第一个响应者，关闭键盘
    [searchBar resignFirstResponder];
}

- (void) filterBySubstring:(NSString*) subStr
{
//    NSLog(@"----filterBySubstring------");
    _strSearch = subStr;
    
    if ([_tableView.mj_header isRefreshing] == YES) {
        [_tableView.mj_header endRefreshing];
    }
    [self headerRefreshing];
}

// 跳转俱乐部列表
-(void)gotoGroupListClickMethod:(UIButton*)sender{
    
    MY_GLClubListViewController * clubListVC = [MY_GLClubListViewController alloc];
    [self.controllerView.navigationController pushViewController:clubListVC animated:YES];
    
}

-(void)uiConfig
{

    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = BGCOLOR;
    //    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //去掉多余的分割线
    _tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_tableView];
    _tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    
    [_tableView setSeparatorColor:[Utility colorWithHexString:@"#efefef" alpha:1]];

    [self createFooterView];
}

-(void)createFooterView
{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 35)];
    
    _labelNum  = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 35)];
    _labelNum.textColor = [Utility colorWithHexString:@"666666" alpha:1];
    _labelNum.font      = [UIFont systemFontOfSize:18];
    _labelNum.textAlignment = NSTextAlignmentCenter;
    [view addSubview:_labelNum];
    _tableView.tableFooterView = view;
}

#pragma mark ---刷新
// 刷新
- (void)headerRefreshing
{
    _page = 0;
    [self downLoadData:_page isReshing:YES];
}


#pragma mark - 下载数据
- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing{
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    
    if (![Utility isBlankString:_strSearch]) {
        
        [dict setObject:_strSearch forKey:@"nickName"];
        
        [TLHTTPRequest MY_getWithBaseUrl:AddressListURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            
            if ([[data objectForKey:@"ret"] boolValue] == 0) {
                if ([data objectForKey:@"info"]) {
                    _newFriendNum = [[data objectForKey:@"info"] count];
                    //                    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];
                    //                    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                    [_tableView reloadData];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            
        }];
    }
    
    [TLHTTPRequest MY_getWithBaseUrl:AddressListURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
            if (![Utility isBlankString:_strSearch]) {//_str为空则没搜索，否则为搜索
                [self.searchArray removeAllObjects];
                [self.listArrayNew removeAllObjects];
                [self.keyArrayNew removeAllObjects];
                if ([data objectForKey:@"info"]) {
                    
                    for (NSDictionary* dictData in [data objectForKey:@"info"]) {
                        MY_LYPersonInfoModel * model = [[MY_LYPersonInfoModel alloc]init];
                        [model setValuesForKeysWithDictionary:dictData];
//                        NSString* str = [NSString stringWithFormat:@"%@|%@",model.region, model.distance];
//                        CGSize sizeW = [Utility stringSizeWithString:str textSize:11 width:0 height:13];
//                        model.disSize = sizeW;
                        [self.searchArray addObject:model];
                    }
                    
                    self.listArrayNew = [[NSMutableArray alloc]initWithArray:[JGTeamMemberManager archiveNumbers:self.searchArray]];
                    self.keyArrayNew = [[NSMutableArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#", nil];
                    for (int i = (int)self.listArrayNew.count-1; i>=0; i--) {
                        if ([self.listArrayNew[i] count] == 0) {
                            [self.keyArrayNew removeObjectAtIndex:i];
                            [self.listArrayNew removeObjectAtIndex:i];
                        }
                    }
                    _labelNum.hidden = YES;
                    _page ++;
                    [_tableView reloadData];
                }
            }
            else{
                [self.searchArray removeAllObjects];
                [self.listArrayNew removeAllObjects];
                [self.keyArrayNew removeAllObjects];
                [self.dataArray removeAllObjects];
                [self.listArray removeAllObjects];
                [self.keyArray removeAllObjects];
                
                if ([data objectForKey:@"info"]) {
                    
                    for (NSDictionary* dictData in [data objectForKey:@"info"]) {
                        MY_LYPersonInfoModel* model = [[MY_LYPersonInfoModel alloc]init];
                        [model setValuesForKeysWithDictionary:dictData];
//                        NSString* str = [NSString stringWithFormat:@"%@| %@",model.region,model.distance];
//                        CGSize sizeW = [Utility stringSizeWithString:str textSize:11 width:0 height:13];
//                        model.disSize = sizeW;
                       
                        [self.dataArray addObject:model];
                    }
                    self.listArray = [[NSMutableArray alloc]initWithArray:[JGTeamMemberManager archiveNumbers:self.dataArray]];
                    _labelNum.text      = [NSString stringWithFormat:@"%td位关注的人",self.dataArray.count];
                    self.keyArray = [[NSMutableArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#", nil];
                    
                    for (int i = (int)self.listArray.count-1; i>=0; i--) {
                        if ([self.listArray[i] count] == 0) {
                            [self.keyArray removeObjectAtIndex:i];
                            [self.listArray removeObjectAtIndex:i];
                        }
                    }
                    _labelNum.hidden = NO;
                    _page ++;
                    
                    [_tableView reloadData];
                }
            }
            
            
        }else {
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        if (isReshing) {
            [_tableView.mj_header endRefreshing];
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"请求失败，请检查网络"];
        if (isReshing) {
            [_tableView.mj_header endRefreshing];
        }
    }];
}

#pragma mark -- tableView 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [Utility isBlankString:_strSearch] == NO ? self.listArrayNew.count : self.listArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (![Utility isBlankString:_strSearch]) {
        
        return [self.listArrayNew[section] count];
    }
    else{

        return [self.listArray[section] count];
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return [Utility isBlankString:_strSearch] == NO ?  25 : 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *MY_TTLAddressBookTableViewCellID = @"MY_LLAddressListCell";
    MY_LLAddressListCell *cell = [tableView dequeueReusableCellWithIdentifier:MY_TTLAddressBookTableViewCellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_LLAddressListCell" owner:self options:nil] lastObject];
    }
    
    if (![Utility isBlankString:_strSearch]) {
        
        cell.model = self.listArrayNew[indexPath.section][indexPath.row];
    }
    else{
        cell.model = self.listArray[indexPath.section][indexPath.row];

    }
    
    __weak typeof(self) wSelf = self;
    cell.headIconGestureBlock = ^(MY_LYPersonInfoModel *model) {
        
        MY_TTLSelfCenterViewController* selfVc = [[MY_TTLSelfCenterViewController alloc]init];
        
        selfVc.userID = [NSString stringWithFormat:@"%td", model.userId];
        
        [wSelf.controllerView.navigationController pushViewController:selfVc animated:YES];
    };

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

// 右侧索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    //  改变索引颜色
    if ([Utility isBlankString:_strSearch]) {
        _tableView.sectionIndexColor = GOLDCOLOR;
        NSInteger number = [self.listArray count];
        return [self.keyArray subarrayWithRange:NSMakeRange(0, number)];
    }
    else{
        _tableView.sectionIndexColor = GOLDCOLOR;
        NSInteger number = [self.listArrayNew count];
        return [self.keyArrayNew subarrayWithRange:NSMakeRange(0, number)];
    }
}

//点击索引跳转到相应位置
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if ([Utility isBlankString:_strSearch]) {
        NSIndexPath *selectIndexPath = [NSIndexPath indexPathForRow:0 inSection:index];
        if (![self.listArray[index] count]) {
            return 0;
        }else{
            [tableView scrollToRowAtIndexPath:selectIndexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
            return index;
        }
    }
    else{
        NSIndexPath *selectIndexPath = [NSIndexPath indexPathForRow:0 inSection:index];
        if (![self.listArrayNew[index] count]) {
            return 0;
        }else{
            [tableView scrollToRowAtIndexPath:selectIndexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
            return index;
        }
    }
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 25)];
    
    headView.backgroundColor = BGCOLOR;
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH - 15, 25)];
    
    if ([Utility isBlankString:_strSearch]) {
        if ([self.listArray[section] count] == 0) {
            titleLabel.text = @"";
        }else{
            titleLabel.text = self.keyArray[section];
        }
    } else {
   
        if ([self.listArrayNew[section] count] == 0) {
            titleLabel.text = @"";
        }else{
            titleLabel.text = self.keyArrayNew[section];
        }
    }
    titleLabel.textColor = [Utility colorWithHexString:@"#999999" alpha:1.0];
    
    titleLabel.font = [UIFont systemFontOfSize:12];
    
    [headView addSubview:titleLabel];
    
    return headView;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
    
    MY_LYPersonInfoModel * model = self.listArray[indexPath.section][indexPath.row];
//
    NSString * userIdStr = [NSString stringWithFormat:@"%td", model.userId];
//
//    ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:userIdStr conversationType:EMConversationTypeChat];
//    chatController.model = model;
////    chatController.userId = userIdStr;
////    chatController.title = model.nickName;
////    chatController.headIcon = model.headIcon;
//    [chatController setHidesBottomBarWhenPushed:YES];
//    [self.controllerView.navigationController pushViewController:chatController animated:YES];
    
    MY_TTLSelfCenterViewController* selfVc = [[MY_TTLSelfCenterViewController alloc]init];
//    selfVc.hidesBottomBarWhenPushed = YES;
    selfVc.userID = userIdStr;
    [self.controllerView.navigationController pushViewController:selfVc animated:YES];
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
- (NSMutableArray *)keyArray{
    if (!_keyArray) {
        _keyArray = [[NSMutableArray alloc] init];
    }
    return _keyArray;
}
- (NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray = [[NSMutableArray alloc] init];
    }
    return _listArray;
}
- (NSMutableArray *)listArrayNew{
    if (!_listArrayNew) {
        _listArrayNew = [[NSMutableArray alloc] init];
    }
    return _listArrayNew;
}
- (NSMutableArray *)keyArrayNew{
    if (!_keyArrayNew) {
        _keyArrayNew = [[NSMutableArray alloc] init];
    }
    return _keyArrayNew;
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
