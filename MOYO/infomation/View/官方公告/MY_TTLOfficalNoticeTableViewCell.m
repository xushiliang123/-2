//
//  MY_TTLOfficalNoticeTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2017/1/4.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLOfficalNoticeTableViewCell.h"


@implementation MY_TTLOfficalNoticeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createCell];
    }
    return self;
}



-(void) createCell
{
    self.imgvIcon = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 50, 50)];
    self.imgvIcon.image = [UIImage imageNamed:@"占位图"];
    [self.contentView addSubview:self.imgvIcon];
    
    self.viewBack = [[UIView alloc]init ];
//                     WithFrame:CGRectMake(70, 0, SCREEN_WIDTH - 90, 150)];
    self.viewBack.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.viewBack];
    self.viewBack.layer.masksToBounds = YES;
    self.viewBack.layer.cornerRadius = 3;
    self.viewBack.layer.borderWidth = 0.5;
    self.viewBack.layer.borderColor = [Utility colorWithHexString:@"dddddd" alpha:1].CGColor;
    [self.viewBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgvIcon.mas_right).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.height.mas_equalTo(180);
    }];
    
    
    self.imgvHeader = [[UIImageView alloc]init];
//    self.imgvHeader.backgroundColor = [UIColor redColor];
    [self.viewBack addSubview:self.imgvHeader];
    [self.imgvHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.viewBack.mas_left).offset(10);
        make.right.equalTo(self.viewBack.mas_right).offset(-10);
        make.top.equalTo(self.viewBack.mas_top).offset(10);
        make.height.mas_equalTo(130);
    }];
    
    
    
    self.labelTitle = [[UILabel alloc]init];
    self.labelTitle.font = [UIFont systemFontOfSize:15];
    self.labelTitle.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    [self.viewBack addSubview:self.labelTitle];
    [self.labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.viewBack.mas_left).offset(10);
        make.right.equalTo(self.viewBack.mas_right).offset(-10);
        make.top.equalTo(self.imgvHeader.mas_bottom).offset(10);
        make.height.mas_equalTo(15);
    }];
    
    self.line1 = [[UIView alloc]init];
    self.line1.backgroundColor = [Utility colorWithHexString:@"dddddd" alpha:0.4];
    [self.viewBack addSubview:self.line1];
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.viewBack.mas_left).offset(10);
        make.right.equalTo(self.viewBack.mas_right).offset(0);
        make.top.equalTo(self.labelTitle.mas_bottom).offset(10);
        make.height.mas_equalTo(0.5);
    }];
    
    
    self.labelDetail = [[UILabel alloc]init];
    self.labelDetail.font = [UIFont systemFontOfSize:13];
    self.labelDetail.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    self.labelDetail.numberOfLines = 0;
    [self.viewBack addSubview:self.labelDetail];
    [self.labelDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.viewBack.mas_left).offset(10);
        make.right.equalTo(self.viewBack.mas_right).offset(-10);
        make.top.equalTo(self.line1.mas_bottom).offset(10);
        make.height.mas_equalTo(100);
    }];
    
    
    
    self.watchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.watchBtn setTitle:@"立即查看" forState:UIControlStateNormal];
    self.watchBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.watchBtn setTitleColor:GOLDCOLOR forState:UIControlStateNormal];
    [self.viewBack addSubview:self.watchBtn];
    [self.watchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.viewBack.mas_left).offset(10);
        make.bottom.equalTo(self.viewBack.mas_bottom).offset(-10);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(60);
    }];
    
    self.leftImgv = [[UIImageView alloc]init];
    self.leftImgv.image = [UIImage imageNamed:@"ManitoViewControllermore"];
    [self.viewBack addSubview:self.leftImgv];
    [self.leftImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.watchBtn.mas_right).offset(5);
        make.bottom.equalTo(self.viewBack.mas_bottom).offset(-11);
        make.height.mas_equalTo(13);
        make.width.mas_equalTo(7.5);
    }];
    
    
    self.line2 = [[UIView alloc]init];
    self.line2.backgroundColor = [Utility colorWithHexString:@"dddddd" alpha:0.4];
    [self.viewBack addSubview:self.line2];
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.viewBack.mas_left).offset(0);
        make.right.equalTo(self.viewBack.mas_right).offset(0);
        make.bottom.equalTo(self.watchBtn.mas_top).offset(-10);
        make.height.mas_equalTo(0.5);
    }];
}




-(void)showData:(id<IMessageModel>)model
{
    NSDictionary *ext = model.message.ext;
    
    [self.imgvIcon sd_setImageWithURL:ext[@"avatarURLPath"] placeholderImage:[UIImage imageNamed:@"占位图"]];
    
    //背景框
    [self.viewBack mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.height);
    }];
    //详情高度
    CGFloat heightDetail = [Utility stringSizeWithString:[ext objectForKey:@"msg"] textSize:13 width:SCREEN_WIDTH - 110 height:0].height + 4;
    [self.labelDetail mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(heightDetail);
    }];
    //无连接隐藏分割线和按钮
    if ([Utility isBlankString:[ext objectForKey:@"link"]]) {
        self.line2.hidden = YES;
        self.watchBtn.hidden = YES;
        self.leftImgv.hidden = YES;
        [self.line2 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        [self.watchBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        
        
    }
    else{
        self.line2.hidden = NO;
        self.watchBtn.hidden = NO;
        self.leftImgv.hidden = NO;
        [self.line2 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0.5);
        }];
        [self.watchBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(15);
        }];
    }
    if ([Utility isBlankString:[ext objectForKey:@"officeImgUrl"]]) {
        self.imgvHeader.hidden = YES;
        [self.imgvHeader mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        [self.labelTitle mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgvHeader.mas_bottom).offset(0);
        }];
    }
    else{
        self.imgvHeader.hidden = NO;
        [self.imgvHeader sd_setImageWithURL:[ext objectForKey:@"officeImgUrl"]];
        [self.imgvHeader mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(130);
        }];
        [self.labelTitle mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgvHeader.mas_bottom).offset(10);
        }];
    }
    
    self.labelTitle.text = model.text;
//    self.labelDetail.text = [ext objectForKey:@"msg"];
    
    
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
