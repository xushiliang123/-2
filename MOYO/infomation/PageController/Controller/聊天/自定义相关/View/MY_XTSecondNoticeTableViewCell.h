//
//  MY_XTSecondNoticeTableViewCell.h
//  VTIME
//
//  Created by tingting on 2017/10/20.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_XTSecondNoticeTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *title;

@property(nonatomic,strong)UILabel *yuanyin;

@property(nonatomic,strong)UILabel *des;

-(void)setUpCellWithDic:(NSDictionary *)dic;

-(void)layoutForCell;

@end
