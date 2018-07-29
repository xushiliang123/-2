//
//  MY_TTLShareView.m
//  TogetherLu
//
//  Created by MadridLee on 2017/1/10.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLShareView.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"
#define kAlertWidth SCREEN_WIDTH
#define kAlertHeight 216 //数字和pch文件的高度统一修改

//#define kTitleYOffset 15.0f
//#define kTitleHeight 25.0f

//#define kContentOffset 30.0f
//#define kBetweenLabelOffset 20.0f

#import "ShareMenuItem.h"

@interface MY_TTLShareView ()
{
    CGFloat space;
    CGFloat font;
    UIButton* _btnBack;
    NSArray* _arrayData;
    UIImage * _shareImage;
    
    NSInteger _type;    //属于什么类型的分享 1.服务 2，聊天室 3，约撸 4 动态
    NSNumber* _typeId;  //传过来的各种ID，用type判断取值和存值
}

@property (nonatomic, strong) UIView *backImageView;
@end


@implementation MY_TTLShareView

//-(instancetype)initWithFrame:(CGRect)frame
-(instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)array withSelfInfo:(BOOL)isSelf withDelete:(BOOL)isDelete image:(UIImage *)image type:(NSInteger)type typeId:(NSNumber *)typeId
{
    
    if (self = [super initWithFrame:frame])
    {
        _arrayData = [array copy];
        _shareImage = image;
        _type = type;
        _typeId = typeId;
        
//        [self createShare];
        self.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];

        [self createIsSelf:isSelf withDelete:isDelete];
        
        UIButton* cancle=[UIButton buttonWithType:UIButtonTypeCustom];
        [cancle setTitle:@"取消" forState:UIControlStateNormal];
        [cancle setTitleColor:[Utility colorWithHexString:@"333333" alpha:1] forState:UIControlStateNormal];
        cancle.titleLabel.font = [UIFont systemFontOfSize:16];
        cancle.frame=CGRectMake(0, self.frame.size.height - 50, SCREEN_WIDTH, 50);
        cancle.backgroundColor=[UIColor whiteColor];
        [cancle addTarget:self action:@selector(dismissAlert) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancle];
        
    }
    return self;
}


-(void)createShare
{
    //    NSArray* titleArray=@[@"微信好友",@"微信朋友圈",@"QQ好友",@"QQ空间"];
    //    NSArray* imagArray=@[@"weixin",@"pengyouquan",@"QQicon",@"QQZoom"];
    
    NSArray* titleArray=@[@"微信好友",@"微信朋友圈"];
    NSArray* imagArray=@[@"weixin",@"pengyouquan"];
    
    self.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    self.alpha = 1;
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 100, 18)];
    label.text = @"分享到";
    label.font = [UIFont systemFontOfSize:18];
    label.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    [self addSubview:label];
    int widthSpace = 0;
    for(int i = 0;i < titleArray.count ; i++)
    {
        if (SCREEN_WIDTH < 375) {
            widthSpace = 10 + (70 + (SCREEN_WIDTH - 300)/3)*i;
        }
        else if (SCREEN_WIDTH == 375)
        {
            widthSpace = 10 + (80 + (SCREEN_WIDTH - 340)/3)*i;
        }
        else{
            widthSpace = 10 + (80 + (SCREEN_WIDTH - 350)/3)*i;
        }
        ShareMenuItem* item = [[ShareMenuItem alloc]initWithFrame:CGRectMake( widthSpace, 53, 80, 93)];
        [self addSubview:item];
        item.logoImageView.image = [UIImage imageNamed:imagArray[i]];
        item.platformNameLabel.text = titleArray[i];
        item.platformNameLabel.font = [UIFont systemFontOfSize:13];
        item.platformNameLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
        item.platformNameLabel.textAlignment = NSTextAlignmentCenter;
        item.tag = 200 + i;
        [item addTarget:self action:@selector(selectIndex:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 160, SCREEN_WIDTH, 1)];
    [self addSubview:view];
    view.backgroundColor = [Utility colorWithHexString:@"e5e5e5" alpha:1];
}

