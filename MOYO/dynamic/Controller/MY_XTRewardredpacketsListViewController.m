//
//  MY_XTRewardredpacketsListViewController.m
//  VTIME
//
//  Created by tingting on 2017/11/21.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTRewardredpacketsListViewController.h"
#import "MyInfoTableViewCell.h"
#import "MY_XTRrpModel.h"

@interface MY_XTRewardredpacketsListViewController ()
{
    NSInteger _page;
}
@property (strong, nonatomic) NSMutableArray * dataArray;

@end

@implementation MY_XTRewardredpacketsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"打赏列表";
    [self createUI];
    [self headerRefreshing];
}

#pragma mark - UI相关
- (void)createUI{
    
    [self createTableView];
    
    CGRect rect = self.tableView.frame;
    rect.size.height = SCREEN_HEIGHT- NavigationHeight - StatusHeight - TabbarHeight;
    self.tableView.frame = rect;
    
    self.tableView.backgroundColor = BGCOLOR;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MyInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyInfoTableViewCell"];
    
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
    NSMutableDictionary* parameters = [[NSMutableDictionary alloc]init];
    
    [parameters setObject:@(_page) forKey:@"page"];
    [parameters setObject:self.did forKey:@"did"];
    [TLHTTPRequest MY_getWithBaseUrl:dashangListURL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
            NSArray * list = data[@"info"];
            
            if ([[list class] isSubclassOfClass:[NSArray class]]) {
                
                
                if (1 == _page) {
                    [self.dataArray removeAllObjects];
                }
                
                if ([data objectForKey:@"info"]) {
                    
                    
                    for (NSDictionary * dic in list) {
                        MY_XTRrpModel * model = [[MY_XTRrpModel alloc] init];
                        [model setValuesForKeysWithDictionary:dic];
                        
//                        model.dynamicHeight = [Utility stringSizeWithString:model.content textSize:14 width:SCREEN_WIDTH - 173 height:0].height + 1;
                        
                        [self.dataArray addObject:model];
                        
                    }
                    
                    [self.tableView reloadData];
                    _page++;
                }
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
    }];
}
#pragma mark - tableView代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //公用的cell
    static NSString * cellID = @"MyInfoTableViewCell";
    
    if (self.dataArray.count > 0) {
        
        MY_XTRrpModel * model = self.dataArray[indexPath.row];
        
        MyInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        
        cell.headImageView.tag = indexPath.row;
        cell.headImageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * headTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headIconTapGesture:)];
        [cell.headImageView addGestureRecognizer:headTap];
        
        //        cell.rightImageView.tag = 1000 + indexPath.row;
        //        cell.rightImageView.userInteractionEnabled = YES;
        //        UITapGestureRecognizer * rightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightTapGesture:)];
        //        [cell.rightImageView addGestureRecognizer:rightTap];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.xtmodel = model;
        
        
        return cell;
    }
    return nil;
}

- (void)headIconTapGesture:(UITapGestureRecognizer *)tap {
    
    UIImageView * imageView = (UIImageView *)tap.view;
    VideoResolutionModel * model = self.dataArray[imageView.tag];
    
    MY_TTLSelfCenterViewController* selfVc = [[MY_TTLSelfCenterViewController alloc]init];
    selfVc.userID = [NSString stringWithFormat:@"%@", model.userId];
    [self.navigationController pushViewController:selfVc animated:YES];
}


-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
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
