//
//  MY_LLClubsManagerViewController.m
//  VTIME
//
//  Created by tingting on 2017/10/13.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLClubsManagerViewController.h"
#import "MY_LLClubsSetViewController.h"
#import "MY_LLClubsManagerCell.h"
#import "MY_LLClubsHeadCell.h"
#import "MY_XTAddManagerViewController.h"
#import "MY_XTClubLevelViewController.h"

@interface MY_LLClubsManagerViewController ()

@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) NSMutableArray * dataManagersArray;

@end

@implementation MY_LLClubsManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UpdateUI) name:@"updateUI" object:nil];
    
    [self createTableView];
    
    [self downLoadData:@(1) isReshing:YES];
}

-(void)UpdateUI
{
    [self.dataArray removeAllObjects];
    [self.dataManagersArray removeAllObjects];
    [self downLoadData:@(1) isReshing:YES];
}

#pragma mark - 界面
- (void)createTableView{
    
    //    [self addNavBtn:@"清空" isLeft:NO target:self action:@selector(clearBtnClick) bgImageName:nil];
    
    //  关闭自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    
    //  注册Xib的Cell
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_LLClubsHeadCell" bundle:nil] forCellReuseIdentifier:@"MY_LLClubsHeadCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_LLClubsManagerCell" bundle:nil] forCellReuseIdentifier:@"MY_LLClubsManagerCell"];
}

- (void)clearBtnClick {
    
}

- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing{
    NSDictionary * dic;
    
    dic = @{@"clubId":@(self.ClubID)};
    [TLHTTPRequest MY_getWithBaseUrl:GetClubUserListUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            NSDictionary * dataDic = [data objectForKey:@"info"];
            
            if ([dataDic count] ) {
                
                //                if ( 1 == _page) {
                //                    [self.dataArray removeAllObjects];
                //                }
                
                NSArray *mArr = [[NSArray alloc]init];
                mArr = [dataDic objectForKey:@"managers"];
                [self.dataManagersArray addObjectsFromArray:mArr];
                
                NSArray *nArr = [[NSArray alloc]init];
                nArr = [dataDic objectForKey:@"normalUsers"];
                [self.dataArray addObjectsFromArray:nArr];
                
                [self.tableView reloadData];
                
            }
            
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        
        //        if (!isReshing) {
        //            [self.collectionView.mj_footer endRefreshing];
        //        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        //        if (!isReshing) {
        //            [self.collectionView.mj_footer endRefreshing];
        //        }
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
    
}


#pragma mark - tableView代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if(self.isManager)
    {
        return 3;
    }
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(self.isManager)
    {
        if (section == 0 || section == 1) {
            return 1;
        }
        else
        {
            return [self.dataArray count];
        }
    }
    else
    {
        if (section == 0 || section == 1) {
            return 1;
        }
        else if (section == 2)
        {
            return [self.dataManagersArray count];
        }
        else
        {
            return [self.dataArray count];
        }
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
   
    
    
    if (section == 0) {
        return 0.01;
    }
    else if (section == 1) {
        return 10;
    }
    else {
        return 33;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if(self.isManager)
    {
        return 0.001;
    }else
    {
        if (section == 2) {
            return 50;
        }
        else {
            return 0.001;
        }
    }
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.isManager)
    {
        static NSString * cellId = @"MY_LLClubsManagerCell";
        static NSString * cellId1 = @"MY_LLClubsHeadCell";
        if (indexPath.section == 0 || indexPath.section == 1) {
            MY_LLClubsHeadCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId1 forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            if (indexPath.section == 0) {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.leftLabel.text = @"编辑俱乐部";
            }
            else if (indexPath.section == 1) {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.leftLabel.text = @"俱乐部星级";
            }
            else {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            return cell;
            
        }
        else {
            
            MY_LLClubsManagerCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.headIcon sd_setImageWithURL:[NSURL URLWithString:[[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"headIcon"]] placeholderImage:[UIImage imageNamed:@"BackgroundV"]];
            cell.nickNameLabel.text = [[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"nickName"];
            
            cell.accessoryType = UITableViewCellAccessoryNone;
            return cell;
            
        }
        return nil;
    }
    else
    {
        static NSString * cellId = @"MY_LLClubsManagerCell";
        static NSString * cellId1 = @"MY_LLClubsHeadCell";
        if (indexPath.section == 0 || indexPath.section == 1) {
            MY_LLClubsHeadCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId1 forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            if (indexPath.section == 0) {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.leftLabel.text = @"编辑俱乐部";
            }
            else if (indexPath.section == 1) {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.leftLabel.text = @"俱乐部星级";
            }
            else {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            return cell;
            
        }
        else if (indexPath.section == 2){
            
            MY_LLClubsManagerCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.headIcon sd_setImageWithURL:[NSURL URLWithString:[[self.dataManagersArray objectAtIndex:indexPath.row] objectForKey:@"headIcon"]] placeholderImage:[UIImage imageNamed:@"BackgroundV"]];
            cell.nickNameLabel.text = [[self.dataManagersArray objectAtIndex:indexPath.row] objectForKey:@"nickName"];
            
            cell.accessoryType = UITableViewCellAccessoryNone;
            return cell;
            
        }
        else {
            
            MY_LLClubsManagerCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.headIcon sd_setImageWithURL:[NSURL URLWithString:[[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"headIcon"]] placeholderImage:[UIImage imageNamed:@"BackgroundV"]];
            cell.nickNameLabel.text = [[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"nickName"];
            
            cell.accessoryType = UITableViewCellAccessoryNone;
            return cell;
            
        }
        return nil;
    }
    
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if(self.isManager)
    {
        if (section == 2) {
            
            UILabel * headLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 33)];
            headLabel.backgroundColor = BGCOLOR;
            headLabel.textColor = [Utility colorWithHexString:@"b0b0b0" alpha:1.0];
            headLabel.font = [UIFont systemFontOfSize:13];
            
            headLabel.text = @"      移除俱乐部成员";
            
            return headLabel;
        }
        return nil;
    }
    else
    {
        if (section == 2 || section == 3) {
            
            UILabel * headLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 33)];
            headLabel.backgroundColor = BGCOLOR;
            headLabel.textColor = [Utility colorWithHexString:@"b0b0b0" alpha:1.0];
            headLabel.font = [UIFont systemFontOfSize:13];
            if (section == 2) {
                headLabel.text = @"      设置管理员";
            }
            else if (section == 3) {
                headLabel.text = @"      移除俱乐部成员";
            }
            return headLabel;
        }
        return nil;
    }
    
    
}

