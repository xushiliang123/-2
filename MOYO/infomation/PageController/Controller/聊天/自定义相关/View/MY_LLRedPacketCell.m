//
//  MY_LLRedPacketCell.m
//  VTIME
//
//  Created by Louie on 2017/9/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLRedPacketCell.h"
#import "MY_LYMessageInfoModel.h"
@implementation MY_LLRedPacketCell
{
    UIImage * _placeholderImage;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    
    if (self){
        
        [self setUI];
    }
    return self;
}



- (void)setUI {
    
    self.backgroundColor = [UIColor clearColor];
    _placeholderImage = [UIImage imageNamed:@"占位_头像"];
    UIColor * lineColor = [Utility colorWithHexString:@"e5e5e5" alpha:1.0];
    
    //  头像
    self.headIcon = [[UIImageView alloc] init];
    self.headIcon.image = _placeholderImage;
    self.headIcon.layer.cornerRadius = 43/2;
    self.headIcon.layer.masksToBounds = YES;
    [self.contentView addSubview:self.headIcon];

    
    //  气泡
    self.bubbleImgeV = [[UIImageView alloc] init];
    self.bubbleImgeV.backgroundColor = [UIColor clearColor];
    UIImage * bubbleImage = [UIImage imageNamed:@"EaseUIResource.bundle/chat_receiver_bg"];
    bubbleImage = [bubbleImage stretchableImageWithLeftCapWidth:10 topCapHeight:35];
    self.bubbleImgeV.image = bubbleImage;
    [self.contentView addSubview:self.bubbleImgeV];
    
    //  添加约束
    [self.headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(5);
        make.width.mas_equalTo(43);
        make.height.mas_equalTo(43);
    }];
    
    [self.bubbleImgeV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.headIcon.mas_right).mas_offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(5);
        make.width.mas_equalTo(466 / 2);
        make.height.mas_equalTo(212 / 2);
    }];
    
    UIView * lineView = [[UIView alloc] init];
    lineView.backgroundColor = lineColor;
    [self.bubbleImgeV addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.bubbleImgeV.mas_bottom).mas_offset(-29);
        make.left.equalTo(self.bubbleImgeV.mas_left).mas_offset(15);
        make.right.equalTo(self.bubbleImgeV.mas_right).mas_offset(-10);
        make.height.mas_equalTo(1);
    }];
    
    NSArray * array = @[@"拒绝", @"同意"];
    CGFloat bottomWidth = 466 / 4;

    for (NSInteger i = 0; i < array.count; ++i) {
        
        NSString * title = array[i];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        btn.tag = 1000 + i;
        
        if (i) {
            [btn setTitleColor:[Utility colorWithHexString:@"c6a75b" alpha:1.0] forState:UIControlStateNormal];
        }
        else {
            [btn setTitleColor:COlOR333 forState:UIControlStateNormal];
        }
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(self.bubbleImgeV.mas_bottom);
            make.left.equalTo(self.bubbleImgeV.mas_left).mas_offset(bottomWidth * i);
            make.height.mas_equalTo(29);
            make.width.mas_equalTo(bottomWidth);
        }];
    }
    
    self.messageLabel = [[UILabel alloc] init];
    self.messageLabel.textColor = COlOR333;
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
//        self.messageLabel.adjustsFontSizeToFitWidth = YES;
    
//    self.messageLabel. = UIEdgeInsetsMake(4, 10, 0, 4);
    
    self.messageLabel.font = [UIFont systemFontOfSize:13];
    self.messageLabel.numberOfLines = 0;
    self.messageLabel.minimumScaleFactor = 2.0;
    [self addSubview:self.messageLabel];
    
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.bubbleImgeV.mas_top).mas_offset(4);
        make.left.equalTo(self.bubbleImgeV.mas_left).mas_offset(10);
        
        make.right.equalTo(self.bubbleImgeV.mas_right).mas_offset(-6);
        
//        make.width.equalTo(self.bubbleImgeV.mas_width);
        make.bottom.equalTo(lineView.mas_top);
        
    }];
    //  5 + 4 + 13 + 文字高度 + 13 + 29
    
    UIView * lView = [[UIView alloc] init];
    lView.backgroundColor = lineColor;
    [self.bubbleImgeV addSubview:lView];
    
    [lView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(lineView.mas_bottom).mas_offset(3);
        make.bottom.equalTo(self.bubbleImgeV.mas_bottom).mas_offset(-3);
        make.centerX.equalTo(lineView.mas_centerX).mas_offset(2.5);
        make.width.mas_equalTo(1);
    }];
}


- (void)setMessageData:(id<IMessageModel>)model withUserId:(NSString *)userId {
    
    NSDictionary *ext = model.message.ext;
    NSString *typeStr = ext[@"typeMsg"];
    
    NSData *jsonData = [typeStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *typeMsg = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    NSString * messageText = model.text;
    if ([typeMsg isKindOfClass:[NSDictionary class]]) {
        NSString * msg1 = typeMsg[@"msg1"];
        NSString * msg2 = typeMsg[@"msg2"];
        messageText = [NSString stringWithFormat:@"%@%@", msg1, msg2];//\n
    }

//    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
//    paraStyle.alignment = NSTextAlignmentCenter;
//    paraStyle.lineSpacing = 8; //设置行间距
//    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:13], NSParagraphStyleAttributeName:paraStyle};
//
//    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:messageText attributes:dic];
//
//    [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, messageText.length)];
//
//    [attributeStr addAttribute:NSForegroundColorAttributeName value:COlOR999 range:NSMakeRange(0, messageText.length)];
    
//    self.messageLabel.attributedText = attributeStr;
    
    self.messageLabel.text = messageText;
    
    
    
//    NSString * where = [NSString stringWithFormat:@"userId = %@", userId];
//    [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//
//        NSString * headIconStr = nil;
//
//        if (!dataArray.count) {
//            for (BaseModel * pModel in dataArray) {
//
//                if ([pModel isKindOfClass:[MY_LLPersonInfoModel class]]) {
//                    MY_LLPersonInfoModel * userModel = (MY_LLPersonInfoModel *)pModel;
//                    if (userModel.userId == [userId integerValue]) {
//
//                        headIconStr = userModel.headIcon;
//                    }
//                }
//            }
//        }
//        if (!headIconStr) {
//            headIconStr = ext[@"avatarURLPath"];
//        }
//
//        [self.headIcon sd_setImageWithURL:[NSURL URLWithString:headIconStr] placeholderImage:_placeholderImage options:SDWebImageAllowInvalidSSLCertificates];
//    }];
    NSString * headIconStr = nil;
//    MY_LLPersonInfoModel *userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:userId.integerValue];
//    if (userModel) {
//        headIconStr = userModel.headIcon;
//    }else{
         headIconStr = ext[@"avatarURLPath"];
//    }
     [self.headIcon sd_setImageWithURL:[NSURL URLWithString:headIconStr] placeholderImage:_placeholderImage options:SDWebImageAllowInvalidSSLCertificates];
}


- (void)btnClick:(UIButton *)btn {
    
    if (self.btnClickBlock) {
        
        self.btnClickBlock(btn.tag - 1000);
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
