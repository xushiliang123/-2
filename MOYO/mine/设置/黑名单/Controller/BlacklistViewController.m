//
//  BlacklistViewController.m
//  TogetherLu
//
//  Created by Louie on 16/12/29.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "BlacklistViewController.h"
#import "BlacklistTableViewCell.h"
#import "BlacklistModel.h"


@interface BlacklistViewController ()
{
    NSInteger _page;
}
@property (strong, nonatomic) NSMutableArray * blackListArray;

@end

@implementation BlacklistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.blackListArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    //    加载数据
    //    [self requestBlackListData];
    
    //  设置UI
    [self createUI];
}


#pragma mark - UI相关
- (void)createUI{
    
    [self createTableView];
    
    //    CGRect rect = self.tableView.frame;
    //    rect.origin.y = 64;
    //    self.tableView.frame = rect;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    [self.tableView registerClass:[BlacklistTableViewCell class] forCellReuseIdentifier:@"BlacklistTableViewCell"];
    
    self.tableView.tableFooterView = [UIView new];
    
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
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
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    
    [dict setObject:@(page) forKey:@"page"];
    __weak typeof (self) weakSelf = self;
    [TLHTTPRequest MY_getWithBaseUrl:BlackListUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if (_page == 1) {
            [self.blackListArray removeAllObjects];
        }
        if ([[data[@"info"] class] isSubclassOfClass:[NSArray class]]) {
            
            for (NSDictionary * dict in [data objectForKey:@"info"]) {
                
                BlacklistModel * model = [[BlacklistModel alloc]init];
                [model setValuesForKeysWithDictionary:dict];
                [self.blackListArray addObject:model];
                
                [self.tableView reloadData];
            }
            _page ++;
            [self.tableView.mj_header endRefreshing];
        }else {
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        if (isReshing) {
            [weakSelf.tableView.mj_header endRefreshing];
        }else {
            [weakSelf.tableView.mj_footer endRefreshing];
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"加载失败"];
        if (isReshing) {
            [weakSelf.tableView.mj_header endRefreshing];
        }else {
            [weakSelf.tableView.mj_footer endRefreshing];
        }
    }];
    
}


//移除拉黑
-(void)deleteBlackList:(NSString*)onUserId indexPath:(NSInteger)row{
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    [dict setObject:onUserId forKey:@"userId"];
    [dict setObject:@2 forKey:@"type"];
    [TLHTTPRequest MY_postWithBaseUrl:BlackUpdataUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            //            从数据源里面移除 刷新array
            [self.blackListArray removeObjectAtIndex:row];
            [self.tableView reloadData];
            
            EMError *error = [[EMClient sharedClient].contactManager removeUserFromBlackList:onUserId];
            if (!error) {
                NSLog(@"发送成功");
            }
        }else {
            
            if ([data objectForKey:@"msg"]) {
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
}


#pragma mark - tableView代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIAlertAction * confirmAct = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //    取出要拉黑的用户
        BlacklistModel * meModel = nil;
        if (self.blackListArray.count-1 >= indexPath.row) {
            meModel = [self.blackListArray objectAtIndex:indexPath.row];
            NSString * userID = [NSString stringWithFormat:@"%@", meModel.userId];
            [self deleteBlackList:userID indexPath:indexPath.row];
        }
    }];
    UIAlertAction * cancelAct = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertController * aleVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否将该用户移除黑名单" preferredStyle:UIAlertControllerStyleAlert];
    [aleVC addAction:cancelAct];
    [aleVC addAction:confirmAct];
    [self presentViewController:aleVC animated:YES completion:nil];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.blackListArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"BlacklistTableViewCell";
    
    BlacklistTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    cell.model = self.blackListArray[indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    headerView.backgroundColor = BGCOLOR;
    
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, SCREEN_WIDTH - 20, 50)];
    headerLabel.text = @"将某个用户放到这个列表中，你将不会收到任何关于该用户的聊天消息。";
    
    headerLabel.font = [UIFont systemFontOfSize:12];
    
    headerLabel.numberOfLines = 2;
    
    headerLabel.textColor = [UIColor colorWithRed:153.0/255 green:153.0/255 blue:153.0/255 alpha:1.0];
    
    [headerView addSubview:headerLabel];
    
    return headerView;
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
