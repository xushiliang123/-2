//
//  MY_TTLMyHeaderTableViewCell.m
//  VTIME
//
//  Created by MadridLee on 2017/9/11.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLMyHeaderTableViewCell.h"

@interface MY_TTLMyHeaderTableViewCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameMaxWidth;

@end

@implementation MY_TTLMyHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.headImg.layer.masksToBounds = YES;
    self.headImg.layer.cornerRadius  = self.headImg.frame.size.height/2;
    
    self.vipLevelLabel.layer.masksToBounds = YES;
    self.vipLevelLabel.layer.cornerRadius  = 8;
    
    self.nobeLabel.layer.cornerRadius = 7;
    self.nobeLabel.layer.masksToBounds = YES;
    self.nobeLabel.layer.borderColor = [Utility colorWithHexString:@"#fffc00" alpha:1].CGColor;
    self.nobeLabel.layer.borderWidth = 1;
    
    self.secretLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    self.secretLabel.layer.borderWidth = 1;
    self.secretLabel.layer.cornerRadius = 7;
    self.secretLabel.layer.masksToBounds = YES;
    
    self.vipLevelLabel.backgroundColor = GOLDCOLOR;
    //  隐藏头像上的加V
    self.vHead.hidden = YES;
}


-(void)showData:(MY_TTLMeModel *)model
{
    [self.headImg sd_setImageWithURL:[NSURL URLWithString:model.headIcon]];
    
//    self.vipLevelLabel.text = [NSString stringWithFormat:@"VIP%@",model.consumptionLevel];
    
    self.vipLevelLabel.text = GetVipLevel(model.consumptionLevel.integerValue);
    if ([model.isAuthen integerValue] == 1) {//-1为尚未申请认证，0为审核中，1为审核通过，2为审核未通过
//        self.vHead.hidden = NO;
        self.addVLabel.hidden = NO;
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:model.certificationName attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[Utility colorWithHexString:@"ffffff" alpha:1.0]}];
        
        NSTextAttachment *textAttachment = [[NSTextAttachment alloc] initWithData:nil ofType:nil] ;
        textAttachment.image = [UIImage imageNamed:@"home_addV"]; //要添加的图片 home_addV
        textAttachment.bounds = CGRectMake(0, -3, 15, 15);
        NSAttributedString *textAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment];
        
        [string insertAttributedString:textAttachmentString atIndex:0];//index
        self.addVLabel.attributedText = string;
    }
    else{
//        self.vHead.hidden = YES;
        self.addVLabel.hidden = YES;
    }
    NSString* strSex;
    if ([model.sex integerValue] == 0) {
        strSex = @"女";
    }
    else{
        strSex = @"男";
    }
    self.infoLabel.text = [NSString stringWithFormat:@"性别:%@    年龄:%@",strSex,model.age];
    if ([model.nobleLevel integerValue] > 0) {
        self.nameLabel.textColor = GOLDCOLOR;
        self.nobeLabel.hidden = NO;
        
    }
    else{
        self.nameLabel.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
        self.nobeLabel.hidden = YES;
    }
    if (![Utility isBlankString:model.nickName]) {
        self.nameLabel.text = model.nickName;
    }
    else{
        self.nameLabel.text = @"暂无昵称";
    }
    CGFloat maxWi = [Utility stringSizeWithString:self.nameLabel.text textSize:18 width:0 height:21].width;
    self.nameMaxWidth.constant = (maxWi < 200 ? maxWi : 200)+5;
    
    if (model.secretStatus.intValue) {
        self.secretLabel.layer.borderColor = GOLDCOLOR.CGColor;
        self.secretLabel.textColor = GOLDCOLOR;
        self.secretLabel.text = @"资料已保密";
    }else{
        self.secretLabel.layer.borderColor = [UIColor whiteColor].CGColor;
        self.secretLabel.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
        self.secretLabel.text = @"资料未保密";
    }
    
    
    UIImage * isVideo = [UIImage imageNamed:@"icon_videoWeiRenzheng"];
    //  0 未认证  1 已认证
    if ([model.isVideoVerify integerValue]) {
        
        isVideo = [UIImage imageNamed:@"icon_videoYiRenzheng"];

    }
    [self.videoBtn setImage:isVideo forState:(UIControlStateNormal)];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
