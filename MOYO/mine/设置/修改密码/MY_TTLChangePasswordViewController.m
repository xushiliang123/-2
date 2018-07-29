//
//  MY_TTLBaesInformationViewController.m
//  TogetherLu
//
//  Created by MadridLee on 2017/1/3.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLChangePasswordViewController.h"
#import "MY_TTLChangePasswordTableViewCell.h"

@interface MY_TTLChangePasswordViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView* myTableView;
@end

@implementation MY_TTLChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"修改密码";
    self.view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    
    [self uiConfig];
    [self crateBtn];
}

-(void)crateBtn{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 85*SCREEN_WIDTH/375, SCREEN_WIDTH, 85*SCREEN_WIDTH/375)];
    view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    [self.view addSubview:view];
    
    UIButton* btnDra = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDra.frame = CGRectMake(10*SCREEN_WIDTH/375, 15*SCREEN_WIDTH/375, SCREEN_WIDTH - 20*SCREEN_WIDTH/375, 55*SCREEN_WIDTH/375);
    [btnDra setTitle:@"提交" forState:UIControlStateNormal];
    [view addSubview:btnDra];
    btnDra.backgroundColor = GOLDCOLOR;
    btnDra.titleLabel.font = [UIFont systemFontOfSize:18];
    btnDra.layer.cornerRadius = 5;
    btnDra.layer.masksToBounds = YES;
    [btnDra addTarget:self action:@selector(withdraClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)withdraClick
{
    
}


-(void)uiConfig
{
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 75) style:UITableViewStylePlain];
    self.myTableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.myTableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    [self.view addSubview:self.myTableView];
    
    
}



#pragma mark - 代理相关
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"MY_TTLChangePasswordTableViewCell";
    MY_TTLChangePasswordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLChangePasswordTableViewCell" owner:self options:nil] lastObject];
    }
    
    cell.textField.font = [UIFont systemFontOfSize:14];
    cell.textField.tag = 1001 + indexPath.row;
    cell.textField.placeholder = indexPath.row == 0 ? @"请输入旧密码" : (indexPath.row == 1 ? @"请输入新密码" : @"再次输入新密码");
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
