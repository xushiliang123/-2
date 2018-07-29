//
//  MY_LLchatViewHoneBaoCell.m
//  VTIME
//
//  Created by 听听 on 2017/11/16.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLchatViewHoneBaoCell.h"
#import "EaseBubbleView+Text.h"
#import "EaseBubbleView+Image.h"
#import "UIImageView+WebCache.h"
#import "EaseEmotionEscape.h"
#import "EaseLocalDefine.h"

@interface MY_LLchatViewHoneBaoCell ()
{
    CGFloat _bubbleViewHeight;
}
@end

@implementation MY_LLchatViewHoneBaoCell


+ (instancetype)cellForTableView:(UITableView *)tableView withModel:(id<IMessageModel>)model{
    NSDictionary * dict = model.message.ext;
    NSString * typeStr = [NSString stringWithFormat:@"%@", dict[@"type"]];
    static NSString *cId;
    if (model.isSender) {
        cId = @"MY_LLchatViewHoneBaoCellSend";
    } else {
        cId = @"MY_LLchatViewHoneBaoCellReceive";
    }
   
    MY_LLchatViewHoneBaoCell *cell = [tableView dequeueReusableCellWithIdentifier:cId];
    if (cell == nil) {
        cell = [[MY_LLchatViewHoneBaoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cId model:model];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(id<IMessageModel>)model{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUIWith:model];
    }
    return self;
    
}

- (void)setUIWith:(id<IMessageModel>)model{
    self.activitySize = 20;

    _avatarView = [[UIImageView alloc] init];
    _avatarView.translatesAutoresizingMaskIntoConstraints = NO;
    _avatarView.backgroundColor = [UIColor clearColor];
    _avatarView.clipsToBounds = YES;
    _avatarView.userInteractionEnabled = YES;
    [self.contentView addSubview:_avatarView];
    
    
    self.backgroundColor = [UIColor clearColor];
    self.avatarSize = 45;
    self.avatarView.layer.cornerRadius = self.avatarSize/2;
    self.avatarView.layer.masksToBounds = YES;
//    self.hongBaoHeight = 70;
    
    
    
    self.hongbaoView = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.hongbaoView.backgroundColor = [UIColor yellowColor];
    [self.hongbaoView addTarget:self action:@selector(hongBaoButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    //138 102
    [self.contentView addSubview:self.hongbaoView];
    
    self.priceLabel = [[UILabel alloc] init];
    self.priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.priceLabel.textAlignment = NSTextAlignmentLeft;
    self.priceLabel.backgroundColor = [UIColor clearColor];
    self.priceLabel.font =[UIFont boldSystemFontOfSize:20];
    self.priceLabel.textColor = [Utility colorWithHexString:@"#FCEE7B" alpha:1.0];
    [self.contentView addSubview:self.priceLabel];

    [self configureLayoutConstraintsWithModel:model];
    UITapGestureRecognizer *tapRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(avatarViewTapAction:)];
    [_avatarView addGestureRecognizer:tapRecognizer2];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
//    _bubbleView.backgroundImageView.image = self.model.isSender ? self.sendBubbleBackgroundImage : self.recvBubbleBackgroundImage;
}
/*!
 @method
 @brief 根据传入的消息对象，设置头像、昵称、气泡的约束
 @discussion
 @param model   消息对象
 @result
 */
- (void)configureLayoutConstraintsWithModel:(id<IMessageModel>)model
{
    NSDictionary * dict = model.message.ext;
    NSString * typeStr = [NSString stringWithFormat:@"%@", dict[@"type"]];
    
    if (model.isSender) {
        [self configureSendLayoutConstraints];
    }else{
        [self configureRecvLayoutConstraints];
    }
    
    
//    if ([typeStr isEqualToString:@"send_little_hongbao_success"] || [typeStr isEqualToString:@"sendHongbaoSuccess"]) {
//        [self configureSendLayoutConstraints];
//    } else {
//        [self configureRecvLayoutConstraints];
//    }
}
- (void)configureSendLayoutConstraints{
    __weak typeof(self)WeakSelf = self;
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(WeakSelf.contentView.mas_right).mas_offset(-EaseMessageCellPadding);
        make.top.mas_equalTo(WeakSelf.contentView.mas_top);
        make.width.mas_equalTo(WeakSelf.avatarSize);
        make.height.mas_equalTo(WeakSelf.avatarSize);
    }];
    [self.hongbaoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(WeakSelf.avatarView.mas_left).mas_offset(-(EaseMessageCellPadding / 2));
        make.top.mas_equalTo(WeakSelf.contentView.mas_top);
        make.bottom.mas_equalTo(WeakSelf.contentView.mas_bottom).mas_offset(-10);
        make.width.mas_equalTo(180);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(WeakSelf.hongbaoView.mas_right).mas_offset(35);
        make.top.mas_equalTo(WeakSelf.hongbaoView.mas_top).mas_offset(12);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(90);
    }];
}
/*!
 @method
 @brief 接收方控件约束
 @discussion  当前登录用户为消息接收方时，设置控件约束，在cell的左侧排列显示
 @result
 */
