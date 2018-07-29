//
//  MY_TTLShareView.h
//  TogetherLu
//
//  Created by MadridLee on 2017/1/10.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_TTLShareView : UIView
//frame：ShareFrame
//array0,标题 array1：详情 array2：url
-(instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)array withSelfInfo:(BOOL)isSelf withDelete:(BOOL)isDelete image:(UIImage *)image type:(NSInteger)type typeId:(NSNumber *)typeId;

@property(strong,nonatomic)void(^callBackTitle)(NSInteger);
- (void)show;

//-(void) 。。。。。。。。。。。。。。

@end
