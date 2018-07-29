//
//  RootBaseViewController.h
//  TogetherLu
//
//  Created by Louie on 16/12/24.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

//#import "DataBaseViewController.h"
#import <UIKit/UIKit.h>

@interface RootBaseViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>
//  极光相关
{
    NSMutableArray *_messageContents;
    int _messageCount;
    int _notificationCount;
    
}



@property (nonatomic, strong)UITableView * tableView;

//  创建TableView
- (void)createTableView;

//  自定义tabBar按钮(自定义背景图)
- (void)addNavBtn:(NSString *)title isLeft:(BOOL)isLeft target:(id)target action:(SEL)action bgImageName:(NSString *)bgImageName;
//  自定义tabBar按钮(固定背景图)
- (void)addNavBtn:(NSString *)title target:(id)target action:(SEL)action;

//  自定义头部提示框
- (void)addCustomAlertViewWithMessge:(NSString *)messge;

+(CGFloat)GetFontHeight:(CGFloat)fontSize withBold:(BOOL)isBold;//获取单行字体高度

+(CGSize)GetStringRect:(NSString*)strText withWidth:(float)width withFont:(UIFont *)font;//换行的label.返回字体高度

//  退出登录
- (void)loginOut;

@end
