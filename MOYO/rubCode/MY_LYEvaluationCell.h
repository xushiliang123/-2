//
//  MY_LYEvaluationCell.h
//  DanZhouCity
//
//  Created by 羊羊 on 2017/7/14.
//  Copyright © 2017年 brian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EvaluationCellDelegate <NSObject>

@optional
- (void)CellRatingChanged:(float)newRating viewInIndexPath:(NSIndexPath*)indexpath;

@end

@interface MY_LYEvaluationCell : UITableViewCell
@property (nonatomic, strong)UILabel *titleLbl;
@property (nonatomic, assign)CGFloat rating; //设置评分值
@property (nonatomic, assign)CGFloat customerTitleLblWidth;
@property(nonatomic,weak)id <EvaluationCellDelegate> delegate;
@property (nonatomic, strong)NSIndexPath *indexpath;
+ (instancetype)cellWithTableView:(UITableView *)tableVeiw;
@end
