//
//  MyInfomationViewController.m
//  TogetherLu
//
//  Created by Louie on 17/1/24.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MyInfomationViewController.h"
#import "MyInfoTableViewCell.h"
#import "VideoResolutionModel.h"


@interface MyInfomationViewController ()
{
    NSInteger _page;
}
@property (nonatomic, strong) NSMutableArray * dataArray;

@end

@implementation MyInfomationViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
//        NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
//        [defaultCenter addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tabBarController.tabBar hideBadgeOnItemIndex:4];

}

//
//#pragma mark - 极光推送
//- (void)networkDidReceiveMessage:(NSNotification *)not{
//    
//    NSDictionary * userInfo = not.userInfo;
//    
//    if ([userInfo[@"title"] isEqualToString:@"动态消息"]) {
//    
//        NSString *content = [userInfo valueForKey:@"content"];
//        
//        NSData *jsonData = [content dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
//        
//        MyDynamicModel * model = [[MyDynamicModel alloc] init];
//        
//        [model setValuesForKeysWithDictionary:dicData];
//        
//        model.commentHeight = [Utility stringSizeWithString:model.comment textSize:14 width:SCREEN_WIDTH - 173 height:0].height + 1;
//        
//        @synchronized (self.dataArray) {
//            if (self.dataArray.count > 0) {
//                [self.dataArray insertObject:model atIndex:0];
//            } else {
//                [self.dataArray addObject:model];
//            }
//        }
//        
//        [self.tableView reloadData];
//    }
//    [self.tabBarController.tabBar showBadgeOnItemIndex:4];
//}
//

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _page = 1;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hiddenRedBadgeView" object:nil];
    
//    UINavigationController * nav = self.tabBarController.viewControllers[4];
//    
//    NSArray * vcArray = nav.viewControllers;
//    
//    for (UIViewController * myVC in vcArray) {
// 
//        if ([myVC isKindOfClass:[MyViewController class]]) {
//            
//            MyViewController * vc = (MyViewController *)myVC;
//            
//            @synchronized (self.dataArray) {
//            
//                [self.dataArray addObjectsFromArray:vc.dynamicArray];
//            }
//            [self.tableView reloadData];
//            continue;
//        }
//    }
    [self setUI];
    
    [self headerRefreshing];
}


#pragma mark - UI
- (void)setUI{
    
    [self createTableView];
    
    self.tableView.backgroundColor = BGCOLOR;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    CGRect rect = self.tableView.frame;
    rect.size.height = SCREEN_HEIGHT - NavigationHeight - StatusHeight;
    self.tableView.frame = rect;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MyInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyInfoTableViewCell"];
    
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    self.tableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
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

#pragma mark - 数据
- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing{
    
    NSMutableDictionary* parameters = [[NSMutableDictionary alloc]init];

    [parameters setObject:@(_page) forKey:@"page"];
    [TLHTTPRequest MY_getWithBaseUrl:zanListURL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
            NSArray * list = data[@"info"];
            
            if ([[list class] isSubclassOfClass:[NSArray class]]) {
                
                
                if (1 == _page) {
                    [self.dataArray removeAllObjects];
                }
                
                if ([data objectForKey:@"info"]) {
                
                    
                for (NSDictionary * dic in list) {
                    VideoResolutionModel * model = [[VideoResolutionModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    
                    model.dynamicHeight = [Utility stringSizeWithString:model.content textSize:14 width:SCREEN_WIDTH - 173 height:0].height + 1;
                    
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
#pragma mark - 数据
- (NSMutableArray *)dataArray{
    if (nil == _dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

#pragma mark - 代理相关
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    
//    return 42;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //公用的cell
    static NSString * cellID = @"MyInfoTableViewCell";

    if (self.dataArray.count > 0) {
        
        VideoResolutionModel * model = self.dataArray[indexPath.row];

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
        
        cell.model = model;
        
        return cell;
    }
    return nil;
}


#pragma mark - 手势事件
//  头像点击
- (void)headIconTapGesture:(UITapGestureRecognizer *)tap {

    UIImageView * imageView = (UIImageView *)tap.view;
    VideoResolutionModel * model = self.dataArray[imageView.tag];
    
    MY_TTLSelfCenterViewController* selfVc = [[MY_TTLSelfCenterViewController alloc]init];
    selfVc.userID = [NSString stringWithFormat:@"%@", model.userId];
    [self.navigationController pushViewController:selfVc animated:YES];
}



- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    
//    UILabel * footLabel = [Utility createLabeltitleColor:[Utility colorWithHexString:@"#333333" alpha:1.0] frame:CGRectMake(0, 0, SCREEN_WIDTH, 42) BackgroundColor:BGCOLOR textSize:12];
//    
//    footLabel.textAlignment = NSTextAlignmentCenter;
//    
//    footLabel.text = @"查看历史消息";
//    
//    return footLabel;
//}



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
