//
//  RealTimeCallTableViewCell.m
//  TogetherLu
//
//  Created by Louie on 2017/5/15.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "RealTimeCallTableViewCell.h"
#import "RealTimeCallModel.h"

@implementation RealTimeCallTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(id<IMessageModel>)model
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier model:model];
    
    if (self) {
        self.hasRead.hidden = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

- (BOOL)isCustomBubbleView:(id<IMessageModel>)model
{
    return YES;
}

- (void)setCustomModel:(id<IMessageModel>)model
{
    UIImage *image = model.image;
    if (!image) {
        [self.bubbleView.imageView sd_setImageWithURL:[NSURL URLWithString:model.fileURLPath] placeholderImage:[UIImage imageNamed:model.failImageName]];
    } else {
        _bubbleView.imageView.image = image;
    }
    
    if (model.avatarURLPath) {
        [self.avatarView sd_setImageWithURL:[NSURL URLWithString:model.avatarURLPath] placeholderImage:model.avatarImage];
    } else {
        self.avatarView.image = model.avatarImage;
    }
}

- (void)setCustomBubbleView:(id<IMessageModel>)model
{
    _bubbleView.imageView.image = [UIImage imageNamed:@"imageDownloadFail"];
}

- (void)updateCustomBubbleViewMargin:(UIEdgeInsets)bubbleMargin model:(id<IMessageModel>)model
{
    _bubbleView.translatesAutoresizingMaskIntoConstraints = YES;
    
    RealTimeCallModel * messageModel = [[RealTimeCallModel alloc] init];
    
    [messageModel setValuesForKeysWithDictionary:model.message.ext];
  
    _bubbleView.frame = CGRectMake(55, 2, 213, 43);
}


+ (NSString *)cellIdentifierWithModel:(id<IMessageModel>)model
{
    RealTimeCallModel * messageModel = [[RealTimeCallModel alloc] init];
    
    [messageModel setValuesForKeysWithDictionary:model.message.ext];
    
//    if (messageModel.redpacketType == RedpacketTypeAmount) {
//        return model.isSender ? @"__redPacketLuckCellSendIdentifier__" : @"__redPacketLuckCellReceiveIdentifier__";
//    }else {
        return model.isSender ? @"__callSendIdentifier__" : @"__callReceiveIdentifier__";
//    }
}

+ (CGFloat)cellHeightWithModel:(id<IMessageModel>)model
{
    RealTimeCallModel * messageModel = [[RealTimeCallModel alloc] init];
    
    [messageModel setValuesForKeysWithDictionary:model.message.ext];
    EaseBaseMessageCell *cell = [self appearance];
    
    //    CGFloat minHeight = cell.avatarSize + EaseMessageCellPadding + 5;
    CGFloat minHeight = cell.avatarSize + 12;
    
    CGFloat height;  // = cell.messageNameHeight;
    if ([UIDevice currentDevice].systemVersion.floatValue == 7.0) {
        height = 15;
    }
    //    height += - EaseMessageCellPadding + [EaseMessageCell cellHeightWithModel:model];
    height =  [EaseMessageCell cellHeightWithModel:model] + 12;
    height = height > minHeight ? height : minHeight;
    
    return height;
}

- (void)setModel:(id<IMessageModel>)model
{
    [super setModel:model];
    RealTimeCallModel * messageModel = [[RealTimeCallModel alloc] init];
    
    [messageModel setValuesForKeysWithDictionary:model.message.ext];
    
    
    if ([messageModel.realTimeCall isEqualToString:@"YES"]) {

        _bubbleView.textLabel.attributedText = [self addRealTimeCallMeassageWithMessage:model.text ext:model.message.ext];
        _bubbleView.textLabel.textColor = [UIColor whiteColor];

    }

    /** 实时通话记录不显示已读 */
    _hasRead.hidden = YES;
    /** 不显示姓名 */
    _nameLabel = nil;
}

//  显示实时通话结束插入的消息
- (NSMutableAttributedString *)addRealTimeCallMeassageWithMessage:(NSString *)message ext:(NSDictionary *)ext{
    
    NSMutableAttributedString * mAttribut = [[NSMutableAttributedString alloc] init];
    
    //    NSMutableString * mStr = message;
    //    [mStr deleteCharactersInRange:NSMakeRange(message.length - 5, 4)];
    
    NSAttributedString * msgAtt = [[NSAttributedString alloc] initWithString:message];
    NSAttributedString * spacingAtt = [[NSAttributedString alloc] initWithString:@"  "];
    
    EMTextAttachment * textAttachment = [[EMTextAttachment alloc] initWithData:nil ofType:nil];
    NSAttributedString * imageAtt = nil;
    
    
    if (![ext[@"isCaller"] boolValue]) { //  主叫
        
        if ([ext[@"callType"] integerValue]) { //  视频
            textAttachment.image = [UIImage imageNamed:@"EaseUIResource.bundle/oppositeVideo"];
            textAttachment.bounds = CGRectMake(0, 0, 46, 15);
        } else { //  语音
            textAttachment.image = [UIImage imageNamed:@"EaseUIResource.bundle/oppsiteVoice"];
            textAttachment.bounds = CGRectMake(0, 5, 48, 10);
        }
    }
    else { //  被叫
        
        if ([ext[@"callType"] boolValue]) { //  视频
            textAttachment.image = [UIImage imageNamed:@"EaseUIResource.bundle/myVideo"];
            textAttachment.bounds = CGRectMake(0, 0, 23, 15);
        } else { //  语音
            textAttachment.image = [UIImage imageNamed:@"EaseUIResource.bundle/myVoice"];
            textAttachment.bounds = CGRectMake(0, 5, 24, 10);
        }
    }
    
    imageAtt = [NSAttributedString attributedStringWithAttachment:textAttachment];
    
    if (![ext[@"isCaller"] boolValue]) { //  主叫
        
        [mAttribut appendAttributedString:msgAtt];
        [mAttribut appendAttributedString:spacingAtt];
        [mAttribut appendAttributedString:imageAtt];
        
    }
    else { //  被叫
        
        [mAttribut appendAttributedString:spacingAtt];
        [mAttribut appendAttributedString:imageAtt];
        [mAttribut appendAttributedString:spacingAtt];
    }
    [mAttribut addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, mAttribut.length)];
    [mAttribut addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0,mAttribut.length)];
    
    //  计算富文本size
    CGSize size = [mAttribut boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 15) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    
    return mAttribut;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
