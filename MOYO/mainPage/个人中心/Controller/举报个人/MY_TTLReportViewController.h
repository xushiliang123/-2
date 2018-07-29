//
//  MY_TTLReportViewController.h
//  TogetherLu
//
//  Created by MadridLee on 2016/12/30.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "BaseViewController.h"


//  举报个人
@interface MY_TTLReportViewController : BaseViewController

@property (nonatomic, strong)NSString * reportOfPerson;
@property (nonatomic, assign)NSInteger repotrOfUserId;
@property (nonatomic, assign)NSInteger reportOfRoomId;  //聊天室id


@end