// isSelf 用来判断 是否是个人信息界面
-(void)createIsSelf:(BOOL)isSelf withDelete:(BOOL)isDelete
{
    
    if (isSelf == YES) {
        NSArray* titleArray=@[@"拉黑",@"举报"];
        NSArray* imagArray=@[@"lahei",@"jubao"];
        int widthSpace = 0;
        for(int i=0;i<2;i++)
        {
            if (SCREEN_WIDTH < 375) {
                widthSpace = 10 + (70 + (SCREEN_WIDTH - 300)/3)*i;
            }
            else if (SCREEN_WIDTH == 375)
            {
                widthSpace = 10 + (80 + (SCREEN_WIDTH - 340)/3)*i;
            }
            else{
                widthSpace = 10 + (80 + (SCREEN_WIDTH - 350)/3)*i;
            }
            ShareMenuItem* item = [[ShareMenuItem alloc]initWithFrame:CGRectMake( widthSpace, (self.frame.size.height - 50 - 93)/2, 80, 93)];
            [self addSubview:item];
            item.logoImageView.image = [UIImage imageNamed:imagArray[i]];
            item.platformNameLabel.text = titleArray[i];
            item.platformNameLabel.font = [UIFont systemFontOfSize:13];
            item.platformNameLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
            item.platformNameLabel.textAlignment = NSTextAlignmentCenter;
            item.tag = 300 + i;
            [item addTarget:self action:@selector(deleteSelectedIndex:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    else
    {
        NSArray* titleArray=@[@"删除",@"举报"];
        NSArray* imagArray=@[@"delete",@"jubao"];
        ShareMenuItem* item = [[ShareMenuItem alloc]initWithFrame:CGRectMake(15, 175, 70, 93)];
        [self addSubview:item];
        if (isDelete == YES) {
            //删除
            item.logoImageView.image = [UIImage imageNamed:imagArray[0]];
            item.platformNameLabel.text = titleArray[0];
            item.tag = 300;
        }
        else{
            //举报
            item.logoImageView.image = [UIImage imageNamed:imagArray[1]];
            item.platformNameLabel.text = titleArray[1];
            item.tag = 301;
        }
        item.platformNameLabel.font = [UIFont systemFontOfSize:13];
        item.platformNameLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
        item.platformNameLabel.textAlignment = NSTextAlignmentCenter;
        [item addTarget:self action:@selector(deleteSelectedIndex:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
}

#pragma mark---查询
-(void)selectIndex:(ShareMenuItem*)item
{
//    if (item.tag - 200 == 0) {
//        //        _callBackTitle(item.tag-200);
//        //创建分享消息对象
//        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//        //创建网页内容对象
//        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:_arrayData[0] descr:_arrayData[1] thumImage:_shareImage];
//        //设置网页地址
//        shareObject.webpageUrl = _arrayData[2];
//        
//        //分享消息对象设置分享内容对象
//        messageObject.shareObject = shareObject;
//        
//        //调用分享接口
//        [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatSession messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
//            if (error) {
//                [LQProgressHud showMessage:@"分享失败"];
//            }else{
//                NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
////                [dict setObject:USERKEY forKey:@"key"];
//                if (_type == 1) {
//                    [dict setObject:_typeId forKey:@"serverType"];
//                }
//                else if (_type == 2)
//                {
//                    [dict setObject:_typeId forKey:@"roomId"];
//                }
//                else if (_type == 3)
//                {
//                    [dict setObject:_typeId forKey:@"lid"];
//                }
//                else if (_type == 4)
//                {
//                    [dict setObject:_typeId forKey:@"dynamicId"];
//                }
//                else if (_type == 5)
//                {
//                    [dict setObject:@1 forKey:@"earnCash"];
//                }
//                else if (_type == 6)
//                {
//                    [dict setObject:@1 forKey:@"askForSkin"];
//                }
//                [dict setObject:@1 forKey:@"type"];
//                [TLHTTPRequest MY_postWithBaseUrl:@"/dataapi/rednet/shareCount" parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//                    
//                } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//                    
//                }];
//            }
//        }];
//    }
//    else if (item.tag - 200 == 1) {
//        //创建分享消息对象
//        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//        //创建网页内容对象
//        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:_arrayData[0] descr:_arrayData[1] thumImage:_shareImage];
//        //设置网页地址
//        shareObject.webpageUrl = _arrayData[2];
//        
//        //分享消息对象设置分享内容对象
//        messageObject.shareObject = shareObject;
//        
//        //调用分享接口
//        [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatTimeLine messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
//            if (error) {
//                [LQProgressHud showMessage:@"分享失败"];
//            }else{
//                NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
////                [dict setObject:USERKEY forKey:@"key"];
//                if (_type == 1) {
//                    [dict setObject:_typeId forKey:@"serverType"];
//                }
//                else if (_type == 2)
//                {
//                    [dict setObject:_typeId forKey:@"roomId"];
//                }
//                else if (_type == 3)
//                {
//                    [dict setObject:_typeId forKey:@"lid"];
//                }
//                else if (_type == 4)
//                {
//                    [dict setObject:_typeId forKey:@"dynamicId"];
//                }
//                else if (_type == 5)
//                {
//                    [dict setObject:@1 forKey:@"earnCash"];
//                }
//                else if (_type == 6)
//                {
//                    [dict setObject:@1 forKey:@"askForSkin"];
//                }
//                [dict setObject:@2 forKey:@"type"];
//                [TLHTTPRequest MY_postWithBaseUrl:@"/dataapi/rednet/shareCount" parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//                    
//                } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//                    
//                }];
//            }
//        }];
//    }
//    else if (item.tag - 200 == 2) {
//        
//    }
//    else{
//        
//    }
    [self dismissAlert];
}


-(void)deleteSelectedIndex:(ShareMenuItem *)item{
    
    if (item.tag - 300 == 0) {// 删除
        _callBackTitle(item.tag-300);
        
    }
    else{// 举报
        _callBackTitle(item.tag-300);
    }
    [self dismissAlert];
    
}

- (void)dismissAlert
{
    [UIView animateWithDuration:0.2 animations:^{
        [self removeFromSuperview];
    }];
    
    
}


- (void)show
{
    UIViewController *topVC = [self appRootViewController];
    //self.frame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kAlertWidth) * 0.5, - kAlertHeight - 30, 200, 550);
    [topVC.view addSubview:self];
}

- (UIViewController *)appRootViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}


- (void)removeFromSuperview
{
    [self.backImageView removeFromSuperview];
    self.backImageView = nil;
    UIViewController *topVC = [self appRootViewController];
    CGRect afterFrame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kAlertWidth) * 0.5, CGRectGetHeight(topVC.view.bounds), kAlertWidth, kAlertHeight);
    
    self.frame=afterFrame;
    [super removeFromSuperview];
    //    [UIView animateWithDuration:0.5f delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
    //        self.frame = afterFrame;
    //        [super removeFromSuperview];
    //    } completion:^(BOOL finished) {
    //
    //    }];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview == nil) {
        return;
    }
    UIViewController *topVC = [self appRootViewController];
    
    if (!self.backImageView) {
        self.backImageView = [[UIView alloc] initWithFrame:topVC.view.bounds];
        self.backImageView.backgroundColor = [UIColor blackColor];
        self.backImageView.alpha = 0;
        self.backImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        _btnBack = [UIButton buttonWithType:UIButtonTypeSystem];
        _btnBack.frame = self.backImageView.bounds;
        _btnBack.backgroundColor = [UIColor clearColor];
        [self addSubview:_btnBack];
        [_btnBack addTarget:self action:@selector(hideShareClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    [topVC.view addSubview:self.backImageView];
    [self.backImageView addSubview:_btnBack];
    CGRect afterFrame = CGRectMake(0, SCREEN_HEIGHT-kAlertHeight, SCREEN_WIDTH, kAlertHeight);
    self.frame = afterFrame;
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        //self.transform = CGAffineTransformMakeRotation(0);
        self.backImageView.alpha = 0.4f;
        self.frame = afterFrame;
    } completion:^(BOOL finished) {
    }];
    [super willMoveToSuperview:newSuperview];
}
-(void)hideShareClick:(UIButton *)btn
{
    [self dismissAlert];
}

@end

@implementation UIImage (colorful)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
