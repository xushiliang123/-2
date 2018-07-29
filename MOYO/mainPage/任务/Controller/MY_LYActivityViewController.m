//
//  MY_XTActivityViewController.m
//  VTIME
//
//  Created by tingting on 2017/11/7.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LYActivityViewController.h"
#import "MY_XTActivityTableViewCell.h"
#import "MY_LYCreateAnActivityViewController.h"
#import "MY_XTDetailActivityViewController.h"
#import "MY_GLTaskApplyInfoViewController.h"

#import "TopScrollView.h"

//model
#import "MY_LYTaskListModel.h"

static NSString * titleTip = @"";



@interface MY_LYActivityViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _page;
    UIImageView * _imageView;
    UILabel * _placeLabel;
    
}
@property (strong, nonatomic) NSMutableArray* dataArray;
@property (nonatomic, strong) UILabel * nullTitleLabel;

@end

@implementation MY_LYActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self uiConfig];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateData) name:@"MY_XTActivityViewUpdate" object:nil];
}

- (void)updateData{
    [self UpdateUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
    
    [self UpdateUI];
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"addheight" object:self userInfo:@{@"height":@(SCREEN_HEIGHT)}];
//    [self.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
}

-(void)UpdateUI
{
    _page = 1;
    [self downLoadData:_page isReshing:YES];
}


