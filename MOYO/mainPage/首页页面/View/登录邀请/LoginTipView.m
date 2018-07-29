//
//  LoginTipView.m
//  VTIME
//
//  Created by gll on 2017/11/2.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "LoginTipView.h"
#import "MY_LYMessageInfoModel.h"
@implementation LoginTipView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)awakeFromNib{
    
    
    
}


//  邀请 白富美
- (IBAction)goInviteGril:(UIButton *)sender {

    [self invitePersonal:0];
}
//}

//  邀请 高富帅
- (IBAction)goInviteMan:(UIButton *)sender {
    
    [self invitePersonal:1];
}

//  0 女 1 男
-(void)invitePersonal:(int)sex{
//    MY_LLPersonInfoModel * model = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *model = arry.firstObject;
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    [manager downloadImageWithURL:[NSURL URLWithString:model.headIcon] options:SDWebImageAllowInvalidSSLCertificates progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
        NSString * timeStr = [NSString stringWithFormat:@"%lf", (double)timeInterval];
        
        NSString *titleStr = @"闲趣：“闲暇之余，有趣约会”";//[NSString stringWithFormat:@"%@邀请你入驻V时代", model.nickName];
        NSString *detailsStr = [NSString stringWithFormat:@"网红模特们的新宠儿和有趣的灵魂分享你成功的人生这里只有卓越，拒绝平庸"];
        NSString *urlStr = ShareInviteFriendUrl(USERID,sex);
        
        NSArray* array = @[titleStr, detailsStr, urlStr];
        
        //创建分享消息对象
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
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
                
            }else{
                //                NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
                //                分享类型 1 微信朋友 2 微信朋友圈
                [self shareFinish:@"1"];
                [LQProgressHud showMessage:@"分享成功"];
            }
        }];
    }];
    
//    NSString * where = [NSString stringWithFormat:@"userId = %@", USERID];
//    [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//        if ([dataArray.firstObject isKindOfClass:[MY_LLPersonInfoModel class]]) {
//            MY_LLPersonInfoModel * model = dataArray.firstObject;
//
//            //            model.region = city;
//            //            model.longitude = longitude;
//            //            model.latitude = latitude;
//
//
//            SDWebImageManager *manager = [SDWebImageManager sharedManager];
//
//            [manager downloadImageWithURL:[NSURL URLWithString:model.headIcon] options:SDWebImageAllowInvalidSSLCertificates progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//
//            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//
//                NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
//                NSString * timeStr = [NSString stringWithFormat:@"%lf", (double)timeInterval];
//
//                NSString *titleStr = [NSString stringWithFormat:@"%@邀请你入驻V时代", model.nickName];
//                NSString *detailsStr = [NSString stringWithFormat:@"芳华绝代，独缺你的时代。"];
//                NSString *urlStr = ShareInviteFriendUrl(USERID,sex);
//
//                NSArray* array = @[titleStr, detailsStr, urlStr];
//
//                //创建分享消息对象
//                UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//                //创建网页内容对象
//                UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:titleStr descr:detailsStr thumImage:image];
//                //设置网页地址
//                shareObject.webpageUrl = urlStr;
//                //分享消息对象设置分享内容对象
//                messageObject.shareObject = shareObject;
//                //调用分享接口
//                [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatSession messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
//                    if (error) {
//                        [LQProgressHud showMessage:@"分享失败"];
//
//                    }else{
//                        //                NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
//                        //                分享类型 1 微信朋友 2 微信朋友圈
//                        [self shareFinish:@"1"];
//                        [LQProgressHud showMessage:@"分享成功"];
//                    }
//                }];
//            }];
//        }
//    }];
}


// 分享类型 1 微信朋友 2 微信朋友圈
-(void)shareFinish:(NSString*)shareType{
    
    NSDictionary * dict = @{@"plantform":@"0",@"type":shareType};
    
    [TLHTTPRequest MY_postWithBaseUrl:UserShareUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            NSLog(@"......");
            
        }else{
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
    
}


//  关闭view
- (IBAction)closeTipsView:(UIButton *)sender {
    
    [UIView animateWithDuration:.2 animations:^{
        
        [self setAlpha:0.0];
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
    
}



@end
