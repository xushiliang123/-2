//
//  LocationTableViewCell.h
//  TogetherLu
//
//  Created by Louie on 16/12/28.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CELLCLICKBLOCK)(NSInteger);

@interface LocationTableViewCell : UITableViewCell

@property (nonatomic, strong)NSArray * cityArray;

@property (nonatomic, copy)CELLCLICKBLOCK cellClickBlock;

@property (weak, nonatomic) IBOutlet UIButton *cityBtn1;
@property (weak, nonatomic) IBOutlet UIButton *cityBtn2;
@property (weak, nonatomic) IBOutlet UIButton *cityBtn3;
@property (weak, nonatomic) IBOutlet UIButton *cityBtn4;
@property (weak, nonatomic) IBOutlet UIButton *cityBtn5;
@property (weak, nonatomic) IBOutlet UIButton *cityBtn6;

@end
