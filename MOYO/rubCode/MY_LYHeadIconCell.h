//
//  MY_LYHeadIconCell.h
//  DanZhouCity
//
//  Created by 羊羊 on 2017/7/20.
//  Copyright © 2017年 brian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_LYHeadIconCell : UITableViewCell
@property (nonatomic, strong)UILabel *titleLbl;
@property (nonatomic, strong)UIImageView *imageIcon;
+ (instancetype)cellWithTableView:(UITableView *)tableVeiw;
@end