//
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if(self.isManager)
    {
        return nil;
    }else
    {
        UILabel * footLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        footLabel.textAlignment = NSTextAlignmentCenter;
        footLabel.textColor = [Utility colorWithHexString:@"3c3c3c" alpha:1.0];
        footLabel.font = [UIFont systemFontOfSize:16];
        
        NSString * string = @"    添加管理员";
        
        NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithString:string];
        
        //    [attStr addAttribute:NSForegroundColorAttributeName
        //                   value:[Utility colorWithHexString:@"3c3c3c" alpha:1.0]
        //                   range:NSMakeRange(0, string.length + 1)];
        
        NSTextAttachment * attachment = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
        
        attachment.image = [UIImage imageNamed:@"addClubsHead"];
        
        attachment.bounds= CGRectMake(0, -1.5, 16, 16);
        
        NSAttributedString * imgAttrStr = [NSAttributedString attributedStringWithAttachment:attachment];
        
        [attStr insertAttributedString:imgAttrStr atIndex:0];
        
        footLabel.attributedText = attStr;
        
        UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)];
        [footLabel addGestureRecognizer:labelTapGestureRecognizer];
        footLabel.userInteractionEnabled = YES;
        
        if (section == 2) {
            return footLabel;
        }
        else {
            return nil;
        }
    }
    
    
}

