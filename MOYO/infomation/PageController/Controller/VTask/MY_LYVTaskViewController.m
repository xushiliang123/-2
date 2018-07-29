//
//  MY_TTLVTaskViewController.m
//  VTIME
//
//  Created by 听听 on 2017/12/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LYVTaskViewController.h"
#import "MY_TTLVTaskTableViewCell.h"
#import "MY_LYSystemTImeTableViewCell.h"
#import "MY_GLTaskPageViewController.h"
#import "MY_GLTaskApplyInfoViewController.h"
@interface MY_LYVTaskViewController () <EaseMessageViewControllerDelegate,
EaseMessageViewControllerDataSource>
{
    NSString* _strUrl;
}
@end

@implementation MY_LYVTaskViewController

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //  显示TabBar
    //    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
//    self.hidesBottomBarWhenPushed=YES;
    [self.chatToolbar endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationController.navigationBar.translucent = YES;
    //  隐藏TabBar
    //    self.tabBarController.tabBar.hidden = YES;
    
    CGRect tabRect = self.tableView.frame;
    tabRect.size.height = SCREEN_HEIGHT;
    self.tableView.frame = tabRect;
    self.chatToolbar.hidden =YES;
    self.chatBarMoreView.hidden = YES;
    
    //    [self.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SystemMessageTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"MY_TTLOfficalNoticeTableViewCell"];
//    [self.tableView registerClass:[MY_TTLVTaskTableViewCell class] forCellReuseIdentifier:@"MY_TTLVTaskTableViewCell"];
    [self.tableView registerClass:[MY_LYSystemTImeTableViewCell class] forCellReuseIdentifier:@"MY_TTLSystemTImeTableViewCell"];
    self.delegate = self;
    self.dataSource = self;
    
    self.showRefreshHeader = YES;
    
    //      右滑返回
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    
    [self setNavBarButton];
    
}

- (void)setNavBarButton{
    
    UIBarButtonItem * leftBarBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"backButton"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
}

#pragma mark - 左边按钮点击
- (void)backClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mrak - 自定义实时通话的Cell
- (UITableViewCell *)messageViewController:(UITableView *)tableView
                       cellForMessageModel:(id<IMessageModel>)messageModel
{
    //    NSDictionary *ext = messageModel.message.ext;
    if ([messageModel isKindOfClass:[NSString class]]) {
        //时间
//        static NSString * cellId = @"MY_TTLSystemTImeTableViewCell";
//        MY_TTLSystemTImeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
//        id idModel = messageModel;
//        cell.labelTime.text = (NSString *)idModel;
//        cell.backgroundColor = self.tableView.backgroundColor;
//        return cell;
        return nil;
    }else{
//        if ([messageModel.message.from isEqualToString:@"vtimetask"]) {
        static NSString * cellId = @"vtimetask";
        
        MY_TTLVTaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[MY_TTLVTaskTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cellClick:)];
//            [tapG setNumberOfTapsRequired:1];
//            tapG.delegate=self;
//            [cell addGestureRecognizer:tapG];
        }
        cell.backgroundColor = self.tableView.backgroundColor;
        __weak typeof(self) WeakSelf = self;
        [cell setBtnCheck:^{
            if ([messageModel.text rangeOfString:@"领取了您的任务"].location !=NSNotFound) {
                //    跳转报名信息
                MY_GLTaskApplyInfoViewController * taskVC = [[MY_GLTaskApplyInfoViewController alloc]init];
                taskVC.taskId = messageModel.message.ext[@"taskId"];
//                taskVC.hidesBottomBarWhenPushed = YES;
                [WeakSelf.navigationController pushViewController:taskVC animated:YES];
            }else{
                
                //  查询任务进度
                [TLHTTPRequest MY_getWithBaseUrl:TaskqueryCourseURL parameters:@{@"taskId":messageModel.message.ext[@"taskId"]} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull dict) {

                    if ([[dict objectForKey:@"ret"] integerValue] == 0) {
                        
                        if(2 == [dict[@"info"][@"type"] integerValue]){
                            
                            ALERT_SHOW(nil, @"此任务已结束", nil, nil, @"确定");
                            return;
                        }else{
                            //    跳转任务界面
                            MY_GLTaskPageViewController * taskVC = [[MY_GLTaskPageViewController alloc]init];
                            //    taskVC.hidesBottomBarWhenPushed = YES;
                            [WeakSelf.navigationController pushViewController:taskVC animated:YES];
                        }
                        
                    }else{
                        if ([dict objectForKey:@"msg"]) {
                            [LQProgressHud showMessage:[dict objectForKey:@"msg"]];
                        }
                    }
                } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                    
                    [LQProgressHud showMessage:@"没网怎能忍？"];
                }];
                
            }
        }];
        // cell.messageLabel.text = messageModel.text;
        NSDictionary *ext = messageModel.message.ext;
        CGFloat height = [Utility stringSizeWithString:messageModel.text textSize:13 width:SCREEN_WIDTH - 110 height:0].height + 4;
        height = height + 90;
        cell.height = height;
//        NSLog(@"%@",ext);
        [cell showData:messageModel];
            return cell;
    }
    
    return nil;
}

//- (void)yb_attributeTapReturnString:(NSString *)string range:(NSRange)range index:(NSInteger)index
//{
//    MY_TTLToBeNobilityViewController* noVc = [[MY_TTLToBeNobilityViewController alloc]init];
//    noVc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:noVc animated:YES];
//}

- (CGFloat)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth
{
    if ([messageModel isKindOfClass:[NSString class]]) {
        
        return 45;
    }
    else{
//        NSDictionary *ext = messageModel.message.ext;
        CGFloat height = [Utility stringSizeWithString:messageModel.text textSize:13 width:SCREEN_WIDTH - 110 height:0].height + 4;
        height = height + 100;
  
        return height;
    }
    
}

//- (void)cellClick:(UITapGestureRecognizer*)gest{
//
//}

@end
