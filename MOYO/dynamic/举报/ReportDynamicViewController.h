//
//  ReportDynamicViewController.h
//  TogetherLu
//
//  Created by gll on 2017/3/8.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "BaseViewController.h"
//  举报动态
@interface ReportDynamicViewController : BaseViewController

@property (nonatomic, strong)NSString * reportOfImageUrl;// 举报的图片链接
@property (nonatomic, assign)NSNumber * repotrDynamicId; // 举报的动态ID
@property (nonatomic, strong)NSString * reportOfPerson;// 举报的昵称
@property (nonatomic, assign)NSInteger  repotrOfUserId;// 举报的用户ID

@end
