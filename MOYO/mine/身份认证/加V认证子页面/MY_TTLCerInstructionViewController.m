//
//  MY_TTLCerInstructionViewController.m
//  TogetherLu
//
//  Created by MadridLee on 2017/4/20.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLCerInstructionViewController.h"
#import "MY_TTLApplyImmedViewController.h"
@interface MY_TTLCerInstructionViewController ()
{
    NSArray* _arrayTitle;
    NSArray* _arrayDetail;
}
@end

@implementation MY_TTLCerInstructionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"认证说明";
    self.view.backgroundColor = [Utility colorWithHexString:@"ffffff" alpha:1];
    if ([self.numState intValue] == 0) {
        [self createWaitingAudit];
    }
    else{
        [self createAll];
    }
    
}

#pragma mark --创建审核中界面
-(void)createWaitingAudit
{
    UIImageView* imgv = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 146)/2, 42, 146, 140)];
    imgv.image = [UIImage imageNamed:@"waitAudit"];
    [self.view addSubview:imgv];
    
    UILabel* labelSucc = [[UILabel alloc]initWithFrame:CGRectMake(20, 212, SCREEN_WIDTH - 40, 15)];
    labelSucc.text = @"审核中······";
    labelSucc.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    labelSucc.textAlignment = NSTextAlignmentCenter;
    labelSucc.font = [UIFont systemFontOfSize: 15];
    [self.view addSubview:labelSucc];
    
    UILabel* labelFinish = [[UILabel alloc]initWithFrame:CGRectMake(20, 246, SCREEN_WIDTH - 40, 13)];
    labelFinish.text = @"请耐心等待结果";
    labelFinish.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    labelFinish.textAlignment = NSTextAlignmentCenter;
    labelFinish.font = [UIFont systemFontOfSize: 13];
    [self.view addSubview:labelFinish];
    
    UILabel* labelTime = [[UILabel alloc]initWithFrame:CGRectMake(20, 269, SCREEN_WIDTH - 40, 13)];
    labelTime.text = @"我们将在1~3天内审核您的申请";
    labelTime.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    labelTime.textAlignment = NSTextAlignmentCenter;
    labelTime.font = [UIFont systemFontOfSize: 13];
    [self.view addSubview:labelTime];
    
    UIButton* btnDra = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDra.frame = CGRectMake(15, 322, SCREEN_WIDTH - 30, 50);
    [btnDra setTitle:@"重新提交" forState:UIControlStateNormal];
    [self.view addSubview:btnDra];
    btnDra.backgroundColor = GOLDCOLOR;
    btnDra.titleLabel.font = [UIFont systemFontOfSize:18];
    btnDra.layer.cornerRadius = 5;
    btnDra.layer.masksToBounds = YES;
    [btnDra addTarget:self action:@selector(recordClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)recordClick
{
    //跳转到提交认证界面
    MY_TTLApplyImmedViewController* syncVc = [[MY_TTLApplyImmedViewController alloc]init];
    [self.navigationController pushViewController:syncVc animated:YES];
}

#pragma mark --创建认证界面
-(void)createAll
{
    _arrayTitle = @[@"1、网红",@"2、车主",@"3、公司高层",@"4、空姐",@"5、模特",@"6、歌手",@"7、演员"];
    _arrayDetail = @[@"在某一互联网平台上粉丝数达到10000的用户",@"拥有自己的行驶证",@"公司经理及以上职位并拥有名片",@"拥有某一航空公司空姐姓名牌",@"有模特经纪公司证明或有相关作品",@"有歌曲作品的娱乐业人士",@"有影视或相关作品"];
    
    [self createTableView];
    [self uiConfig];
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 80 - 64);
    //    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.tableView.tableFooterView = [UIView new];
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)uiConfig
{
    UIButton* btnSync = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSync.frame = CGRectMake(15, SCREEN_HEIGHT - 65 - 64, SCREEN_WIDTH - 30, 50);
    [btnSync setTitle:@"立即认证" forState:UIControlStateNormal];
    btnSync.titleLabel.font = [UIFont systemFontOfSize:18];
    [btnSync setBackgroundColor:GOLDCOLOR];
    [btnSync setTitleColor:[Utility colorWithHexString:@"ffffff" alpha:1] forState:UIControlStateNormal];
    btnSync.layer.cornerRadius = 5;
    btnSync.layer.masksToBounds = YES;
    [self.view addSubview:btnSync];
    [btnSync addTarget:self action:@selector(syncClick) forControlEvents:UIControlEventTouchUpInside];
}


-(void)syncClick
{
    MY_TTLApplyImmedViewController* syncVc = [[MY_TTLApplyImmedViewController alloc]init];
    [self.navigationController pushViewController:syncVc animated:YES];
}
#pragma mark - tableView代理方法
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 54;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"UITableViewCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId] ;
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }

    cell.textLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    cell.textLabel.font      = [UIFont systemFontOfSize:15];
    cell.textLabel.text      = _arrayTitle[indexPath.row];
    
    cell.detailTextLabel.textColor = [Utility colorWithHexString:@"666666" alpha:1];
    cell.detailTextLabel.font      = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.text      = _arrayDetail[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
