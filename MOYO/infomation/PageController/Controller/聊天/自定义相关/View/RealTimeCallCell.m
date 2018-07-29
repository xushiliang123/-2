//
//  RealTimeCallCell.m
//  TogetherLu
//
//  Created by Louie on 2017/6/7.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "RealTimeCallCell.h"

@implementation RealTimeCallCell
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


- (void)setUI{
    
    self.backgroundColor = [UIColor clearColor];
    _placeholderImage = [UIImage imageNamed:@"占位_头像"];
    
//  头像
    self.headIcon = [[UIImageView alloc] init];
    self.headIcon.image = _placeholderImage;
    self.headIcon.layer.cornerRadius = 43/2;
    self.headIcon.layer.masksToBounds = YES;
    [self.contentView addSubview:self.headIcon];
    
//    [self.headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
//        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(5);
//        make.width.mas_equalTo(43);
//        make.height.mas_equalTo(43);
//    }];
    
//  气泡
    self.bubbleImageView = [[UIImageView alloc] init];
    self.bubbleImageView.backgroundColor = [UIColor clearColor];
    UIImage * bubbleImage = [UIImage imageNamed:@"chat_sender_bg1"];
    bubbleImage = [bubbleImage stretchableImageWithLeftCapWidth:5 topCapHeight:35];
    self.bubbleImageView.image = bubbleImage;
    [self.contentView addSubview:self.bubbleImageView];
    
//    [self.bubbleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.right.mas_equalTo(self.headIcon.mas_left).mas_offset(-10);
//        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(5);
//        make.width.mas_equalTo(150);
//        make.height.mas_equalTo(43);
//    }];
    
//  类型文字
    self.typeImageView = [[UIImageView alloc] init];
    self.typeImageView.image = [UIImage imageNamed:@"EaseUIResource.bundle/myVoice"];
    [self.contentView addSubview:self.typeImageView];
    
//    [self.typeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.right.mas_equalTo(self.bubbleImageView.mas_right).mas_offset(-15);
//        make.centerY.mas_equalTo(self.bubbleImageView.mas_centerY);
//        make.width.mas_equalTo(24);
//        make.height.mas_equalTo(15);
//    }];
    
//  内容
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.textColor = [UIColor whiteColor];
    self.contentLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.contentLabel];
    
//    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.right.mas_equalTo(self.typeImageView.mas_left).mas_offset(-10);
//        make.top.mas_equalTo(self.typeImageView.mas_top);
//        make.bottom.mas_equalTo(self.typeImageView.mas_bottom);
//        make.width.mas_equalTo(120);
//    }];
}


- (void)setModel:(id<IMessageModel>)model
{
    _model = model;
    
    [self.headIcon sd_setImageWithURL:[NSURL URLWithString:model.avatarURLPath] placeholderImage:_placeholderImage options:SDWebImageAllowInvalidSSLCertificates];
    
    NSDictionary * ext = model.message.ext;
    
    CGFloat width = [Utility stringSizeWithString:model.text textSize:15 width:0 height:15].width + 2;
    [self.bubbleImageView removeConstraints:self.bubbleImageView.constraints];
    [self.contentLabel removeConstraints:self.contentLabel.constraints];
    if (model.isSender) {
        
        if ([ext[@"callType"] integerValue] == EMCallTypeVoice) {
            self.typeImageView.image = [UIImage imageNamed:@"EaseUIResource.bundle/myVoice"];
        }
        else {
            self.typeImageView.image = [UIImage imageNamed:@"EaseUIResource.bundle/myVideo"];
        }
        self.contentLabel.text = [self setSenderContentLabelWith:model.text width:width];
    }
    else {
        
        if ([ext[@"callType"] integerValue] == EMCallTypeVoice) {
            self.typeImageView.image = [UIImage imageNamed:@"EaseUIResource.bundle/myVideo"];
        }
        else {
            self.typeImageView.image = [UIImage imageNamed:@"EaseUIResource.bundle/myVideo"];
        }
        self.contentLabel.text = [self setReceiverContentLabelWith:model.text width:width];
    }
}


- (NSString *)setSenderContentLabelWith:(NSString *)content width:(CGFloat)width {
    
    UIImage * bubbleImage = [UIImage imageNamed:@"chat_sender_bg1"];
    bubbleImage = [bubbleImage stretchableImageWithLeftCapWidth:5 topCapHeight:35];
    self.bubbleImageView.image = bubbleImage;
    
    self.contentLabel.textColor = [UIColor whiteColor];
    
//    [self.headIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
//        
//    }];
//    [self.bubbleImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        
//    }];
//    [self.typeImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        
//    }];
//    [self.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//        
//    }];
    
//  添加约束
    [self.headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-10);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(5);
        make.width.mas_equalTo(43);
        make.height.mas_equalTo(43);
    }];
    
    [self.bubbleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.headIcon.mas_left).mas_offset(-10);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(5);
        make.width.mas_equalTo(width + 60);
        make.height.mas_equalTo(43);

    }];
    
    [self.typeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.bubbleImageView.mas_right).mas_offset(-15);
        make.centerY.mas_equalTo(self.bubbleImageView.mas_centerY);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(15);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.typeImageView.mas_left).mas_offset(-10);
        make.top.mas_equalTo(self.typeImageView.mas_top);
        make.bottom.mas_equalTo(self.typeImageView.mas_bottom);
        make.width.mas_equalTo(width);
    }];

    return content;
}


- (NSString *)setReceiverContentLabelWith:(NSString *)content width:(CGFloat)width {
    
    UIImage * bubbleImage = [UIImage imageNamed:@"EaseUIResource.bundle/chat_receiver_bg"];
    bubbleImage = [bubbleImage stretchableImageWithLeftCapWidth:35 topCapHeight:5];
    self.bubbleImageView.image = bubbleImage;
    
    self.contentLabel.textColor = [Utility colorWithHexString:@"#333333" alpha:1.0];
    
    [self.headIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [self.bubbleImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [self.typeImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [self.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        
    }];

//  添加约束
    [self.headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(5);
        make.width.mas_equalTo(43);
        make.height.mas_equalTo(43);
    }];
    
    [self.bubbleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.headIcon.mas_right).mas_offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(5);
        make.width.mas_equalTo(width + 60);
        make.height.mas_equalTo(43);
        
    }];
    
    [self.typeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.bubbleImageView.mas_left).mas_offset(15);
        make.centerY.mas_equalTo(self.bubbleImageView.mas_centerY);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(15);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.typeImageView.mas_right).mas_offset(10);
        make.top.mas_equalTo(self.typeImageView.mas_top);
        make.bottom.mas_equalTo(self.typeImageView.mas_bottom);
        make.width.mas_equalTo(width);
    }];
    
    return content;
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
