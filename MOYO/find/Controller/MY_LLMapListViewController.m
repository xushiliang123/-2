//
//  MY_LLMapListViewController.m
//  TogetherLu
//
//  Created by MadridLee on 2017/8/9.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_LLMapListViewController.h"
#import "MY_LLAddressListCell.h"
#import "MAAnnotationCluster.h"


@interface MY_LLMapListViewController ()
{
    UIBarButtonItem* _rightItem;
}

@property (strong, nonatomic) NSMutableArray* dataArray;

@end

@implementation MY_LLMapListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray array];
    
    for (MAAnnotationCluster * cluster in self.list) {
        
        MY_LYPersonInfoModel * model = [[MY_LYPersonInfoModel alloc] init];
        
        model.nickName = cluster.nickName;
        model.userId = cluster.userId.integerValue;
        model.headIcon = cluster.headIcon;
        model.sex = cluster.sex.integerValue;
        model.consumptionLevel = cluster.consumptionLevel.integerValue;
        model.age = cluster.age.integerValue;
        model.distance = cluster.distance;
        model.height = cluster.height.integerValue;
        model.constellation = cluster.constellation;
        model.isAuthen = cluster.isAuthen.integerValue;
        model.nobleLevel = cluster.nobleLevel.integerValue;
        model.lastLoginTime = cluster.lastLoginTime.integerValue;
        model.region = cluster.region;
        [self.dataArray addObject:model];
    }
    
    self.view.backgroundColor = [UIColor whiteColor]; //
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 67, 0);
//    self.tableview.contentInset = UIEdgeInsetsMake(0, 0, 67, 0);
//    CGRect rect = self.tableView.frame;
//    rect.size.height = SCREEN_HEIGHT- NavigationHeight - StatusHeight - TabbarHeight;
//    self.tableView.frame = rect;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = BGCOLOR;
    //    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //去掉多余的分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableView];
    
    [self.tableView setSeparatorColor:[Utility colorWithHexString:@"#efefef" alpha:1]];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //  隐藏TabBar
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //  显示TabBar
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark -- tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *MY_TTLAddressBookTableViewCellID = @"MY_LLAddressListCell";
    MY_LLAddressListCell *cell = [tableView dequeueReusableCellWithIdentifier:MY_TTLAddressBookTableViewCellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_LLAddressListCell" owner:self options:nil] lastObject];
    }

    cell.model = self.dataArray[indexPath.row];
    
    [cell.gztb setHidden:YES];
    
    __weak typeof(self) wSelf = self;
    cell.headIconGestureBlock = ^(MY_LYPersonInfoModel *model) {
        
        MY_TTLSelfCenterViewController* selfVc = [[MY_TTLSelfCenterViewController alloc]init];
        
        selfVc.userID = [NSString stringWithFormat:@"%td", model.userId];
        
        [wSelf.navigationController pushViewController:selfVc animated:YES];
    };
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MY_LYPersonInfoModel * model = self.dataArray[indexPath.row];
    
    MY_TTLSelfCenterViewController* selfVc = [[MY_TTLSelfCenterViewController alloc]init];
    selfVc.userID = [NSString stringWithFormat:@"%td", model.userId];
    [self.navigationController pushViewController:selfVc animated:YES];
}



/*
 @property (nonatomic, copy) NSString * nickName;    //  昵称
 @property (nonatomic, copy) NSString * region;      //  上海
 @property (nonatomic, copy) NSString * level;       //  全部
 @property (nonatomic, copy) NSString * headIcon;    //  头像
 
 
 @property (nonatomic, strong) NSNumber * isQualification;
 @property (nonatomic, strong) NSNumber * userId;
 @property (nonatomic, strong) NSNumber * sex;
 @property (nonatomic, strong) NSNumber * consumptionLevel;
 @property (nonatomic, strong) NSNumber * distance;
 @property (nonatomic, strong) NSNumber * lastLoginTime;
 @property (nonatomic, strong) NSNumber * latitude;
 @property (nonatomic, strong) NSNumber * price;
 @property (nonatomic, strong) NSNumber * secretStatus;
 @property (nonatomic, strong) NSNumber * isVoice;
 @property (nonatomic, strong) NSNumber * typeId;
 @property (nonatomic, strong) NSNumber * num;
 @property (nonatomic, strong) NSNumber * longitude;
 @property (nonatomic, strong) NSNumber * distanceStatus;
 @property (nonatomic, strong) NSNumber * isAuthen;
 @property (nonatomic, strong) NSNumber * age;
 @property (nonatomic, strong) NSNumber * isVedio;
 */

@end
