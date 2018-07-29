//
//  MY_TTLShareView.m
//  TogetherLu
//
//  Created by MadridLee on 2017/1/10.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLShareOnlyView.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"
#define kAlertWidth SCREEN_WIDTH
#define kAlertHeight 216 //数字和pch文件的高度统一修改

//#define kTitleYOffset 15.0f
//#define kTitleHeight 25.0f
//
//#define kContentOffset 30.0f
//#define kBetweenLabelOffset 20.0f

#import "ShareMenuItem.h"
@interface MY_TTLShareOnlyView ()
{
    CGFloat space;
    CGFloat font;
    UIButton* _btnBack;
    NSArray* _arrayData;
    UIImage * _shareImage;
    
    NSInteger _type;    //属于什么类型的分享 0.什么都不传只有userId 1.服务 2，聊天室 3，约撸 4 动态 5,赚现金分享 6:要皮肤分享
    NSNumber* _typeId;  //传过来的各种ID，用type判断取值和存值
}

@property (nonatomic, strong) UIView *backImageView;
@end


@implementation MY_TTLShareOnlyView

//-(instancetype)initWithFrame:(CGRect)frame
-(instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)array image:(UIImage *)image type:(NSInteger)type typeId:(NSNumber *)typeId
{
    
    if (self = [super initWithFrame:frame])
    {
        _arrayData = [array copy];
        _shareImage = image;
        _type = type;
        _typeId = typeId;
        
        [self createShare];
        
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
    //    NSArray* imagArray=@[@"weixin", @"pengyouquan", @"QQicon", @"QQZoom"];
    NSArray* titleArray=@[@"微信好友",@"微信朋友圈"];
    NSArray* imagArray=@[@"weixin", @"pengyouquan"];
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
        [item addTarget:self action:@selector(selectedIndex:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)selectedIndex:(ShareMenuItem *)item{
    if (item.tag - 200 == 0) {
        //        _callBackTitle(item.tag-200);
        //创建分享消息对象
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
        //创建网页内容对象
        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:_arrayData[0] descr:_arrayData[1] thumImage:_shareImage];
        //设置网页地址
        shareObject.webpageUrl = _arrayData[2];
        
        //分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject;
        
        //调用分享接口
        [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatSession messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
            if (error) {
                [LQProgressHud showMessage:@"分享失败"];
            }else{
                
//                NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
                
//                分享类型 1 微信朋友 2 微信朋友圈
                [self shareFinish:@"1"];
                [LQProgressHud showMessage:@"分享成功"];

                
//                if (self.isShareCoin == 1) {
//                    [dict setObject:USERKEY forKey:@"key"];
//                    [TLHTTPRequest MY_postWithBaseUrl:ShareEarnMoneySuccessUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//
//                    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//                        [LQProgressHud showMessage:@"请求失败，请检查网络"];
//                    }];
//                }
//                else{
//                    if (_type == 1) {
//                        [dict setObject:_typeId forKey:@"serverType"];
//                    }
//                    else if (_type == 2)
//                    {
//                        [dict setObject:_typeId forKey:@"roomId"];
//                    }
//                    else if (_type == 3)
//                    {
//                        [dict setObject:_typeId forKey:@"lid"];
//                    }
//                    else if (_type == 4)
//                    {
//                        [dict setObject:_typeId forKey:@"dynamicId"];
//                    }
//                    else if (_type == 5)
//                    {
//                        [dict setObject:@1 forKey:@"earnCash"];
//                    }
//                    else if (_type == 6)
//                    {
//                        [dict setObject:@1 forKey:@"askForSkin"];
//                    }
//                    [dict setObject:@1 forKey:@"type"];
//                    [TLHTTPRequest MY_postWithBaseUrl:ShareCountAddUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//
//                    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//
//                    }];
//                }
            }
        }];
    }
    else if (item.tag - 200 == 1) {
        //创建分享消息对象
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
        //创建网页内容对象
        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:_arrayData[0] descr:_arrayData[1] thumImage:_shareImage];
        //设置网页地址
        shareObject.webpageUrl = _arrayData[2];
        
        //分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject;
        
        //调用分享接口
        [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatTimeLine messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
            if (error) {
                [LQProgressHud showMessage:@"分享失败"];
            }else{
                
                [LQProgressHud showMessage:@"分享成功"];
                //  分享类型 1 微信朋友 2 微信朋友圈
                [self shareFinish:@"2"];
                
                
//                NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
                
                
//                if (self.isShareCoin == 1) {
//                    [dict setObject:USERKEY forKey:@"key"];
//                    [TLHTTPRequest MY_postWithBaseUrl:ShareEarnMoneySuccessUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//
//                    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//                        [LQProgressHud showMessage:@"请求失败，请检查网络"];
//                    }];
//                }
//                else{
//                    if (_type == 1) {
//                        [dict setObject:_typeId forKey:@"serverType"];
//                    }
//                    else if (_type == 2)
//                    {
//                        [dict setObject:_typeId forKey:@"roomId"];
//                    }
//                    else if (_type == 3)
//                    {
//                        [dict setObject:_typeId forKey:@"lid"];
//                    }
//                    else if (_type == 4)
//                    {
//                        [dict setObject:_typeId forKey:@"dynamicId"];
//                    }
//                    else if (_type == 5)
//                    {
//                        [dict setObject:@1 forKey:@"earnCash"];
//                    }
//                    else if (_type == 6)
//                    {
//                        [dict setObject:@1 forKey:@"askForSkin"];
//                    }
//                    [dict setObject:@1 forKey:@"type"];
//                    [TLHTTPRequest MY_postWithBaseUrl:ShareCountAddUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//
//                    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//                        [LQProgressHud showMessage:@"请求失败，请检查网络"];
//                    }];
//                }
            }
        }];
    }
    else if (item.tag - 200 == 2) {
        
    }
    else{
        
    }
    [self dismissAlert];
}
// 分享类型 1 微信朋友 2 微信朋友圈
-(void)shareFinish:(NSString*)shareType{
    
    NSDictionary * dict = @{@"plantform":@"0",@"type":shareType};
    
    [TLHTTPRequest MY_postWithBaseUrl:UserShareUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
//            NSLog(@"......");
            
        }else{
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
    
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