-(void)uiConfig
{
//    [self addNavBtn:@"发起" isLeft:NO target:self action:@selector(rightChooseClick) bgImageName:nil];
    
    [self createTableView];
    CGRect rect = self.tableView.frame;
    rect.size.height = SCREEN_HEIGHT-64;
    self.tableView.frame = rect;
    
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleSingleLine)];
    [self.tableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    self.tableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
//    [self.view addSubview:self.tableView];
    //    [self.tableView registerClass:[MY_TTLClubHomeTableViewCell class] forCellReuseIdentifier:@"MY_TTLClubHomeTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_XTActivityTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_XTActivityTableViewCell"];
    
    self.tableView.estimatedRowHeight = 240.0;
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    self.tableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
//    [self.tableView.mj_header beginRefreshing];
    
    
    //  无任务提示
    CGFloat y = ([UIScreen mainScreen].bounds.size.height - 150 - 64 -49) / 2;
    
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - 115) / 2;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, 115, 110)];
    
    _imageView.image = [UIImage imageNamed:@"EaseUIResource.bundle/noMessage"];
    
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    _imageView.layer.masksToBounds = YES;
    
    [self.view addSubview:_imageView];
    
    _placeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame) + 23, [UIScreen mainScreen].bounds.size.width, 17)];
    _placeLabel.text = @"赶紧参与或发起任务吧...";
    _placeLabel.textAlignment = NSTextAlignmentCenter;
    _placeLabel.textColor = [UIColor colorWithRed:153 / 255.0 green:153 / 255.0 blue:153 / 255.0 alpha:1.0];
    [self.view addSubview:_placeLabel];
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
//    [LQProgressHud showLoading:nil];

    [TLHTTPRequest MY_getWithBaseUrl:TaskListURL parameters:self.selecteDictionary success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull dict) {

        if ([[dict objectForKey:@"ret"] integerValue] == 0) {
//            [LQProgressHud hide];
            if ( 1 == _page) {
                [self.dataArray removeAllObjects];
            }
            if ([[dict objectForKey:@"info"] count] ) {
                NSArray * dataArray = [dict objectForKey:@"info"];

                for (NSDictionary* dic in dataArray) {
                    // Tag  int    0就是与我无关 1就是我参与的 2就是我报名的 3我发布的
                    MY_LYTaskListModel * model = [[MY_LYTaskListModel alloc]init];
                    [model setValuesForKeysWithDictionary:dic];

                    model.decHeight = 0.0;
                    if([model.taskInfo length]){
                        model.decHeight = [Utility stringSizeWithString:model.taskInfo textSize:14 width:SCREEN_WIDTH - 84 height:0].height;
                    }
                    [self.dataArray addObject:model];
                }

                _page ++;
                
                if (self.dataArray.count > 0) {
                    self.nullTitleLabel.hidden = YES;
                }else {
                    self.nullTitleLabel.hidden = NO;
                }
            }
            [self.tableView reloadData];

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
    
    if (self.dataArray.count > 0) {
        _imageView.hidden = YES;
        _placeLabel.hidden = YES;
    } else {
        _imageView.hidden = NO;
        _placeLabel.hidden = NO;
    }
    
    return [self.dataArray count];
//    return 5;
}
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    MY_LYTaskListModel * model = self.dataArray[indexPath.row];

    return 136 + model.decHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"MY_XTActivityTableViewCell";
    MY_XTActivityTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    if([self.dataArray count] >= indexPath.row){
        
        MY_LYTaskListModel * model = self.dataArray[indexPath.row];
        [cell setValueWithModel:model];
    }
    
    /*
     //  同意/拒绝 参与任务
     #define TaskAgreeURL @"/dataapi/cg/task/agree"
     //  完成任务
     #define TaskFinishURL @"/dataapi/cg/task/finish"
     //  终止任务
     #define TaskOverURL @"/dataapi/cg/task/over"
     //  拾取任务
     #define TaskPickURL @"/dataapi/cg/task/pick"
     */
    
    // 点击 任务状态
    cell.taskblock = ^(MY_XTActivityTableViewCell * taskCell,UIButton * btn) {
    
//        NSString * taskState = nil;
        switch ([taskCell.taskModel.tagNum integerValue]) {
            case 0:{
                //@"领取任务";
//                [LQProgressHud showLoading:nil];

                if (!taskCell.taskModel.taskId) {
                    [self headerRefreshing];
                }
                
                [TLHTTPRequest MY_postWithBaseUrl:TaskPickURL parameters:@{@"taskId":taskCell.taskModel.taskId} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//                    [LQProgressHud hide];

                    if (0 == [[data objectForKey:@"ret"] integerValue]) {

                        [self headerRefreshing];

                        //  StatusNotOnHomeReceiveTask 16001 //参与任务时候，当前用户没有上首页
                    }else if(StatusNotOnHomeReceiveTask == [[data objectForKey:@"ret"] integerValue]){
                        
                        [LQProgressHud showFailure:@"您还没有上首页"];
                        
                    }else{
                        
                        if ([data objectForKey:@"msg"]) {
                            [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                        }
                        
                    }
                } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                        
                    [LQProgressHud showFailure:@"请求失败，请检查网络"];
                }];
                
                break;
            }
            case 1:{
                
                //  @"进行中";
                
                break;
            }
            case 2:{
                //  @"已报名";
                
                break;
            }
            case 3:{
                //  @"XX人已报名";
                
                //  中止任务
                if(1000 == btn.tag){
                    
//                    [LQProgressHud showLoading:nil];
                    [TLHTTPRequest MY_postWithBaseUrl:TaskOverURL parameters:@{} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                        if ([[data objectForKey:@"ret"] integerValue] == 0) {
                            //  刷新数据
                            [self headerRefreshing];
//                            [self.tableView.mj_header beginRefreshing];

//                            [LQProgressHud hide];
                            
                        //  #define StatusNotCompliteTask 16002 //  用户中止任务时，当前没有未完成的任务
                        }else if (StatusNotCompliteTask == [[data objectForKey:@"ret"] integerValue]){
                           
                            [LQProgressHud showFailure:@"当前没有未完成的任务"];
                            
                        }else{
                            if ([data objectForKey:@"msg"]) {
                                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                            }
                        }
                    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                        [LQProgressHud showFailure:@"请求失败，请检查网络"];
                    }];
                }else{
                    
                    //  跳转到申请列表
                    MY_GLTaskApplyInfoViewController * vc = [MY_GLTaskApplyInfoViewController new];
                    vc.taskId = taskCell.taskModel.taskId;
                    [self.controllerView.navigationController pushViewController:vc animated:YES];
                }
                
                break;
            }
            default:
            
            break;
        }
    };
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    MY_XTDetailActivityViewController *detailVC = [[MY_XTDetailActivityViewController alloc]init];
//    detailVC.hidesBottomBarWhenPushed = YES;
//    [self.controllerView.navigationController pushViewController:detailVC animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
    
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
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
