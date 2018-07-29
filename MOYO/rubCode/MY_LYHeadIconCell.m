//
//  MY_LYHeadIconCell.m
//  DanZhouCity
//
//  Created by 羊羊 on 2017/7/20.
//  Copyright © 2017年 brian. All rights reserved.
//

#import "MY_LYHeadIconCell.h"



@implementation MY_LYHeadIconCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLbl = [[UILabel alloc] init];
//        [self.titleLbl setFont:kTextFont(FontNormalSize)];
        [self.titleLbl setTextColor:[UIColor blackColor]];
        self.imageIcon = [[UIImageView alloc] init];
        self.imageIcon.image = [UIImage imageNamed:@"touxiang.png"];
//        self.imageIcon.fyl_cornerRadius = 20;
        [self.contentView addSubview:self.titleLbl];
        [self.contentView addSubview:self.imageIcon];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableVeiw{
    static NSString *inderfidy = @"addBackCardCell";
    MY_LYHeadIconCell *cell = [tableVeiw dequeueReusableCellWithIdentifier:inderfidy];
    if (cell == nil) {
        cell = [[MY_LYHeadIconCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:inderfidy];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    return cell;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat titLblW = 85;
//    self.titleLbl.frame = CGRectMake(15, 0, titLblW, self.contentView.height);
//    self.imageIcon.frame = CGRectMake(self.width-75, 5, 40, 40);
}

@end