- (void)configureRecvLayoutConstraints
{
    __weak typeof(self)WeakSelf = self;
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(WeakSelf.contentView.mas_left).mas_offset(EaseMessageCellPadding);
        make.top.mas_equalTo(WeakSelf.contentView.mas_top);
        make.width.mas_equalTo(WeakSelf.avatarSize);
        make.height.mas_equalTo(WeakSelf.avatarSize);
    }];
   
    [self.hongbaoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(WeakSelf.avatarView.mas_right).mas_offset(EaseMessageCellPadding / 2);
        make.top.mas_equalTo(WeakSelf.contentView.mas_top);
        make.bottom.mas_equalTo(WeakSelf.contentView.mas_bottom).mas_offset(-10);
        make.width.mas_equalTo(180);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(WeakSelf.hongbaoView.mas_left).mas_offset(35);
        make.top.mas_equalTo(WeakSelf.hongbaoView.mas_top).mas_offset(12);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(90);
    }];

}
#pragma mark - setter

- (void)setModel:(id<IMessageModel>)model
{
    _model = model;
    //    self.modelDic = model.message.ext;
    NSDictionary * dict = model.message.ext;
 
    NSString * typeStr = [NSString stringWithFormat:@"%@", dict[@"type"]];
    NSNumber *typNub = dict[@"lqType"];
    self.priceLabel.hidden = YES;
    
    if (model.isSender) {
        if ([typeStr isEqualToString:@"send_little_hongbao"]) {
            [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"sRedSend"] forState:UIControlStateNormal];
        }else{
            [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"zhaohuRedHB"] forState:UIControlStateNormal];
        }
    }else{
//        NSData * data = [dict[@"typeMsg"] dataUsingEncoding:(NSUTF8StringEncoding)];
//        NSDictionary * dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
        NSNumber *money = dict[@"totalMoney"];
        if (typNub.intValue == 1) { //红包已点
            
            if ([typeStr isEqualToString:@"sendHongbao"]) {
                [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"zhaohuRedHBRead"] forState:UIControlStateNormal];
            }else{
                [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"sRedHasRead"] forState:UIControlStateNormal];
                self.priceLabel.hidden = NO;
                self.priceLabel.text = [NSString stringWithFormat:@"%@",money];
            }
        }else{//红包未点
            if ([typeStr isEqualToString:@"sendHongbao"]) {
                [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"zhaohuRedNoRD"] forState:UIControlStateNormal];
            }else{
                [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"sRedNoRead"] forState:UIControlStateNormal];
            }
        }
    }
    
