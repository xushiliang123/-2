//
//  MyViewController.m
//  TogetherLu
//
//  Created by Louie on 16/12/15.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLMySetViewController.h"
#import "MyTableViewCell.h"
#import "MY_TTLOrderDetailNewsTableViewCell.h"
#import "MY_TTLNotificationsViewController.h"
#import "MY_TTLStealthSettingViewController.h"
#import "BlacklistViewController.h"
#import "MY_TTLChangePasswordViewController.h"
#import "MY_TTLIDAuthenticationViewController.h"
#import "MY_TTLProductPreViewViewController.h"

//  WebView
#import "VTimeWKWebViewController.h"

@interface MY_TTLMySetViewController () <UITableViewDelegate,UITableViewDataSource
,UIAlertViewDelegate>
{
    UIImageView* _gradientImage;
    NSString* _strCache;
}
@property (nonatomic, strong) UIImageView * topImageView;
@property (nonatomic, strong) UITableView *myTableView;

//@property (strong, nonatomic) NSArray* arrayIcon;
@property (strong, nonatomic) NSArray* arrayTitle;


@end

@implementation MY_TTLMySetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(1, 1, 1, 1)];
    [self.view addSubview:view];
    self.view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    //  设置UI
    [self createUI];
    
//    NSInteger cacha=[[SDImageCache sharedImageCache] getSize];
    float ca= [self folderSize];
//    if (ca==0) {
//        _strCache = [NSString stringWithFormat:@"%.2fk",ca * 0.1];
//    }else{
        _strCache = [NSString stringWithFormat:@"%.2fM",ca];
//    }
    //    self.arrayIcon = @[@[@"hmd",@"yssz",@"newtx",@"removehc"],@[@"exit"]];
    //    self.arrayTitle = @[@[@"黑名单",@"隐身设置",@"消息提醒",@"清除缓存"],@[@"退出账号"]];
    self.arrayTitle = @[@[@"消息提醒",@"隐身设置",@"清除缓存",@"黑名单",@"产品反馈",@"隐私政策",@"版本号"],@[@"退出账号"]];
}

#pragma mark - UI相关
- (void)createUI{
    
    
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.tableFooterView = [UIView new];
    self.myTableView.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    [self.myTableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    //    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.myTableView];
    
    if ([self.myTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.myTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.myTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.myTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
    
}


#pragma mark - 数据相关

#pragma mark - 代理相关
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 49;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 1 ? 1 : [self.arrayTitle[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        static NSString *cellID = @"MY_TTLOrderDetailNewsTableViewCell";
        MY_TTLOrderDetailNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLOrderDetailNewsTableViewCell" owner:self options:nil] lastObject];
        }
        cell.labelTitle.text = self.arrayTitle[indexPath.section][indexPath.row];
        cell.labelTitle.font = [UIFont systemFontOfSize:14];
        cell.labelTitle.textColor = [Utility colorWithHexString:@"333333" alpha:1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        static NSString *MyTableViewCellID = @"UITableViewCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyTableViewCellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = self.arrayTitle[indexPath.section][indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
        
        if (indexPath.section == 0 && indexPath.row == 2) {
            UIView* view = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 120, 0, 100, 49)];
            UILabel* label = [[UILabel alloc]initWithFrame:view.bounds];
            label.textAlignment = NSTextAlignmentRight;
            label.textColor = [Utility colorWithHexString:@"999999" alpha:1];
            if (![Utility isBlankString:_strCache]) {
                label.text = _strCache;
                
            }else{
                
                label.text = @"暂无缓存";
            }
            label.font = [UIFont systemFontOfSize:13];
            [view addSubview:label];
            cell.accessoryView = view;
        //  版本号
        }else if (indexPath.section == 0 && indexPath.row == 6){
            
            UIView* view = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 120, 0, 100, 49)];
            UILabel* label = [[UILabel alloc]initWithFrame:view.bounds];
            label.textAlignment = NSTextAlignmentRight;
            label.textColor = [Utility colorWithHexString:@"999999" alpha:1];
            
            //  获取app版本号
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
            NSString * appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
            
            label.text = appVersion;
                
            label.font = [UIFont systemFontOfSize:13];
            [view addSubview:label];
            cell.accessoryView = view;
            
        }
        else{
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        switch (indexPath.row) {
            case 0:
            {
                MY_TTLNotificationsViewController* setVc = [[MY_TTLNotificationsViewController alloc]init];
                [self.navigationController pushViewController:setVc animated:YES];
                break;
            }
            case 1:
            {
                MY_TTLStealthSettingViewController* setVc = [[MY_TTLStealthSettingViewController alloc]init];
                [self.navigationController pushViewController:setVc animated:YES];
                break;
            }
            case 2:
            {
                [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
                [[SDImageCache sharedImageCache] clearMemory];
                NSInteger cacha=[[SDImageCache sharedImageCache] getSize];
                [self removeCache];
                float ca= [self folderSize];
//                if (ca==0) {
//                    _strCache = [NSString stringWithFormat:@"%.2fk",ca];
//                }else{
                    _strCache = [NSString stringWithFormat:@"%.2fM",ca];
//                }
                [self.myTableView reloadData];
                break;
            }
            case 3:
            {
                
                BlacklistViewController * blacklistVC = [[BlacklistViewController alloc] init];
                blacklistVC.vcTitle = @"黑名单";
                [self.navigationController pushViewController:blacklistVC animated:YES];
                break;
            }
            case 4:
            {
                
                MY_TTLProductPreViewViewController * proVC = [[MY_TTLProductPreViewViewController alloc] init];
                [self.navigationController pushViewController:proVC animated:YES];
                break;
            }
            //  隐私政策
            case 5:
            {
                VTimeWKWebViewController * proVC = [[VTimeWKWebViewController alloc] init];
                proVC.webURL = [Utility getH5Url:DealPrivacyURL];
                proVC.strTitle = @"隐私政策";
                [self.navigationController pushViewController:proVC animated:YES];
                break;
            }
                
            default:
                break;
        }
    }
    else{
        
        __weak typeof(self) wSelf = self;
        [Utility alertViewWithTitle:@"您确定退出吗？" withBlockCancle:^{
            
        } withBlockSure:^{
            
            [wSelf loginOut];
            
        } withBlock:^(UIAlertController *alertView) {
            
            [self presentViewController:alertView animated:YES completion:nil];
        }];
    }
}


// 缓存大小
- (CGFloat)folderSize{
    CGFloat folderSize;
    
    //获取路径
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject];
    
    //获取所有文件的数组
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    
//    NSLog(@"文件数：%ld",files.count);
    
    for(NSString *path in files) {
        
        NSString*filePath = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",path]];
        
        //累加
        folderSize += [[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil].fileSize;
    }
    //转换为M为单位
    CGFloat sizeM = folderSize /1024.0/1024.0;
    
    return sizeM;
}
- (void)removeCache{
    //===============清除缓存==============
    //获取路径
    NSString*cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    
    //返回路径中的文件数组
    NSArray*files = [[NSFileManager defaultManager]subpathsAtPath:cachePath];
    
//    NSLog(@"文件数：%ld",[files count]);
    for(NSString *p in files){
        NSError*error;
        
        NSString*path = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
        
        if([[NSFileManager defaultManager]fileExistsAtPath:path])
        {
            BOOL isRemove = [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
            if(isRemove) {
                NSLog(@"清除成功");
                //这里发送一个通知给外界，外界接收通知，可以做一些操作（比如UIAlertViewController）
                
            }else{
                
                NSLog(@"清除失败");
                
            }
        }
    }
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
