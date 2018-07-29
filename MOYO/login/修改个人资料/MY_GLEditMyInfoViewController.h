//
//  MY_GLEditMyInfoViewController.h
//  VTIME
//
//  Created by gll on 2017/9/9.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "BaseViewController.h"


@interface MY_GLEditMyInfoViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIButton *headImgButton;

@property (weak, nonatomic) IBOutlet UITextField *nickNametextfield;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;

//@property (strong, nonatomic) SXPickPhoto* pickPhoto;//相册类
@property (strong, nonatomic) NSMutableArray* arrayPage;//图片数组
@property (strong, nonatomic) NSMutableDictionary* dictData;

@property (weak, nonatomic)IBOutlet UIPickerView *agePickerView;
@property (weak, nonatomic)IBOutlet UIPickerView *staturePickerView;


@property (assign,nonatomic)NSInteger isEditInfo;// 1跳转标签




@end
