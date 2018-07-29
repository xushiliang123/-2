//
//  MY_TTLShareOnlyView.h
//  TogetherLu
//
//  Created by MadridLee on 2017/2/14.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_TTLShareOnlyView : UIView

@property (assign, nonatomic) NSInteger isShareCoin;    //是否是我的页面的赚现金。1，是    其他，不是


//array0,标题 array1：详情 array2：url
-(instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)array image:(UIImage *)image type:(NSInteger)type typeId:(NSNumber *)typeId;



- (void)show;


@end
