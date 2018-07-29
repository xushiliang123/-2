//
//  MY_TTLBaesInformationViewController.m
//  TogetherLu
//
//  Created by MadridLee on 2017/1/3.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLBodyInformationViewController.h"
#import "MY_TTLAddVCerTableViewCell.h"
#import "MY_TTLVKindTyoeTableViewCell.h"
#import "MY_TTLVRequireTableViewCell.h"

#import "MY_TTLCerInstructionViewController.h"
#import "MY_LYMessageInfoModel.h"
//#import "MY_TTLBindStateViewController.h"
@interface MY_TTLBodyInformationViewController ()
{
    NSNumber* _numState;    //加V认证状态
    NSMutableDictionary* _dictData ;
}
@end

@implementation MY_TTLBodyInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad]; 
    // Do any additional setup after loading the view.
    self.title = @"加V认证";
    self.view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    
    [TLHTTPRequest MY_getWithBaseUrl:GetVaddVarifyUrl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            if ([data objectForKey:@"info"]) {
                _numState = [[data objectForKey:@"info"] objectForKey:@"status"];
                _dictData = [data objectForKey:@"info"];
                [self createTableView];
                [self createFootView];
                
                
            }else{
                _numState = @0;
                [self createTableView];
                [self createFootView];
            }
            [self.tableView registerNib:[UINib nibWithNibName:@"MY_TTLAddVCerTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_TTLAddVCerTableViewCell"];
            [self.tableView registerNib:[UINib nibWithNibName:@"MY_TTLVKindTyoeTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_TTLVKindTyoeTableViewCell"];
            [self.tableView registerNib:[UINib nibWithNibName:@"MY_TTLVRequireTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_TTLVRequireTableViewCell"];
            self.tableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
            
            if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
                [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
            }
            
            if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
                [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
            }
        }
        else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
    
}
-(void)createFootView
{
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 170)];
    
    UIButton* btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAdd.frame = CGRectMake(42, 60, SCREEN_WIDTH - 84, 45);
    [btnAdd setBackgroundColor:GOLDCOLOR];
    [btnAdd setTitle:@"加V认证" forState:UIControlStateNormal];
    btnAdd.titleLabel.font = [UIFont systemFontOfSize:17];
    btnAdd.layer.cornerRadius = 5;
    btnAdd.layer.masksToBounds = YES;
    [btnAdd setTitleColor:[Utility colorWithHexString:@"ffffff" alpha:1] forState:UIControlStateNormal];
    [btnAdd addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btnAdd];
    
    self.tableView.tableFooterView = view;
    if (SCREEN_WIDTH <= 320) {
        btnAdd.titleLabel.font = [UIFont systemFontOfSize:17*SCREEN_WIDTH/375];
    }
}

-(void)addClick
{
    if ([_numState integerValue] == 1) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:nil message:@"您已加V认证，是否修改？" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
           
        }];
        UIAlertAction* action2=[UIAlertAction actionWithTitle:@"修改" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            MY_TTLCerInstructionViewController* cerVc = [[MY_TTLCerInstructionViewController alloc]init];
            cerVc.numState = _numState;
            [self.navigationController pushViewController:cerVc animated:YES];
        }];
        
        [alert addAction:action1];
        [alert addAction:action2];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
        MY_TTLCerInstructionViewController* cerVc = [[MY_TTLCerInstructionViewController alloc]init];
        cerVc.numState = _numState;
        [self.navigationController pushViewController:cerVc animated:YES];
    }

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
    
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 125;
    }
    else if (indexPath.section == 1)
    {
        return 93;
    }
    else{
        return 117;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0 : 32;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        static NSString * cellId = @"MY_TTLAddVCerTableViewCell";
        MY_TTLAddVCerTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath] ;
        cell.iconImgv.backgroundColor = GOLDCOLOR;
        NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
        NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
        MY_LYPersonInfoModel *uModel = arry.firstObject;
        
//        MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
        if (![Utility isBlankString:uModel.headIcon]) {
            [cell.iconImgv sd_setImageWithURL:[NSURL URLWithString:uModel.headIcon] placeholderImage:[UIImage imageNamed:@"占位图"] options:SDWebImageAllowInvalidSSLCertificates];
        }
        
//        NSString * where = [NSString stringWithFormat:@"userId = %@", USERID];
//        [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//            for (BaseModel * pModel in dataArray) {
//
//                if ([pModel isKindOfClass:[MY_LLPersonInfoModel class]]) {
//
//                    MY_LLPersonInfoModel * userModel = (MY_LLPersonInfoModel *)pModel;
//
//                    if (userModel.userId == [USERID integerValue]) {
//
//                        if (![Utility isBlankString:userModel.headIcon]) {
//                            [cell.iconImgv sd_setImageWithURL:[NSURL URLWithString:userModel.headIcon] placeholderImage:[UIImage imageNamed:@"占位图"] options:SDWebImageAllowInvalidSSLCertificates];
//                        }
//                    }
//                }
//            }
//        }];
        
        if ([_numState integerValue] == 1) {
            cell.addVIcon.hidden = NO;
        }
        else{
            cell.addVIcon.hidden = YES;
        }
        if (SCREEN_WIDTH <= 320) {
            cell.titleLabel.font = [UIFont systemFontOfSize:15*SCREEN_WIDTH/375];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.section == 1)
    {
        static NSString * cellId = @"MY_TTLVKindTyoeTableViewCell";
        MY_TTLVKindTyoeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        if (SCREEN_WIDTH <= 320) {
            cell.titleLabel.font = [UIFont systemFontOfSize:15*SCREEN_WIDTH/375];
            cell.kindLabel.font = [UIFont systemFontOfSize:14*SCREEN_WIDTH/375];
            cell.addVLabel.font = [UIFont systemFontOfSize:14*SCREEN_WIDTH/375];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        static NSString * cellId = @"MY_TTLVRequireTableViewCell";
        MY_TTLVRequireTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        [cell.bindBtn setImage:[UIImage imageNamed:@"endBind"] forState:UIControlStateNormal];
        cell.bindLabel.textColor = [Utility colorWithHexString:@"999999" alpha:1];
        cell.bindLabel.text = @"已绑定";
        cell.bindBtn.userInteractionEnabled = NO;
        
        
        if (SCREEN_WIDTH <= 320) {
            cell.bindLabel.font = [UIFont systemFontOfSize:15*SCREEN_WIDTH/375];
        }
        return cell;
    }
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 32)];
    headerView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 20, 32)];
    if (section == 1) {
        headerLabel.text = @"可认证种类:";
    }
    else{
        headerLabel.text = @"认证要求:";
    }
    headerLabel.font = [UIFont systemFontOfSize:12];
    headerLabel.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    [headerView addSubview:headerLabel];
    return headerView;
}




@end
