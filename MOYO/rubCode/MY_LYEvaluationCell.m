//
//  MY_LYEvaluationCell.m
//  DanZhouCity
//
//  Created by 羊羊 on 2017/7/14.
//  Copyright © 2017年 brian. All rights reserved.
//

#import "MY_LYEvaluationCell.h"
#import "XCRatingBar.h"

@interface MY_LYEvaluationCell ()<RatingBarDelegate>
@property(nonatomic,strong)XCRatingBar *bar;
@end

@implementation MY_LYEvaluationCell
+ (instancetype)cellWithTableView:(UITableView *)tableVeiw{
    static NSString *inderfidy = @"installerCell";
    MY_LYEvaluationCell *cell = [tableVeiw dequeueReusableCellWithIdentifier:inderfidy];
    if (cell == nil) {
        cell = [[MY_LYEvaluationCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:inderfidy];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.titleLbl = [[UILabel alloc] init];
        
        [self.titleLbl setFont:[UIFont systemFontOfSize:12]];
        [self.titleLbl setTextColor:[UIColor blackColor]];
        XCRatingBar *ratingBar = [[XCRatingBar alloc] init];
        
        [ratingBar setImageDeselected:@"star" halfSelected:nil fullSelected:@"redStar" andDelegate:self];
        self.bar = ratingBar;
        [self.contentView addSubview:ratingBar];
        [self.contentView addSubview:self.titleLbl];
    }
    return self;
}
- (void)setRating:(CGFloat)rating{
    _rating = rating;
    [self.bar displayRating:rating];
}
#pragma mark RatingBarDelegate
- (void)ratingChanged:(float)newRating viewTag:(NSInteger)tag{
    if ([self.delegate respondsToSelector:@selector(CellRatingChanged:viewInIndexPath:)]) {
        [self.delegate CellRatingChanged:newRating viewInIndexPath:self.indexpath];
    }
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat titLblW = self.customerTitleLblWidth>0 ? self.customerTitleLblWidth : 85;
    //    self.titleLbl.frame = CGRectMake(10, 0, titLblW, self.contentView.height);
    //    self.bar.frame =  CGRectMake(CGRectGetMaxX(self.titleLbl.frame)+5, (self.height-35)/2, self.contentView.width - 20- 30-100, 35);
}
@end