//    if ([typeStr isEqualToString:@"send_little_hongbao_success"] || [typeStr isEqualToString:@"sendHongbaoSuccess"]) { //|| [typeStr isEqualToString:@"sendHongbao"]
//        if ([typeStr isEqualToString:@"send_little_hongbao_success"]) {
//            [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"sRedSend"] forState:UIControlStateNormal];
//        }else{
//            [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"zhaohuRedHB"] forState:UIControlStateNormal];
//        }
//
//    }else{
//        NSData * data = [dict[@"typeMsg"] dataUsingEncoding:(NSUTF8StringEncoding)];
//        NSDictionary * dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
//        NSNumber *money = dataDict[@"totalMoney"];
//        if (typNub.intValue == 1) { //红包已点
//
//            if ([typeStr isEqualToString:@"sendHongbao"]) {
//                [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"zhaohuRedHBRead"] forState:UIControlStateNormal];
//            }else{
//                [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"sRedHasRead"] forState:UIControlStateNormal];
//                self.priceLabel.hidden = NO;
//                self.priceLabel.text = [NSString stringWithFormat:@"%@",money];
//            }
//        }else{//红包未点
//            if ([typeStr isEqualToString:@"sendHongbao"]) {
//                [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"zhaohuRedNoRD"] forState:UIControlStateNormal];
//            }else{
//                [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"sRedNoRead"] forState:UIControlStateNormal];
//            }
//        }
//
//    }
//    NSString * avatarURLPath = dict[@"avatarURLPath"];
    if (model.avatarURLPath) {
//        __weak typeof(self) WeakSelf = self;
        [self.avatarView sd_setImageWithURL:[NSURL URLWithString:model.avatarURLPath] placeholderImage:model.avatarImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            //            WeakSelf.avatarView.image = [Utility circleImage:WeakSelf.avatarView.image  borderWidth:0.5 borderColor:[UIColor whiteColor]];
        }];
    } else {
        self.avatarView.image =  [UIImage imageNamed:@"8686"];
    }
    
}
- (void)setAvatarCornerRadius:(CGFloat)avatarCornerRadius
{
    _avatarCornerRadius = avatarCornerRadius;
    if (self.avatarView){
        self.avatarView.layer.cornerRadius = avatarCornerRadius;
    }
}
/*!
 @method
 @brief 头像的点击事件
 @discussion
 @result
 */
- (void)avatarViewTapAction:(UITapGestureRecognizer *)tapRecognizer
{
    
    if ([_delegate respondsToSelector:@selector(avatarViewSelcted:)]) {
        [_delegate avatarViewSelcted:_model];
    }
}

/*!
 @method
 @brief 发送失败按钮的点击事件，进行消息重发
 @discussion
 @result
 */
- (void)statusAction
{
    if ([_delegate respondsToSelector:@selector(statusButtonSelcted:withMessageCell:)]) {
        [_delegate statusButtonSelcted:_model withMessageCell:self];
    }
}
- (void)hongBaoButtonClick:(UIButton*)sender{
    
    NSDictionary * dict = self.model.message.ext;

    NSString * typeStr = [NSString stringWithFormat:@"%@", dict[@"type"]];

    if (_model.isSender) return;
    
    if ([_delegate respondsToSelector:@selector(hongBaoButtonSelected:)]) {
        [_delegate hongBaoButtonSelected:self.model];
    }
}

- (void)setSendBubbleBackgroundImage:(UIImage *)sendBubbleBackgroundImage
{
    _sendBubbleBackgroundImage = sendBubbleBackgroundImage;
}

- (void)setRecvBubbleBackgroundImage:(UIImage *)recvBubbleBackgroundImage
{
    _recvBubbleBackgroundImage = recvBubbleBackgroundImage;
}


- (void)setRightBubbleMargin:(UIEdgeInsets)rightBubbleMargin
{
    _rightBubbleMargin = rightBubbleMargin;
}

- (void)setLeftBubbleMargin:(UIEdgeInsets)leftBubbleMargin
{
    _leftBubbleMargin = leftBubbleMargin;
}

- (void)setBubbleMargin:(UIEdgeInsets)bubbleMargin
{
    _bubbleMargin = bubbleMargin;
    _bubbleMargin = _leftBubbleMargin;
    [_bubbleView updateTextMargin:_bubbleMargin];
    
}



@end
