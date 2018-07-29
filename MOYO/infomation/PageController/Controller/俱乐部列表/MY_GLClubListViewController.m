//
//  MY_GLClubListViewController.m
//  VTIME
//
//  Created by gll on 2017/10/20.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLClubListViewController.h"

// 聊天
#import "MY_TTLClubChatViewController.h"

// 俱乐部列表Cell
#import "MY_GLClubListTableViewCell.h"
#import "MY_GLClubModel.h"

@interface MY_GLClubListViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray* dataArray;

@end

@implementation MY_GLClubListViewController

-(BOOL)hidesBottomBarWhenPushed{
    
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"俱乐部";
    
//    [self.dataArray addObjectsFromArray: [[EMClient sharedClient].groupManager getJoinedGroups]];
    [self createTableView];
    
//    GetUserClubsUrl
    [TLHTTPRequest MY_getWithBaseUrl:GetUserClubsUrl parameters:@{} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {

        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
            if (data[@"info"] && [data[@"info"] count]) {

                for (NSDictionary * dict in data[@"info"]) {
                    MY_GLClubModel * model = [[MY_GLClubModel alloc]init];
                    [model setValuesForKeysWithDictionary:dict];
                    [self.dataArray addObject:model];
                }
                [self.tableView reloadData];
            }
            
        }else {
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
                
            }
            
        }} failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showMessage:@"没网怎能忍 ？"];
    
//     [[EMClient sharedClient].groupManager getJoinedGroupsFromServerWithPage:0 pageSize:-1 completion:^(NSArray *aList, EMError *aError) {
//
//         [self.dataArray addObjectsFromArray:aList];
//
    }];

    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - StatusHeight - 44);
    self.tableView.backgroundColor = BGCOLOR;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MY_GLClubListTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"MY_GLClubListTableViewCell"];

}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"MY_GLClubListTableViewCell";
    MY_GLClubListTableViewCell *cell = (MY_GLClubListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[MY_GLClubListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if ([self.dataArray count] >= indexPath.row) {
        
        cell.model = [self.dataArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 82;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    MY_GLClubModel * model = [self.dataArray objectAtIndex:indexPath.row];
    if (!model) {
        return;
    }
    MY_TTLClubChatViewController *clubChatVC = [[MY_TTLClubChatViewController alloc]initWithConversationChatter:model.roomGroupId conversationType:EMConversationTypeGroupChat];
    clubChatVC.groupModel = model;
    [self.navigationController pushViewController:clubChatVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

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
