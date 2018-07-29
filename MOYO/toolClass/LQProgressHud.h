//
//  LQProgressHud.h
//  DagolfLa
//
//  Created by Madridlee on 16/11/2.
//  Copyright © 2016年 bhxx. All rights reserved.
//

#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger, LQProgressHUDStatus) {
    
    /** 成功 */
    LQProgressHUDStatusSuccess,
    
    /** 失败 */
    LQProgressHUDStatusError,
    
    /** 提示 */
    LQProgressHUDStatusInfo,
    
    /** 等待 */
    LQProgressHUDStatusWaitting
};

@interface LQProgressHud : MBProgressHUD

/**
 *  是否正在显示
 */
@property (nonatomic, assign, getter=isShowNow) BOOL showNow;

/** 返回一个 HUD 的单例 */
+ (instancetype)sharedHUD;

/** 在 window 上添加一个 HUD */
+ (void)showStatus:(LQProgressHUDStatus)status text:(NSString *)text;



#pragma mark - 建议使用的方法

/** 在 window 上添加一个只显示文字的 HUD */
+ (void)showMessage:(NSString *)text;

/** 在 window 上添加一个提示`信息`的 HUD */
+ (void)showInfoMsg:(NSString *)text;

/** 在 window 上添加一个提示`失败`的 HUD */
+ (void)showFailure:(NSString *)text;

/** 在 window 上添加一个提示`成功`的 HUD */
+ (void)showSuccess:(NSString *)text;

/** 在 window 上添加一个提示`等待`的 HUD, 需要手动关闭 */
+ (void)showLoading:(NSString *)text;

/** 手动隐藏 HUD */
+ (void)hide;
@end
