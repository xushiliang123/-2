//
//  BlacklistViewController.m
//  TogetherLu
//
//  Created by Louie on 16/12/29.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLIncomeDetailViewController.h"
#import "MY_TTLIncomeDetailsTableViewCell.h"
#import "MY_TTLIncomeModel.h"
#import "MY_TTLIncomeChooseView.h"

@interface MY_TTLIncomeDetailViewController ()
{
    NSInteger _page;
    NSInteger _type;
}
@property (strong, nonatomic) NSMutableArray * dataArray;

@end

@implementation MY_TTLIncomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"收益明细";
    _type = 0;
    [self addNavBtn:@"筛选" isLeft:NO target:self action:@selector(shaixuanAction) bgImageName:nil];
    //  设置UI
    [self createUI];
}

-(void)shaixuanAction
{
    MY_TTLIncomeChooseView* alert = [[MY_TTLIncomeChooseView alloc]initWithFrame:CGRectMake(0, - 104, SCREEN_WIDTH, 104) withChoose:_type];
    
    [UIView animateWithDuration:0.2 animations:^{
        [alert show];
    }];
    alert.blockType = ^(NSInteger index){
        _type = index;
        [self headerRefreshing];
    };
}

#pragma mark - UI相关
- (void)createUI{
    
    [self createTableView];
    
	CGRect rect = self.tableView.frame;
	rect.size.height = rect.size.height - 64;
	self.tableView.frame = rect;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    self.tableView.tableFooterView = [UIView new];
    
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
    [dict setObject:@(_page) forKey:@"page"];
    [dict setObject:[self typeIndex:_type] forKey:@"type"];
    [TLHTTPRequest MY_postWithBaseUrl:ConsumeDetailURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
    
            if ([[data objectForKey:@"info"] count] ) {
                NSArray * dataArray = [data objectForKey:@"info"];
                
                if ( 1 == _page) {
                    [self.dataArray removeAllObjects];
                }
                
                for (NSDictionary* dic in dataArray) {
                    
                    MY_TTLIncomeModel * model = [[MY_TTLIncomeModel alloc]init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.dataArray addObject:model];
                }
                
                [self.tableView reloadData];
                
                _page ++;
            }else{
                
                if ( 1 == _page) {
                    [self.dataArray removeAllObjects];
                }
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
#pragma mark - tableView代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 81;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"MY_TTLIncomeDetailsTableViewCell";
    MY_TTLIncomeDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLIncomeDetailsTableViewCell" owner:self options:nil] lastObject];
    }
    [cell showDetail:self.dataArray[indexPath.row]];
    return cell;
}


-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}


-(NSNumber *)typeIndex:(NSInteger)index
{
    NSNumber* num = [[NSNumber alloc]init];
    if (index == 0) {
        num = @-1;
    }
    else if (index == 1)
    {
        num = @1;
    }
    else if (index == 2)
    {
        num = @2;
    }
    else if (index == 3)
    {
        num = @132;
    }
    else if (index == 4)
    {
        num = @133;
    }
    else if (index == 5)
    {
        num = @134;
    }
    return num;
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
