//
//  MY_TTLOfficialNoticeViewController.m
//  TogetherLu
//
//  Created by MadridLee on 2017/1/4.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLOfficialNoticeViewController.h"
#import "MY_TTLOfficalNoticeTableViewCell.h"
#import "CRWebViewController.h"
#import "MY_LYSystemTImeTableViewCell.h"

#import "UILabel+YBAttributeTextTapAction.h"
#import "MY_TTLToBeNobilityViewController.h"       //成为贵族



@interface MY_TTLOfficialNoticeViewController ()
<EaseMessageViewControllerDelegate,
EaseMessageViewControllerDataSource,YBAttributeTapActionDelegate>
{
    NSString* _strUrl;
}
@end

@implementation MY_TTLOfficialNoticeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //    CGRect rect = self.chatToolbar.frame;
    //    rect.origin.y = SCREEN_HEIGHT + 200;
    //    self.chatToolbar.frame = rect;
    
    //    [self.view bringSubviewToFront:self.tableView];
    self.chatToolbar.hidden =YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //  显示TabBar
//    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    
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
    
    self.chatBarMoreView.hidden = YES;
    
    //    [self.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SystemMessageTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"MY_TTLOfficalNoticeTableViewCell"];
    [self.tableView registerClass:[MY_TTLOfficalNoticeTableViewCell class] forCellReuseIdentifier:@"MY_TTLOfficalNoticeTableViewCell"];
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
        static NSString * cellId = @"MY_TTLSystemTImeTableViewCell";
        MY_LYSystemTImeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        id idModel = messageModel;
        cell.labelTime.text = (NSString *)idModel;
        cell.backgroundColor = self.tableView.backgroundColor;
        return cell;
    }
    {
        if ([messageModel.message.from isEqualToString:@"tingting1"]) {
            
            static NSString * cellId = @"MY_TTLOfficalNoticeTableViewCell";
            
            MY_TTLOfficalNoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            cell.backgroundColor = self.tableView.backgroundColor;
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            //        cell.messageLabel.text = messageModel.text;
            NSDictionary *ext = messageModel.message.ext;
            CGFloat height = [Utility stringSizeWithString:[ext objectForKey:@"msg"] textSize:13 width:SCREEN_WIDTH - 110 height:0].height + 4;
            height = height  + 20;
            if (![Utility isBlankString:[ext objectForKey:@"link"]]) {
                height = height + 39.5;
                _strUrl = [ext objectForKey:@"link"];
                [cell.watchBtn addTarget:self action:@selector(watchClick) forControlEvents:UIControlEventTouchUpInside];
            }
            if (![Utility isBlankString:[ext objectForKey:@"avatarURLPath"]]) {
                height = height + 39.5;
            }
            if (![Utility isBlankString:[ext objectForKey:@"officeImgUrl"]]) {
                height = height + 140;
            }
            cell.height = height;
            
            [cell showData:messageModel];
            
            NSString *str = [messageModel.message.ext objectForKey:@"msg"];
            NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:str];
            NSRange redRange = NSMakeRange([[noteStr string] rangeOfString:@"立即成为贵族"].location, [[noteStr string] rangeOfString:@"立即成为贵族"].length);
            [noteStr addAttribute:NSForegroundColorAttributeName value:GOLDCOLOR range:redRange];
            [noteStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, str.length)];
            [cell.labelDetail setAttributedText:noteStr];
            [cell.labelDetail sizeToFit];
            
            [cell.labelDetail yb_addAttributeTapActionWithStrings:@[@"立即成为贵族"] delegate:self];
            //设置是否有点击效果，默认是YES
            cell.labelDetail.enabledTapEffect = NO;
            
            return cell;
        }
    }
    
    return nil;
}

- (void)yb_attributeTapReturnString:(NSString *)string range:(NSRange)range index:(NSInteger)index
{
    MY_TTLToBeNobilityViewController* noVc = [[MY_TTLToBeNobilityViewController alloc]init];
//    noVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:noVc animated:YES];
}

-(void)watchClick
{
    CRWebViewController * vc = [[CRWebViewController alloc] init];
    vc.strTitle = @"官方公告";
    if (![Utility isBlankString:_strUrl]) {
        vc.webURL = [_strUrl stringByAppendingFormat:@"?userId=%@",USERID];
        
    }
    else{
        vc.webURL = @"";
    }
//    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth
{
    if ([messageModel isKindOfClass:[NSString class]]) {
       
        return 23;
    }
    else{
        NSDictionary *ext = messageModel.message.ext;
        CGFloat height = [Utility stringSizeWithString:ext[@"msg"] textSize:13 width:SCREEN_WIDTH - 110 height:0].height + 4;
        height = height + 37 + 37.5;
        if (![Utility isBlankString:[ext objectForKey:@"link"]]) {
            height = height + 39.5;
        }
        if (![Utility isBlankString:[ext objectForKey:@"officeImgUrl"]]) {
            height = height + 140;
        }
        return height;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
