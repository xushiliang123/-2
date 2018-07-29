//
//  MY_XTDetailActivityViewController.m
//  VTIME
//
//  Created by tingting on 2017/11/10.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTDetailActivityViewController.h"
#import "MY_TTLEditMateritalTableViewCell.h"

@interface MY_XTDetailActivityViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _page;
}
@property (strong, nonatomic) NSMutableArray* dataArray;

@property (nonatomic,strong) UIButton *JoinOrQuitbutton;
@property (nonatomic,strong) UIButton *Closebutton;

@end

@implementation MY_XTDetailActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"活动详情";
    self.view.backgroundColor = [UIColor colorWithRed:240/255.f green:240/255.f blue:240/255.f alpha:1.0f];
    
    [self CreateUI];
}

-(void)CreateUI
{
    UIView *detailView = [[UIView alloc]initWithFrame:CGRectMakeAuto(5, 9, 365, 190)];
    detailView.backgroundColor = [UIColor whiteColor];
    detailView.layer.cornerRadius = 5.0f;
    detailView.layer.masksToBounds = YES;
    [self.view addSubview:detailView];
    
    UIImageView *StartUserImageV = [[UIImageView alloc] initWithFrame:CGRectMakeAuto(13, 16, 41, 41)];
    StartUserImageV.image = [UIImage imageNamed:@"占位图"];
    
    StartUserImageV.layer.cornerRadius = 3.0f;
    StartUserImageV.layer.masksToBounds = YES;
    [detailView addSubview:StartUserImageV];
    
    UILabel *StartUserName = [[UILabel alloc]initWithFrame:CGRectMakeAuto(64, 18, 34, 16)];
    StartUserName.textColor = [Utility colorWithHexString:@"#2F2F2F" alpha:1.0f];
    StartUserName.font = [UIFont boldSystemFontOfSize:18 * SCREEN_WIDTH / 375];
    StartUserName.text = @"乔治";
    [detailView addSubview:StartUserName];
    [StartUserName sizeToFit];
    
    CGSize size = [Utility stringSizeWithString:StartUserName.text textSize:18 * SCREEN_WIDTH / 375 width:0 height:16 * SCREEN_HEIGHT / 667];
    CGRect StartUserNameRect = StartUserName.frame;
    StartUserNameRect.size.width = size.width + 5;
    StartUserName.frame = StartUserNameRect;
    
    UILabel *vipLabel = [[UILabel alloc]initWithFrame:CGRectMake(StartUserName.frame.origin.x + size.width + 5 * SCREEN_WIDTH / 375, StartUserName.frame.origin.y +  (StartUserName.frame.size.height - 12 * SCREEN_HEIGHT / 667)/2, 28 * SCREEN_WIDTH / 375, 12 * SCREEN_HEIGHT / 667)];
    vipLabel.backgroundColor = [Utility colorWithHexString:@"#FA4034" alpha:1.0f];
    vipLabel.layer.cornerRadius = 6 * SCREEN_HEIGHT / 667;
    vipLabel.layer.masksToBounds = YES;
    vipLabel.text = @"vip1";
    vipLabel.textAlignment = NSTextAlignmentCenter;
    vipLabel.textColor = [UIColor whiteColor];
    vipLabel.font = [UIFont boldSystemFontOfSize:7 * SCREEN_HEIGHT / 667];
    [detailView addSubview:vipLabel];
    
    UIImageView *ActivityImageV = [[UIImageView alloc] initWithFrame:CGRectMakeAuto(64, 47, 17, 17)];
    ActivityImageV.image = [UIImage imageNamed:@"shopping"];
    [detailView addSubview:ActivityImageV];
    
    UILabel *ActivityName = [[UILabel alloc]initWithFrame:CGRectMakeAuto(91, 47, 248, 17)];
    ActivityName.textColor = [Utility colorWithHexString:@"#2F2F2F" alpha:1.0f];
    ActivityName.font = [UIFont boldSystemFontOfSize:16 * SCREEN_WIDTH / 375];
    ActivityName.text = @"周末田林有没有约的";
    [detailView addSubview:ActivityName];
    [ActivityName sizeToFit];
    
    UILabel *ActivityTime = [[UILabel alloc]initWithFrame:CGRectMakeAuto(69, 72, 250, 15)];
    ActivityTime.textColor = [Utility colorWithHexString:@"#666666" alpha:1.0f];
    ActivityTime.font = [UIFont systemFontOfSize:15 * SCREEN_WIDTH / 375];
    ActivityTime.text = @"•    时间：10月18号";
    [detailView addSubview:ActivityTime];
    [ActivityTime sizeToFit];
    
    UILabel *ActivityPlace = [[UILabel alloc]initWithFrame:CGRectMakeAuto(69, 96, 250, 15)];
    ActivityPlace.textColor = [Utility colorWithHexString:@"#666666" alpha:1.0f];
    ActivityPlace.font = [UIFont systemFontOfSize:15 * SCREEN_WIDTH / 375];
    ActivityPlace.text = @"•    附近篮球场";
    [detailView addSubview:ActivityPlace];
    [ActivityPlace sizeToFit];
    
    UILabel *ActivityPerson = [[UILabel alloc]initWithFrame:CGRectMakeAuto(69, 121, 250, 15)];
    ActivityPerson.textColor = [Utility colorWithHexString:@"#666666" alpha:1.0f];
    ActivityPerson.font = [UIFont systemFontOfSize:15 * SCREEN_WIDTH / 375];
    ActivityPerson.text = @"•    需要六个小伙伴一起打比赛";
    [detailView addSubview:ActivityPerson];
    [ActivityPerson sizeToFit];
    
    UILabel *ActivityRedP = [[UILabel alloc]initWithFrame:CGRectMakeAuto(69, 145, 250, 15)];
    ActivityRedP.textColor = [Utility colorWithHexString:@"#666666" alpha:1.0f];
    ActivityRedP.font = [UIFont systemFontOfSize:15 * SCREEN_WIDTH / 375];
    ActivityRedP.text = @"•    无红包";
    [detailView addSubview:ActivityRedP];
    [ActivityRedP sizeToFit];
    
    _JoinOrQuitbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    _JoinOrQuitbutton.frame = CGRectMakeAuto(280, 143, 79, 36);
    _JoinOrQuitbutton.layer.cornerRadius = 5;
    [_JoinOrQuitbutton setTitle:@"参加活动" forState:UIControlStateNormal];
    [_JoinOrQuitbutton setTitleColor:[Utility colorWithHexString:@"#2F2F2F" alpha:1.0f] forState:UIControlStateNormal];
    _JoinOrQuitbutton.titleLabel.font = [UIFont boldSystemFontOfSize:15 * SCREEN_WIDTH/375];
    _JoinOrQuitbutton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_JoinOrQuitbutton setBackgroundColor:[Utility colorWithHexString:@"#DAB878" alpha:1.0f]];
    _JoinOrQuitbutton.enabled = NO;
    [_JoinOrQuitbutton addTarget:self action:@selector(JoinOrQuit:) forControlEvents:UIControlEventTouchUpInside];
    [detailView addSubview:_JoinOrQuitbutton];
    
    LMJTab * tab = [[LMJTab alloc] initWithFrame:CGRectMakeAuto(0, 220, 375, 46) lineWidth:0 lineColor:[UIColor blackColor]];
    [tab setItemsWithTitle:[NSArray arrayWithObjects:@"已报名",@"已参加", nil] normalItemColor:[Utility colorWithHexString:@"#999999" alpha:1.0f] selectItemColor:[Utility colorWithHexString:@"#DAB878" alpha:1.0f] normalTitleColor:[Utility colorWithHexString:@"#E3E1DF" alpha:1.0f] selectTitleColor:[Utility colorWithHexString:@"#28272B" alpha:1.0f] titleTextSize:18 * SCREEN_WIDTH/375 selectItemNumber:0];
    tab.delegate           = self;
    [self.view addSubview:tab];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMakeAuto(0, 266, 375, 220) style:UITableViewStylePlain];
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
    
    _Closebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    _Closebutton.frame = CGRectMakeAuto(152, 515, 71, 71);
    _Closebutton.layer.cornerRadius = 71 * SCREEN_HEIGHT / 667 / 2;
    _Closebutton.layer.masksToBounds = YES;
    [_Closebutton setTitle:@"关闭\n活动" forState:UIControlStateNormal];
    [_Closebutton setTitleColor:[Utility colorWithHexString:@"#DAB878" alpha:1.0f] forState:UIControlStateNormal];
    _Closebutton.titleLabel.font = [UIFont boldSystemFontOfSize:18 * SCREEN_WIDTH/375];
    _Closebutton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_Closebutton setBackgroundColor:[Utility colorWithHexString:@"#28272B" alpha:1.0f]];
    _Closebutton.enabled = NO;
    [_Closebutton addTarget:self action:@selector(JoinOrQuit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_Closebutton];
    
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
    return 55 * SCREEN_HEIGHT / 667;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellID = @"MY_TTLEditMateritalTableViewCell";
    MY_TTLEditMateritalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLEditMateritalTableViewCell" owner:self options:nil] lastObject];
    }
    cell.textLabel.text = @"李亚已报名参加，是否同意";
    cell.textLabel.textColor = [Utility colorWithHexString:@"#666666" alpha:1.0f];
    cell.textLabel.font = [UIFont systemFontOfSize:15 * SCREEN_WIDTH / 375];
    cell.detailLabel.hidden  = YES;
    cell.titleLabel.hidden = YES;
    cell.textField.hidden = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)JoinOrQuit:(UIButton *)btn
{
    
}

-(void)tab:(LMJTab *)tab didSelectedItemNumber:(NSInteger)number{
//    NSLog(@"CLICKED:%ld",number);
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

CG_INLINE CGRect//注意：这里的代码要放在.m文件最下面的位置
CGRectMakeAuto(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    CGRect rect;
    rect.origin.x = x * SCREEN_WIDTH/375;
    rect.origin.y = y * SCREEN_HEIGHT/667;
    rect.size.width = width * SCREEN_WIDTH/375;
    rect.size.height = height * SCREEN_HEIGHT/667;
    return rect;
}

@end
