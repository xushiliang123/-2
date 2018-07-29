//
//  MY_GLShareView.m
//  VTIME
//
//  Created by gll on 2017/11/20.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLShareView.h"


#import "ShareMenuItem.h"

#define kAlertWidth SCREEN_WIDTH
#define kAlertHeight 216 //数字和pch文件的高度统一修改

@interface MY_GLShareView ()
{
    CGFloat space;
    CGFloat font;
    UIButton* _btnBack;
    NSDictionary* _dataDictionary;
//    UIImage * _shareImage;
    
    NSInteger _type;    //属于什么类型的分享 0.什么都不传只有userId 1.服务 2，聊天室 3，约撸 4 动态 5,赚现金分享 6:要皮肤分享
    NSNumber* _typeId;  //传过来的各种ID，用type判断取值和存值
    
    NSArray* titleArray;
    NSArray* imagArray;
}

@property (nonatomic, strong) UIView *backImageView;
@end

@implementation MY_GLShareView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithFrame:(CGRect)frame withDic:(NSDictionary *)bodyDic type:(NSInteger)type typeId:(NSNumber *)typeId sharetype:(NSInteger)sharetype
{
    
    if (self = [super initWithFrame:frame])
    {
        
        _dataDictionary = [bodyDic copy];
        _type = type;
        _typeId = typeId;
        
        //  分享的方式 2:微信好友和朋友圈 0：微信好友  1：朋友圈
        
        if(sharetype == 0)
        {
            titleArray=@[@"微信好友"];
            imagArray=@[@"weixin"];
        }
        else if(sharetype == 1)
        {
            titleArray=@[@"微信朋友圈"];
            imagArray=@[@"pengyouquan"];
        }else{
            titleArray=@[@"微信好友",@"微信朋友圈"];
            imagArray=@[@"weixin", @"pengyouquan"];
        }
        
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
//    NSArray* titleArray=@[@"微信好友",@"微信朋友圈"];
    
//    NSArray* imagArray=@[@"weixin", @"pengyouquan"];
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

-(void)createShareForPYQ
{
    
    //分享的方式 2:微信好友和朋友圈 0：微信好友  1：朋友圈
    
    NSArray* titleArray=@[@"微信朋友圈"];
    NSArray* imagArray=@[@"pengyouquan"];
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
        item.tag = 201;
        [item addTarget:self action:@selector(selectedIndex:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)selectedIndex:(ShareMenuItem *)item{
    
//    NSString *titleStr = bodyDic[@"title"];
//    NSString *detailsStr = bodyDic[@"desc"];
//    NSString *urlStr = bodyDic[@"link"];
    
    //  分享的方式 1 微信朋友 2 微信朋友圈

    NSInteger shartypeInt = 2;
    if ([item.platformNameLabel.text isEqualToString:@"微信好友"]) {
        shartypeInt = 1;
    }
    
    if (shartypeInt == 1) {
        //        _callBackTitle(item.tag-200);
        //创建分享消息对象
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
        
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        
        [manager downloadImageWithURL:[NSURL URLWithString:_dataDictionary[@"imgUrl"]] options:SDWebImageAllowInvalidSSLCertificates progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            
//            NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
//            NSString * timeStr = [NSString stringWithFormat:@"%lf", (double)timeInterval];
            
            NSString *titleStr = _dataDictionary[@"title"];
            NSString *detailsStr = _dataDictionary[@"desc"];
            NSString *urlStr = _dataDictionary[@"link"];
            
            //创建网页内容对象
            UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:titleStr descr:detailsStr thumImage:image];
            //设置网页地址
            shareObject.webpageUrl = urlStr;
            
            //分享消息对象设置分享内容对象
            messageObject.shareObject = shareObject;
            
            //调用分享接口
            [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatSession messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
                if (error) {
                    [LQProgressHud showMessage:@"分享失败"];
                    [self dismissAlert];

                }else{
                    //                分享类型 1 微信朋友 2 微信朋友圈
                    [self shareFinish:@"1"];
                    [LQProgressHud showMessage:@"分享成功"];
                }
            }];
            
        }];
        
    }
    else if (shartypeInt == 2) {
        //创建分享消息对象
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
        //创建网页内容对象
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        
        [manager downloadImageWithURL:[NSURL URLWithString:_dataDictionary[@"imgUrl1"]] options:SDWebImageAllowInvalidSSLCertificates progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            
            //            NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
            //            NSString * timeStr = [NSString stringWithFormat:@"%lf", (double)timeInterval];
            
            NSString *titleStr = _dataDictionary[@"title1"];
            NSString *detailsStr = _dataDictionary[@"desc1"];
            NSString *urlStr = _dataDictionary[@"link1"];
            
            //创建网页内容对象
            UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:titleStr descr:detailsStr thumImage:image];
            //设置网页地址
            shareObject.webpageUrl = urlStr;
            
            //分享消息对象设置分享内容对象
            messageObject.shareObject = shareObject;
            
            //调用分享接口
            [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatTimeLine messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
                if (error) {
                    [LQProgressHud showMessage:@"分享失败"];
                    [self dismissAlert];

                }else{
                    //                分享类型 1 微信朋友 2 微信朋友圈
                    [self shareFinish:@"2"];
                    [LQProgressHud showMessage:@"分享成功"];
                }
            }];
        }];
    }

//    [self dismissAlert];
}

// 分享类型 1 微信朋友 2 微信朋友圈
-(void)shareFinish:(NSString*)shareTp{
    
    NSDictionary * dict = @{@"plantform":@"0",@"type":shareTp,@"activityId":@(_type)};
    
    [TLHTTPRequest MY_postWithBaseUrl:UserShareUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
//            NSLog(@"......");
            
        }else{
        }
        
        [self dismissAlert];

        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"没网怎能忍？"];
        [self dismissAlert];

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
