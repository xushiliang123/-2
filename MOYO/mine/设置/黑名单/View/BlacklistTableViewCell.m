//
//  BlacklistTableViewCell.m
//  TogetherLu
//
//  Created by Louie on 16/12/29.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "BlacklistTableViewCell.h"
#import "BlacklistModel.h"

@implementation BlacklistTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    
    if (self){
        
        [self createCellUI];
    }
    
    return self;
}


//  UI
- (void)createCellUI{
    
//  头像
    self.headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 60, 60)];
    self.headImageView.layer.cornerRadius = 60 * 0.15;
    self.headImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.headImageView];
    
//   昵称
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImageView.frame) + 8, CGRectGetMinY(self.headImageView.frame), SCREEN_WIDTH - 170, 16)];
    self.nameLabel.textColor = [Utility colorWithHexString:@"#333333" alpha:1.0];
    self.nameLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.nameLabel];
    
    
//  动态
    UIColor * dynamicColor = [Utility colorWithHexString:@"#999999" alpha:1.0];
    self.dynamicLabel = [Utility createLabeltitleColor:dynamicColor frame:CGRectMake(CGRectGetMaxX(self.headImageView.frame) + 8, CGRectGetMaxY(self.nameLabel.frame) + 10 + 13 + 10, SCREEN_WIDTH - 176, 11) BackgroundColor:nil textSize:11];
    self.dynamicLabel.numberOfLines = 1;
    [self.contentView addSubview:self.dynamicLabel];
    
//  移除黑名单
    UIColor * labelColor = GOLDCOLOR;
    UILabel * removerLabel = [Utility createLabeltitleColor:labelColor frame:CGRectMake(SCREEN_WIDTH - 80, (80 - 22) / 2, 65, 22) BackgroundColor:nil textSize:11];
    removerLabel.layer.masksToBounds = YES;
    removerLabel.layer.cornerRadius = 3;
    removerLabel.layer.borderWidth = 1.0;
    removerLabel.layer.borderColor = labelColor.CGColor;
    removerLabel.text = @"移出黑名单";
    removerLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:removerLabel];
    
//    [self test];
}


- (void)test{
    
    self.headImageView.image = [UIImage imageNamed:@"tempImage"];
    self.nameLabel.text = @"从前有一个小虫子";

    
    self.typeImageView.image = [UIImage imageNamed:@"xianxiaLOL"];
    self.dynamicLabel.text = @"只要打出五行字只要打出五行字只要打出五行字只要打出五行字只要打出五行字只要打出。";
}


-(void)setModel:(BlacklistModel *)model{
    _model = model;
    
    if (![Utility isBlankString:model.headIcon])//头像
    {
        NSURL*headImageUrl= [NSURL URLWithString:[model.headIcon
                                                  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        UIImage *headImg = [UIImage imageNamed:@"占位_头像"];
        [self.headImageView sd_setImageWithURL:headImageUrl placeholderImage:headImg options:SDWebImageAllowInvalidSSLCertificates];
    }
    if (![Utility isBlankString:model.nickName])//昵称
    {
        self.nameLabel.text = model.nickName;
    }
    else{
        self.nameLabel.text = @"暂无昵称";
    }
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
