//
//  MY_TTLPacketsGetViewController.m
//  VTIME
//
//  Created by MadridLee on 2017/9/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLPacketsGetViewController.h"
#import "MY_TTLPacketHeadTableViewCell.h"
#import "MY_TTLPacketGetTableViewCell.h"
#import "MY_TTLPacketRecordModel.h"
#import "MY_LYMessageInfoModel.h"
@interface MY_TTLPacketsGetViewController ()
{
    NSInteger _page;
    NSString* _strHeadIcon;
    NSString* _hongbaoGetMoney;
    NSNumber* _hongbaoGetNum;
}
@property (strong, nonatomic) NSMutableArray* dataArray;

@end

@implementation MY_TTLPacketsGetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
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
    
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
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
    
    [dict setObject:@(page) forKey:@"page"];
    __weak typeof (self) weakSelf = self;
    [TLHTTPRequest MY_getWithBaseUrl:GetPacketsRecordUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
            if (_page == 1) {
                [weakSelf.dataArray removeAllObjects];
            }
            
//            if (_dataArray) {
//                [weakSelf.dataArray removeAllObjects];
//            }
            if ([data objectForKey:@"info"]) {
                for (NSDictionary* dictData in [[data objectForKey:@"info"] objectForKey:@"hongbaoList"]) {
                    MY_TTLPacketRecordModel* model = [[MY_TTLPacketRecordModel alloc]init];
                    [model setValuesForKeysWithDictionary:dictData];
                    [weakSelf.dataArray addObject:model];
                }
                _strHeadIcon = [[data objectForKey:@"info"] objectForKey:@"headIcon"];
                _hongbaoGetNum = [[data objectForKey:@"info"] objectForKey:@"hongbaoGetNum"];
                _hongbaoGetMoney = [[data objectForKey:@"info"] objectForKey:@"hongbaoGetMoney"];
                _page ++;
                [weakSelf.tableView reloadData];
            }
        }else {
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
        if (isReshing) {
            [weakSelf.tableView.mj_header endRefreshing];
        }else {
            [weakSelf.tableView.mj_footer endRefreshing];
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"加载失败"];
        if (isReshing) {
            [weakSelf.tableView.mj_header endRefreshing];
        }else {
            [weakSelf.tableView.mj_footer endRefreshing];
        }
    }];
    
}


#pragma mark -- tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count + 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row == 0 ? 243 : 69;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString *cellId = @"MY_TTLPacketHeadTableViewCell";
        MY_TTLPacketHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil] lastObject];
        }
        [cell.headIcon sd_setImageWithURL:[NSURL URLWithString:_strHeadIcon] placeholderImage:[UIImage imageNamed:@"占位图"]];
        cell.headIcon.layer.cornerRadius = 6;
        cell.headIcon.layer.masksToBounds = YES;
        
        NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
        NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
        MY_LYPersonInfoModel *userModel = arry.firstObject;
        
//        MY_LLPersonInfoModel * userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
        if (![Utility isBlankString:userModel.nickName]) {
            cell.nameLabel.text = [NSString stringWithFormat:@"%@共收到",userModel.nickName];
        }
        else{
            cell.nameLabel.text = @"";
        }
        
//        NSString * where = [NSString stringWithFormat:@"userId = %@", USERID];
//
//        [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//
//            for (BaseModel * pModel in dataArray) {
//
//                if ([pModel isKindOfClass:[MY_LLPersonInfoModel class]]) {
//
//                    MY_LLPersonInfoModel * userModel = (MY_LLPersonInfoModel *)pModel;
//
//                    if (userModel.userId == [USERID integerValue]) {
//
//                        dispatch_async(dispatch_get_main_queue(), ^{
//
//                            if (![Utility isBlankString:userModel.nickName]) {
//                                cell.nameLabel.text = [NSString stringWithFormat:@"%@共收到",userModel.nickName];
//                            }
//                            else{
//                                cell.nameLabel.text = @"";
//                            }
//                        });
//                    }
//                }
//            }
//        }];
        
        if (_hongbaoGetNum != nil) {
            cell.numberLabel.text = [NSString stringWithFormat:@"收到%@个红包",_hongbaoGetNum];
        }else{
            cell.numberLabel.text = @"";
        }
        if (_hongbaoGetMoney != nil) {
            cell.priceLabel.text  = [NSString stringWithFormat:@"%.2f元",[_hongbaoGetMoney floatValue]];
        }else{
            cell.priceLabel.text  = @"";
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        static NSString *cellId = @"MY_TTLPacketGetTableViewCell";
        MY_TTLPacketGetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil] lastObject];
        }
        [cell showData:self.dataArray[indexPath.row - 1]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
    
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
