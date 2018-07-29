//
//  MY_TTLClubNoticeViewController.m
//  VTIME
//
//  Created by MadridLee on 2017/10/13.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLClubNoticeViewController.h"
#import "MY_TTLClubNoticeTableViewCell.h"
#import "MY_TTLClubNoticeEndTableViewCell.h"

#import "MY_XTInviteTableViewCell.h"
#import "MY_XTRefuceInviteTableViewCell.h"
#import "MY_TTLSelfCenterViewController.h"
#import "MY_XTClubNoticeModel.h"

@interface MY_TTLClubNoticeViewController ()
{
    NSInteger _page;
}
@property (strong, nonatomic) NSMutableArray* dataArray;

@end

@implementation MY_TTLClubNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"俱乐部通知";
    
    
    [self uiConfig];
    
    
    
    
    
    
}


-(void)uiConfig
{
    
    [self addNavBtn:@"清空" isLeft:NO target:self action:@selector(rightBarEmptyAction:) bgImageName:nil];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    [self.tableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    self.tableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    [self.view addSubview:self.tableView];
    //    [self.tableView registerClass:[MY_TTLClubHomeTableViewCell class] forCellReuseIdentifier:@"MY_TTLClubHomeTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_TTLClubNoticeEndTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_TTLClubNoticeEndTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_TTLClubNoticeTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_TTLClubNoticeTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_XTInviteTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_XTInviteTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_XTRefuceInviteTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_XTRefuceInviteTableViewCell"];
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

#pragma mark ---清空
-(void)rightBarEmptyAction:(UIButton *)emptyBtn
{
    ALERT_SHOW(@"提示",@"确定清空俱乐部消息？",self,@"取消",@"确定");
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    NSDictionary * dic;
    
    dic = @{@"clubId":@(self.ClubID)};
    
#pragma mark ## UIAlertViewDelegate
    //        0 取消  1 确定
    if (buttonIndex == 0 ) return;
    
    __weak typeof(self) wSelf = self;
    
    [TLHTTPRequest MY_postWithBaseUrl:CleanAllApplyUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
//            [LQProgressHud showMessage:@"举报成功！"];
//
//            [self.navigationController popViewControllerAnimated:YES];
            [self.dataArray removeAllObjects];
            [self.tableView reloadData];
            
        }
        else {
            [LQProgressHud showMessage:data[@"msg"]];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"网络连接失败"];
    }];
}

#pragma mark - 下载数据

- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing{
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@(page) forKey:@"page"];
    
    [TLHTTPRequest MY_getWithBaseUrl:GetClubApplyUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            
            if ([[data objectForKey:@"info"] count] ) {
                NSArray * dataArray = [data objectForKey:@"info"];
                
                if ( 1 == _page) {
                    [self.dataArray removeAllObjects];
                }
                
                for (NSDictionary* dic in dataArray) {
                    MY_XTClubNoticeModel * model = [[MY_XTClubNoticeModel alloc]init];
                    [model setValuesForKeysWithDictionary:dic];
                    
                    [self.dataArray addObject:model];
                }
                
                [self.tableView reloadData];
                
                _page ++;
            }else{
                
                if ( 1 == _page) {
                    [self.dataArray removeAllObjects];
                }
                [LQProgressHud showMessage:@"暂无更多"];
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

#pragma mark -- tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 81;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == 0) {
//        static NSString * cellId = @"MY_XTInviteTableViewCell";
//        MY_XTInviteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
////        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }else if (indexPath.row == 1) {
//        static NSString * cellId = @"MY_XTInviteTableViewCell";
//        MY_XTInviteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
//        cell.InvitedClub.text = @"申请加入  仙女联盟";
////        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
//    else if (indexPath.row == 2) {
//        static NSString * cellId = @"MY_XTRefuceInviteTableViewCell";
//        MY_XTRefuceInviteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
//        cell.InviteStatue.text = @"已拒绝";
//        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
//    else if (indexPath.row == 3) {
//        static NSString * cellId = @"MY_XTRefuceInviteTableViewCell";
//        MY_XTRefuceInviteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
//        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
//    else if (indexPath.row == 4) {
//        static NSString * cellId = @"MY_TTLClubNoticeEndTableViewCell";
//        MY_TTLClubNoticeEndTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
//        cell.stateLabel.text = @"已拒绝";
//        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
//    else if (indexPath.row == 5) {
//        static NSString * cellId = @"MY_TTLClubNoticeEndTableViewCell";
//        MY_TTLClubNoticeEndTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
//        [cell.stateLabel setHidden:YES];
//        cell.clubLabel.text = @"已将你移出俱乐部";
//        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
//    else if (indexPath.row == 6) {
//        static NSString * cellId = @"MY_TTLClubNoticeEndTableViewCell";
//        MY_TTLClubNoticeEndTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
//        cell.stateLabel.text = @"已同意";
//        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
//    else {
//        static NSString * cellId = @"MY_XTInviteTableViewCell";
//        MY_XTInviteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
//        [cell.AgreeBtn setHidden:YES];
//        [cell.DisAgreeBtn setHidden:YES];
//        cell.InvitedClub.text = @"已退出 仙女联盟";
//        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
    
    
    MY_XTClubNoticeModel * model = [self.dataArray objectAtIndex:indexPath.row];
    static NSString * cellId0 = @"MY_XTRefuceInviteTableViewCell";
    static NSString * cellId1 = @"MY_TTLClubNoticeEndTableViewCell";
    static NSString * cellId2 = @"MY_XTInviteTableViewCell";
    
    if([model.infoType intValue] == 1)
    {
        
        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if([model.dealResult intValue] == 0)
        {
            MY_XTInviteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId2 forIndexPath:indexPath];
            [cell.InviterHeadImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.onUserHeadIcon]] placeholderImage:[UIImage imageNamed:@"占位图"]];
            cell.InviterName.text = model.onUserNickName;
            cell.InvitedClub.text = [NSString stringWithFormat:@"邀请你加入  %@",model.clubName];
            [cell setHeadImgBlock:^(void){
                MY_TTLSelfCenterViewController *cent = [[MY_TTLSelfCenterViewController alloc]init];
                cent.userID = model.onUserId.stringValue;
                [self.navigationController pushViewController:cent animated:YES];
            }];
            cell.AgreeBtn.tag = indexPath.row;
            cell.DisAgreeBtn.tag = indexPath.row;
            [cell.AgreeBtn addTarget:self action:@selector(agree:) forControlEvents:UIControlEventTouchUpInside];
            [cell.DisAgreeBtn addTarget:self action:@selector(disagree:) forControlEvents:UIControlEventTouchUpInside];
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else if([model.dealResult intValue] == 1)
        {
            MY_XTRefuceInviteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId0 forIndexPath:indexPath];
            [cell.InviterHeadImageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.onUserHeadIcon]] placeholderImage:[UIImage imageNamed:@"占位图"]];
            cell.InviterName.text = model.onUserNickName;
            cell.InvitedClub.text = [NSString stringWithFormat:@"邀请你加入  %@",model.clubName];
            cell.InviteStatue.text = @"已同意";
            [cell setHeadImgBlock:^(void){
                MY_TTLSelfCenterViewController *cent = [[MY_TTLSelfCenterViewController alloc]init];
                cent.userID = model.onUserId.stringValue;
                [self.navigationController pushViewController:cent animated:YES];
            }];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        else{
            MY_XTRefuceInviteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId0 forIndexPath:indexPath];
            [cell.InviterHeadImageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.onUserHeadIcon]] placeholderImage:[UIImage imageNamed:@"占位图"]];
            cell.InviterName.text = model.onUserNickName;
            cell.InvitedClub.text = [NSString stringWithFormat:@"邀请你加入  %@",model.clubName];
            cell.InviteStatue.text = @"已拒绝";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setHeadImgBlock:^(void){
                MY_TTLSelfCenterViewController *cent = [[MY_TTLSelfCenterViewController alloc]init];
                cent.userID = model.onUserId.stringValue;
                [self.navigationController pushViewController:cent animated:YES];
            }];
            return cell;
        }
        
        
    }
    else if([model.infoType intValue] == 2)
    {
        if([model.dealResult intValue] == 0)
        {
            MY_XTInviteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId2 forIndexPath:indexPath];
            [cell.InviterHeadImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.onUserHeadIcon]] placeholderImage:[UIImage imageNamed:@"占位图"]];
            cell.InviterName.text = model.onUserNickName;
            cell.InvitedClub.text = [NSString stringWithFormat:@"申请加入  %@",model.clubName];
            cell.AgreeBtn.tag = indexPath.row;
            cell.DisAgreeBtn.tag = indexPath.row;
            [cell.AgreeBtn addTarget:self action:@selector(agree:) forControlEvents:UIControlEventTouchUpInside];
            [cell.DisAgreeBtn addTarget:self action:@selector(disagree:) forControlEvents:UIControlEventTouchUpInside];
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setHeadImgBlock:^(void){
                MY_TTLSelfCenterViewController *cent = [[MY_TTLSelfCenterViewController alloc]init];
                cent.userID = model.onUserId.stringValue;
                [self.navigationController pushViewController:cent animated:YES];
            }];
            return cell;
        }else if([model.dealResult intValue] == 1)
        {
            MY_TTLClubNoticeEndTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId1 forIndexPath:indexPath];
            [cell.iconImgv sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.onUserHeadIcon]] placeholderImage:[UIImage imageNamed:@"占位图"]];
            cell.nameLabel.text = model.onUserNickName;
            cell.clubLabel.text = [NSString stringWithFormat:@"申请加入  %@",model.clubName];
            cell.ownerLabel.text = [NSString stringWithFormat:@"处理人:%@",model.dealUserNickName];
            cell.stateLabel.hidden = NO;
            cell.stateLabel.text = @"已同意";
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setHeadImgBlock:^(void){
                MY_TTLSelfCenterViewController *cent = [[MY_TTLSelfCenterViewController alloc]init];
                cent.userID = model.onUserId.stringValue;
                [self.navigationController pushViewController:cent animated:YES];
            }];
            return cell;
        }
        else{
            MY_TTLClubNoticeEndTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId1 forIndexPath:indexPath];
            [cell.iconImgv sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.onUserHeadIcon]] placeholderImage:[UIImage imageNamed:@"占位图"]];
            cell.nameLabel.text = model.onUserNickName;
            cell.clubLabel.text = [NSString stringWithFormat:@"申请加入  %@",model.clubName];
            cell.ownerLabel.text = [NSString stringWithFormat:@"处理人:%@",model.dealUserNickName];
            cell.stateLabel.hidden = NO;
            cell.stateLabel.text = @"已拒绝";
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setHeadImgBlock:^(void){
                MY_TTLSelfCenterViewController *cent = [[MY_TTLSelfCenterViewController alloc]init];
                cent.userID = model.onUserId.stringValue;
                [self.navigationController pushViewController:cent animated:YES];
            }];
            return cell;
        }
    }
    else if([model.infoType intValue] == 3)
    {
        MY_TTLClubNoticeEndTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId1 forIndexPath:indexPath];
        [cell.iconImgv sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.onUserHeadIcon]] placeholderImage:[UIImage imageNamed:@"占位图"]];
        cell.nameLabel.text = model.onUserNickName;
        cell.clubLabel.text = [NSString stringWithFormat:@"已被移出%@",model.clubName];
        cell.ownerLabel.text = [NSString stringWithFormat:@"处理人:%@",model.dealUserNickName];
        [cell.stateLabel setHidden:YES];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setHeadImgBlock:^(void){
            MY_TTLSelfCenterViewController *cent = [[MY_TTLSelfCenterViewController alloc]init];
            cent.userID = model.onUserId.stringValue;
            [self.navigationController pushViewController:cent animated:YES];
        }];
        return cell;
    }
    else if([model.infoType intValue] == 4)
    {
        MY_XTInviteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId2 forIndexPath:indexPath];
        [cell.InviterHeadImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.onUserHeadIcon]] placeholderImage:[UIImage imageNamed:@"占位图"]];
        cell.InviterName.text = model.onUserNickName;
        [cell.AgreeBtn setHidden:YES];
        [cell.DisAgreeBtn setHidden:YES];
        cell.InvitedClub.text = [NSString stringWithFormat:@"已退出 %@",model.clubName];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setHeadImgBlock:^(void){
            MY_TTLSelfCenterViewController *cent = [[MY_TTLSelfCenterViewController alloc]init];
            cent.userID = model.onUserId.stringValue;
            [self.navigationController pushViewController:cent animated:YES];
        }];
        return cell;
    }
    else if([model.infoType intValue] == 5)
    {
        MY_XTInviteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId2 forIndexPath:indexPath];
        [cell.InviterHeadImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.onUserHeadIcon]] placeholderImage:[UIImage imageNamed:@"占位图"]];
        cell.InviterName.text = model.onUserNickName;
        [cell.AgreeBtn setHidden:YES];
        [cell.DisAgreeBtn setHidden:YES];
        cell.InvitedClub.text = [NSString stringWithFormat:@"已被任命为%@俱乐部的管理员",model.clubName];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setHeadImgBlock:^(void){
            MY_TTLSelfCenterViewController *cent = [[MY_TTLSelfCenterViewController alloc]init];
            cent.userID = model.onUserId.stringValue;
            [self.navigationController pushViewController:cent animated:YES];
        }];
        return cell;
    }
    else
    {
        MY_XTInviteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId2 forIndexPath:indexPath];
        [cell.InviterHeadImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.onUserHeadIcon]] placeholderImage:[UIImage imageNamed:@"占位图"]];
        cell.InviterName.text = model.onUserNickName;
        [cell.AgreeBtn setHidden:YES];
        [cell.DisAgreeBtn setHidden:YES];
        cell.InvitedClub.text = [NSString stringWithFormat:@"已被撤销%@俱乐部的管理员身份",model.clubName];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setHeadImgBlock:^(void){
            MY_TTLSelfCenterViewController *cent = [[MY_TTLSelfCenterViewController alloc]init];
            cent.userID = model.onUserId.stringValue;
            [self.navigationController pushViewController:cent animated:YES];
        }];
        return cell;
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)agree:(UIButton *)sender
{
    
    [LQProgressHud showLoading:nil];
    
    MY_XTClubNoticeModel * model = [self.dataArray objectAtIndex:sender.tag];
//    NSLog(@"%@",model.roomId);
    
    NSDictionary * dic;

    dic = @{@"clubId":model.roomId,@"onUserId":model.onUserId};
    [TLHTTPRequest MY_postWithBaseUrl:AgreeClubApplyUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {

        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            [LQProgressHud hide];
            [LQProgressHud showMessage:@"已同意"];
            [self.dataArray removeAllObjects];
            [self headerRefreshing];
            

        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }

    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
}

-(void)disagree:(UIButton *)sender
{
    
    [LQProgressHud showLoading:nil];
    
    
    MY_XTClubNoticeModel * model = [self.dataArray objectAtIndex:sender.tag];
    //    NSLog(@"%@",model.roomId);
    
    NSDictionary * dic;
    
    dic = @{@"clubId":model.roomId,@"onUserId":model.onUserId};
    [TLHTTPRequest MY_postWithBaseUrl:DisagreeClubApplyUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            [LQProgressHud hide];
             [LQProgressHud showMessage:@"已拒绝"];
            [self.dataArray removeAllObjects];
            [self headerRefreshing];
            
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud hide];
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud hide];
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
}

#pragma mark --数据源初始化
- (NSMutableArray *)dataArray{
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
