//
//  MyViewController.m
//  TogetherLu
//
//  Created by Louie on 16/12/15.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLNotificationsViewController.h"
#import "MY_TTLTitleSwitchTableViewCell.h"
#import "SystemNoticeTableViewCell.h"
@interface MY_TTLNotificationsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView* _gradientImage;
}
@property (nonatomic, strong) UIImageView * topImageView;
@property (nonatomic, strong) UITableView *myTableView;

@property (strong, nonatomic) NSArray *arrayDetail;


@end

@implementation MY_TTLNotificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息提醒";
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(1, 1, 1, 1)];
    [self.view addSubview:view];
    self.view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    //  设置UI
    [self createUI];
//    self.arrayTitle = @[@"新消息提醒",@"聊天设置"];
    self.arrayDetail = @[@"接收到新消息通知",@"声音",@"震动"];
}

#pragma mark - UI相关
- (void)createUI{
    
    
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
//    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.myTableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    [self.view addSubview:self.myTableView];

    self.myTableView.tableFooterView = [UIView new];
    if ([self.myTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.myTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.myTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.myTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
//    [self upLoadDataList];
}


-(BOOL)AcquireNotificationSet {
    
//    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0") || SYSTEM_VERSION_EQUAL_TO(@"8.0")) {
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    if (UIUserNotificationTypeNone != setting.types) {
        return YES;
    } else {
        return NO;
    }
//    }
}


//-(void)upLoadDataList
//{
//    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
//    [dict setObject:USERKEY forKey:@"key"];
//    [TLHTTPRequest MY_getWithBaseUrl:UserSetUpGetting parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//
//        if ([[data objectForKey:@"ret"] boolValue] == 0) {
////            [MMProgressHUD dismissWithSuccess:@"加载成功"];
//            NSLog(@"data - %@",data);
//            if ([data objectForKey:@"info"]) {
////                _model = [[MY_TTLMySetModel alloc]init];
////                [_model setValuesForKeysWithDictionary:[data objectForKey:@"info"]];
//                [self.myTableView reloadData];
//            }
//
//        }else {
//            if ([data objectForKey:@"msg"]) {
//                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
////                [self autoHideAlert:[data objectForKey:@"msg"]];
//            }
//        }
//
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//        [LQProgressHud showMessage:@"加载失败"];
////        [MMProgressHUD dismissWithSuccess:@"加载失败"];
//
//    }];
//}



#pragma mark - 数据相关

#pragma mark - 代理相关
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        return 86;
    } else {
        return 44;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 32;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 32)];
    view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 32)];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    label.text = @"新消息提醒";
    [view addSubview:label];
    return view;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"MY_TTLTitleSwitchTableViewCell";
    static NSString *nCellId = @"SystemNoticeTableViewCell";

    if (indexPath.row == 0) {
        
        SystemNoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nCellId];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:nCellId owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.isNotificationLabel.text = [self AcquireNotificationSet] ? @"已开启" : @"已关闭";
        return cell;
        
    } else {
        MY_TTLTitleSwitchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLTitleSwitchTableViewCell" owner:self options:nil] lastObject];
        }
        NSInteger voice = [MYVOCIE integerValue];
        NSInteger shocks = [MYSHOCKS integerValue];
        cell.switchIm.hidden = NO;
        cell.labelTitle.textColor = [Utility colorWithHexString:@"666666" alpha:1];
        cell.labelTitle.text = self.arrayDetail[indexPath.row];
        cell.titleTrans.constant = 15;
        cell.labelTitle.font = [UIFont systemFontOfSize:14];
        [cell.switchIm addTarget:self action:@selector(mySwitchAc:) forControlEvents:(UIControlEventValueChanged)];
        
        cell.switchIm.tag = 300 + indexPath.row;
        if (indexPath.row == 1) {
            if (voice == 0) {
                cell.switchIm.on = YES;
            }
            else{
                cell.switchIm.on = NO;
            }
        }
        else
        if (indexPath.row == 2)
        {
            if (shocks == 0) {
                cell.switchIm.on = YES;
            }
            else{
                cell.switchIm.on = NO;
            }
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}


- (void)mySwitchAc: (UISwitch *)mySwitch{
    NSInteger index = mySwitch.tag - 300;
    NSLog(@"%td",index);
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
//    [dict setObject:USERKEY forKey:@"key"];
    switch (index) {
        case 1:
        {
            if (mySwitch.isOn) {
                UserSetObject(@"0", VOCIEStatus);
            }else{
                UserSetObject(@"1", VOCIEStatus);
            }
        }
            break;
        case 2:
        {
            if (mySwitch.isOn) {
                UserSetObject(@"0", SHOCKStatus);
            }else{
                UserSetObject(@"1", SHOCKStatus);
            }
        }
            break;
//        case 2:
//        {
//            if (mySwitch.isOn) {
//                [dict setObject:@1 forKey:@"shockStatus"];
////                _model.shockStatus = @1;
//
//            }else{
//                [dict setObject:@0 forKey:@"shockStatus"];
////                _model.shockStatus = @0;
//            }
//        }
            break;
            
        default:
            break;
    }

//    [TLHTTPRequest MY_postWithBaseUrl:UserSetUpData parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//        if ([[data objectForKey:@"ret"] boolValue] == 0) {
//            if ([dict objectForKey:@"shockStatus"]) {
//                NSInteger shock = [[dict objectForKey:@"shockStatus"] integerValue];
////                UserSetObject(@(shock), SHOCKStatus);
//            }
//            if ([dict objectForKey:@"voiceStatus"]) {
//                NSInteger voice = [[dict objectForKey:@"voiceStatus"] integerValue];
////                UserSetObject(@(voice), VOCIEStatus);
//            }
//            [self.myTableView reloadData];
//        }
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//
//    }];
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
