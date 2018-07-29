//
//  MyViewController.m
//  TogetherLu
//
//  Created by Louie on 16/12/15.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLStealthSettingViewController.h"
#import "MY_TTLSteaSetTableViewCell.h"
@interface MY_TTLStealthSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView* _gradientImage;
    NSInteger _secretStatus;
}
@property (nonatomic, strong) UIImageView * topImageView;
@property (nonatomic, strong) UITableView *myTableView;
@property (strong, nonatomic) NSArray* arrayTitle,*arrayDetail;


@end

@implementation MY_TTLStealthSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"保密设置";
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(1, 1, 1, 1)];
    [self.view addSubview:view];
    self.view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    //  设置UI
    [self createUI];
    self.arrayTitle = @[@"开启保密",@"关闭距离"];
    self.arrayDetail = @[@"您的头像及个人空间的视频和照片将处于保密状态",@"对所有人隐身"];
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
    [self reLoadData];
}


-(void)reLoadData
{
    [TLHTTPRequest MY_getWithBaseUrl:UserSetUpGetting parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
    
            if ([data objectForKey:@"info"]) {
                _secretStatus = [[[data objectForKey:@"info"] objectForKey:@"secretStatus"] integerValue];
                [self.myTableView reloadData];
            }
            
        }else {
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"加载失败"];
        
    }];
}



#pragma mark - 代理相关
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
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
    static NSString *cellId = @"MY_TTLSteaSetTableViewCell";
    MY_TTLSteaSetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLSteaSetTableViewCell" owner:self options:nil] lastObject];
    }
    cell.labetTitle.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    cell.labetTitle.text = _arrayTitle[indexPath.row];
    cell.labetTitle.font = [UIFont systemFontOfSize:14];
    cell.labelDetail.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    cell.labelDetail.text = _arrayDetail[indexPath.row];
    cell.labelDetail.font = [UIFont systemFontOfSize:12];
    cell.switchI.tag = 300 + indexPath.row;
    [cell.switchI addTarget:self action:@selector(mySwitchAc:) forControlEvents:(UIControlEventValueChanged)];
    if (indexPath.row == 0) {
        if (_secretStatus == 0) {
            cell.switchI.on = NO;
        }
        else{
            cell.switchI.on = YES;
        }
    }
    else
    {
        if (_secretStatus == 0) {
            cell.switchI.on = NO;
        }
        else{
            cell.switchI.on = YES;
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)mySwitchAc: (UISwitch *)mySwitch{
    [LQProgressHud showLoading:nil];
    NSInteger index = mySwitch.tag - 300;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    if (index == 0) {
        if (mySwitch.isOn) { // 隐藏
            [dict setObject:@1 forKey:@"secretStatus"];
            _secretStatus = 1;
        }else{ // 显示
            [dict setObject:@0 forKey:@"secretStatus"];
            _secretStatus = 0;
        }
        
        __weak typeof (self) weakSelf = self;
        [TLHTTPRequest MY_postWithBaseUrl:HideMeURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] boolValue] == 0) {
                [weakSelf.myTableView reloadData];
                NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
                NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
                MY_LYPersonInfoModel *userModel = arry.firstObject;
                
//                MY_LLPersonInfoModel *userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:[USERID integerValue]];
                userModel.secretStatus = @(_secretStatus);
//                [[MessageInfoModel sharedManager] insertModelWith:userModel];
                [[MY_LLDBManager sharedManager]updateModel:userModel withWhere:where];
                [LQProgressHud hide];
                
            }
            else{
                if ([data objectForKey:@"msg"]) {
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showMessage:@"请检查网络"];
            
        }];
    }
    else{
        [dict setObject:USERKEY forKey:@"key"];
        if (mySwitch.isOn) {
            [dict setObject:@1 forKey:@"secretStatus"];
            _secretStatus = 1;
        }else{
            [dict setObject:@0 forKey:@"secretStatus"];
            _secretStatus = 0;
        }
        __weak typeof (self) weakSelf = self;
        [TLHTTPRequest MY_postWithBaseUrl:HideMeURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] boolValue] == 0) {
                [weakSelf.myTableView reloadData];
                [LQProgressHud hide];
            }else{
                if ([data objectForKey:@"msg"]) {
                    [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showMessage:@"请检查网络"];
        }];
    }
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