- (void)labelClick {
    MY_XTAddManagerViewController*xtadd = [[MY_XTAddManagerViewController alloc] init];
    xtadd.dataA = self.dataArray;
    xtadd.clubId = @(self.ClubID);
    [self.navigationController pushViewController:xtadd animated:YES];
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(self.isManager)
    {
        if (indexPath.section == 2) {
            return YES;
        }
        
        else {
            return NO;
        }
    }else
    {
        if (indexPath.section == 2) {
            return YES;
        }
        else if (indexPath.section == 3) {
            return YES;
        }
        else {
            return NO;
        }
    }
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(self.isManager)
    {
       if (indexPath.section == 2) {
            return @"移出俱乐部";
        }
        return nil;
    }
    else
    {
        if (indexPath.section == 2) {
            return @"取消管理员";
        }
        else if (indexPath.section == 3) {
            return @"移出俱乐部";
        }
        return nil;
    }
    
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(self.isManager)
    {
        if(indexPath.section == 2)
        {
            if (editingStyle == UITableViewCellEditingStyleDelete) {
                
                
                //            [self kicksomeoneWithId:[[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"userId"]];
                
                
                [LQProgressHud showLoading:@"正在加载..."];
                NSDictionary * dic;
                
                dic = @{@"clubId":@(self.ClubID),@"onUserId":[[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"userId"]};
                [TLHTTPRequest MY_postWithBaseUrl:KickClubUserUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                    
                    if ([[data objectForKey:@"ret"] integerValue] == 0) {
                        
                        
                        [self.dataArray removeObjectAtIndex:indexPath.row];
                        [tableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationFade];
                        [LQProgressHud hide];
                        
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateClubDetailUI" object:nil];
                        
                        
                        
                        
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
        }
    }else
    {
        if(indexPath.section == 3)
        {
            if (editingStyle == UITableViewCellEditingStyleDelete) {
                
                
                //            [self kicksomeoneWithId:[[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"userId"]];
                
                
                [LQProgressHud showLoading:@"正在加载..."];
                NSDictionary * dic;
                
                dic = @{@"clubId":@(self.ClubID),@"onUserId":[[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"userId"]};
                [TLHTTPRequest MY_postWithBaseUrl:KickClubUserUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                    
                    if ([[data objectForKey:@"ret"] integerValue] == 0) {
                        
                        
                        [self.dataArray removeObjectAtIndex:indexPath.row];
                        [tableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationFade];
                        [LQProgressHud hide];
                        
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateClubDetailUI" object:nil];
                        
                        
                        
                        
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
        }
        else if(indexPath.section == 2)
        {
            if (editingStyle == UITableViewCellEditingStyleDelete) {
                
                
                //            [self kicksomeoneWithId:[[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"userId"]];
                
                
                
                NSDictionary * dic;
                
                dic = @{@"clubId":@(self.ClubID),@"onUserId":[[self.dataManagersArray objectAtIndex:indexPath.row] objectForKey:@"userId"]};
                [TLHTTPRequest MY_postWithBaseUrl:ClubRemoveManagerUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                    
                    if ([[data objectForKey:@"ret"] integerValue] == 0) {
                        
                        //                    [LQProgressHud showMessage:@"踢出成功"];
                        //                    [self.dataManagersArray removeObjectAtIndex:indexPath.row];
                        //                    [tableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationFade];
                        [LQProgressHud showLoading:@"正在加载..."];
                        [self UpdateUI];
                        [LQProgressHud hide];
                        
                        
                        
                    }else{
                        if ([data objectForKey:@"msg"]) {
                            [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                        }
                    }
                    
                } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                    [LQProgressHud showMessage:@"没网怎能忍？"];
                }];
            }
        }
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        MY_LLClubsSetViewController * setVC = [[MY_LLClubsSetViewController alloc] init];
        setVC.clubInfoDic = self.clubInfoDic;
        [self.navigationController pushViewController:setVC animated:YES];
    }
    else if (indexPath.section == 1) {
        
        MY_XTClubLevelViewController * setVC = [[MY_XTClubLevelViewController alloc] init];
        [self.navigationController pushViewController:setVC animated:YES];
        
        
    }
}

-(void)kicksomeoneWithId:(NSString *)userid
{
    NSDictionary * dic;
    
    dic = @{@"clubId":@(self.ClubID),@"onUserId":userid};
    [TLHTTPRequest MY_postWithBaseUrl:KickClubUserUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            [LQProgressHud showMessage:@"踢出成功"];
            
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
}


#pragma mark - 懒加载
- (NSMutableArray *)dataArray{
    if (nil == _dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (NSMutableArray *)dataManagersArray{
    if (nil == _dataManagersArray) {
        _dataManagersArray = [[NSMutableArray alloc] init];
    }
    return _dataManagersArray;
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

