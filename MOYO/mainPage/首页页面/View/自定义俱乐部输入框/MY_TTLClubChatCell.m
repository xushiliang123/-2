//
//  MY_TTLClubChatCell.m
//  VTIME
//
//  Created by 听听 on 2017/10/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLClubChatCell.h"

CGFloat const CellTopMargin = 10;
@interface MY_TTLClubChatCell()
{
//    UIImage * _placeholderImage;
    CGFloat _nameLblMaxWidth;
    CGFloat _cityMaxWidth;
}

@end

@implementation MY_TTLClubChatCell
@synthesize nameLabel = _nameLabel;
+ (instancetype)cellForTableView:(UITableView *)tableView withModel:(id<IMessageModel>)model{
//    static NSString *cId = @"MY_TTLClubChatCell";
    NSString *CellIdentifier = [EaseMessageCell cellIdentifierWithModel:model];
    MY_TTLClubChatCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MY_TTLClubChatCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier model:model];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(id<IMessageModel>)model{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier model:model];
    if (self) {
        [self setUIWith:model];
    }
    return self;
    
}
+ (void)initialize
{
    // UIAppearance Proxy Defaults
    MY_TTLClubChatCell *cell = [self appearance];
    cell.avatarSize = 45;
    cell.messageNameColor = [UIColor whiteColor];
    cell.messageNameFont = [UIFont boldSystemFontOfSize:14];
    cell.messageNameHeight = 25;
    cell.messageTextFont = [UIFont systemFontOfSize:14];
    cell.messageTextColor = [UIColor whiteColor];
    cell.leftBubbleMargin = UIEdgeInsetsMake(5, 15, 5, 10);
    cell.rightBubbleMargin = UIEdgeInsetsMake(12, 10, 12, 15);
    cell.bubbleMargin = UIEdgeInsetsMake(0, 0, 15, 0);
    
}
- (void)setUIWith:(id<IMessageModel>)model{
    self.backgroundColor = [UIColor clearColor];
    self.avatarSize = 45;
    self.messageNameFont = [UIFont boldSystemFontOfSize:14];
    self.messageNameColor = [UIColor whiteColor];
    self.messageNameHeight = 25;
    self.messageTextFont = [UIFont systemFontOfSize:14];
    self.messageTextColor = [UIColor whiteColor];
    self.leftBubbleMargin = UIEdgeInsetsMake(5, 15, 5, 10);
    self.rightBubbleMargin = UIEdgeInsetsMake(8, 10, 8, 15);
    self.bubbleMargin = UIEdgeInsetsMake(0, 0, 15, 0);
    _cityMaxWidth = 80;
    
   
    self.avatarView.layer.cornerRadius = self.avatarSize/2;
    self.avatarView.layer.masksToBounds = YES;
    
    self.bubbleView.imageView.clipsToBounds = YES;
    self.bubbleView.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.font =self.messageNameFont;
    _nameLabel.textColor = [Utility colorWithHexString:@"878686" alpha:1.0];
    [self.contentView addSubview:_nameLabel];
     [self setNameLablWidth:model];
    
    self.cityLable = [[UILabel alloc]init];
    self.cityLable.textColor =[Utility colorWithHexString:@"878686" alpha:1.0];
    self.cityLable.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.cityLable];
    
    
    
//    self.VipLevelLabel = [[UILabel alloc] init];
//    _VipLevelLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    _VipLevelLabel.layer.cornerRadius = 6;
//    _VipLevelLabel.layer.borderColor = [UIColor blackColor].CGColor;
//    _VipLevelLabel.layer.borderWidth = 0.7;
//    _VipLevelLabel.layer.masksToBounds = YES;
//    _VipLevelLabel.font = [UIFont boldSystemFontOfSize:7.0];
//    _VipLevelLabel.textColor = [UIColor whiteColor];
//    _VipLevelLabel.text = @"SVIP10";
//    _VipLevelLabel.textAlignment = NSTextAlignmentCenter;
//    _VipLevelLabel.backgroundColor = [Utility colorWithHexString:@"#FA4034" alpha:1.0f];
////    _VipLevelLabel.font = [UIFont fontWithName:@"HelveticaNeueCE-BoldItalic" size:5];
////    _VipLevelLabel.textColor = [UIColor colorWithRed:254/255 green:254/255 blue:254/255 alpha:1];
//    [self.contentView addSubview:_VipLevelLabel];
    
    _videoverifyImg = [[UIImageView alloc] init];
    _videoverifyImg.translatesAutoresizingMaskIntoConstraints = NO;
    _videoverifyImg.image = [UIImage imageNamed:@"videoverify"];
    _videoverifyImg.hidden = YES;
    [self.contentView addSubview:_videoverifyImg];
    
    self.bordImageView = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *img = [[UIImage imageNamed:@"imgBottom"] stretchableImageWithLeftCapWidth:35 topCapHeight:35];
    [self.bordImageView setBackgroundImage:img forState:UIControlStateNormal];
    [self.bordImageView addTarget:self action:@selector(bordImageViewClick:) forControlEvents:UIControlEventTouchUpInside];
    self.bordImageView.hidden = YES;
    [self.bubbleView addSubview:self.bordImageView];
    
//    self.lineV = [[UIView alloc]init];
//    self.lineV.backgroundColor  = [Utility colorWithHexString:@"b3b3b3" alpha:1.0];
//    [self.contentView addSubview:self.lineV];
    //    self.dateLable = [[UILabel alloc]init];
    //    self.dateLable.textColor = [Utility colorWithHexString:@"b3b3b3" alpha:1.0];
    //    self.dateLable.font = [UIFont systemFontOfSize:12];
    //    [self.contentView addSubview:self.dateLable];
    
    [self configureLayoutConstraintsWithModel:model];
    if ([UIDevice currentDevice].systemVersion.floatValue == 7.0) {
        self.messageNameHeight = 15;
    }
    self.sendBubbleBackgroundImage = [[UIImage imageNamed:@"bubblesSelf"] stretchableImageWithLeftCapWidth:35 topCapHeight:35];
    self.recvBubbleBackgroundImage = [[UIImage imageNamed:@"bubblesOther"] stretchableImageWithLeftCapWidth:35 topCapHeight:35];
}
- (void)layoutSubviews
{
    [super layoutSubviews];

    _bubbleView.backgroundImageView.image = self.model.isSender ? self.sendBubbleBackgroundImage : self.recvBubbleBackgroundImage;
    self.bordImageView.hidden = YES;
    switch (self.model.bodyType) {
        case EMMessageBodyTypeText:
        {
            
        }
            break;
        case EMMessageBodyTypeImage:
        {
            [self updateIMGAndVideoWidthContain];
             self.bordImageView.hidden = NO;
//            self.bordImageView.frame = CGRectMake((self.bubbleView.mj_w-34)/2, CGRectGetMaxY(self.bubbleView.imageView.frame)-34/2, 34, 34);
        }
            break;
        case EMMessageBodyTypeLocation:
        {
        }
            break;
        case EMMessageBodyTypeVoice:
        {
        }
            break;
        case EMMessageBodyTypeVideo:
        {
            [self updateIMGAndVideoWidthContain];
        }
            break;
        case EMMessageBodyTypeFile:
        {
        }
            break;
        default:
            break;
    }
}

- (void)updateIMGAndVideoWidthContain{
    CGSize retSize = self.model.thumbnailImageSize;
    if (retSize.width == 0 || retSize.height == 0) {
        retSize.width = kEMMessageImageSizeWidth;
        retSize.height = kEMMessageImageSizeHeight;
    }
    else if (retSize.width > retSize.height) {
        CGFloat height =  kEMMessageImageSizeWidth / retSize.width * retSize.height;
        retSize.height = height;
        retSize.width = kEMMessageImageSizeWidth;
    }
    else {
        CGFloat width = kEMMessageImageSizeHeight / retSize.height * retSize.width;
        retSize.width = width;
        retSize.height = kEMMessageImageSizeHeight;
    }
    //            [self removeConstraint:self.bubbleWithImageConstraint];
    CGFloat margin = [EaseMessageCell appearance].leftBubbleMargin.left + [EaseMessageCell appearance].leftBubbleMargin.right;
    [self.bubbleView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(retSize.width + margin);
    }];
    
   
    
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
//    if (model.isSender) {
//        [self configureSendLayoutConstraints];
//    } else {
        [self configureRecvLayoutConstraints];
//    }
    if (model.isSender) {
        [self.statusButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.bubbleView.mas_right).mas_offset(5);
            
        }];
        [self.activity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.bubbleView.mas_right).mas_offset(15);
        }];
        [self.hasRead mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.bubbleView.mas_right).mas_offset(5);
            make.top.mas_equalTo(self.bubbleView.mas_top).mas_offset(0);
        }];
    }
}
/*!
 @method
 @brief 接收方控件约束
 @discussion  当前登录用户为消息接收方时，设置控件约束，在cell的左侧排列显示
 @result
 */
- (void)configureRecvLayoutConstraints
{
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.dateLable.textAlignment = NSTextAlignmentRight;
    self.cityLable.textAlignment = NSTextAlignmentLeft;
    __weak typeof(self) WeakSelf = self;
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(WeakSelf.contentView.mas_left).mas_offset(EaseMessageCellPadding);
        make.top.mas_equalTo(WeakSelf.contentView.mas_top).mas_offset(CellTopMargin);
        make.width.mas_equalTo(WeakSelf.avatarSize);
        make.height.mas_equalTo(WeakSelf.avatarSize);
    }];
    [self.VipLevelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(WeakSelf.avatarView.mas_right).mas_offset(5);
        make.bottom.mas_equalTo(WeakSelf.avatarView.mas_bottom);
        make.width.mas_equalTo(23);
        make.height.mas_equalTo(12);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(WeakSelf.avatarView.mas_right).mas_offset(EaseMessageCellPadding);
        make.top.mas_equalTo(WeakSelf.contentView.mas_top).mas_offset(CellTopMargin);
//        make.right.mas_equalTo(WeakSelf.cityLable.mas_left).mas_offset(-30);
        make.width.mas_equalTo(_nameLblMaxWidth);
        make.height.mas_equalTo(WeakSelf.messageNameHeight);
    }];
   
    [self.videoverifyImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(WeakSelf.nameLabel.mas_right).mas_offset(15);
        make.centerY.mas_equalTo(WeakSelf.nameLabel.mas_centerY);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(15);
    }];
    [self.cityLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(WeakSelf.videoverifyImg.mas_right).mas_offset(15);
        make.centerY.mas_equalTo(WeakSelf.videoverifyImg.mas_centerY);
        make.width.mas_equalTo(_cityMaxWidth);
        make.height.mas_equalTo(25);
    }];
    [self.bubbleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(WeakSelf.avatarView.mas_right).mas_offset(EaseMessageCellPadding / 2);
        make.top.mas_equalTo(WeakSelf.nameLabel.mas_bottom).mas_offset(5);
//        make.width.mas_equalTo(50);
        //            make.right.mas_equalTo(self.dateLable.mas_left).mas_offset(-25);
        //            make.height.mas_equalTo(25);
    }];
    [self.bordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(WeakSelf.bubbleView.mas_centerX);
        make.centerY.mas_equalTo(WeakSelf.bubbleView.mas_bottom);
        make.width.mas_equalTo(34);
        make.height.mas_equalTo(34);
    }];
}

#pragma mark - setter
- (void)setModel:(id<IMessageModel>)model
{
    [super setModel:model];
    NSDictionary * dict = model.message.ext;
    NSString *messageType = model.message.from;
    if ([messageType isEqualToString:VTaskM]) {
        self.cityLable.text =  dict[@"userLocation"];
        self.videoverifyImg.hidden = YES;
        [self.videoverifyImg mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(1);
        }];
    }else{
        self.cityLable.text =   model.address;
        NSNumber * videoverifyNB = dict[@"isVideoVerify"];
        if (videoverifyNB) {
            NSInteger isvideoverify = [videoverifyNB integerValue];
            if (!isvideoverify) {
                self.videoverifyImg.hidden = NO;
                [self.videoverifyImg mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo(60);
                }];
            }else{
                self.videoverifyImg.hidden = YES;
                [self.videoverifyImg mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo(1);
                }];
                
            }
        }else{
            self.videoverifyImg.hidden = YES;
            [self.videoverifyImg mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(1);
            }];
        }
    }
   
//    NSString * avatarURLPath = dict[@"avatarURLPath"];
    
    if (model.avatarURLPath ) {
        __weak typeof(self) WeakSelf = self;
        [self.avatarView sd_setImageWithURL:[NSURL URLWithString:model.avatarURLPath] placeholderImage:model.avatarImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        }];
    } else {
        self.avatarView.image = [UIImage imageNamed:@"8686"];
    }
    
    if (model.bodyType ==EMMessageBodyTypeText && self.textAttribute ) {
        self.bubbleView.textLabel.text = nil;
        self.bubbleView.textLabel.attributedText = self.textAttribute;
    }
    _nameLabel.text = model.nickname;
    if (self.model.isSender) {
        _hasRead.hidden = YES;
        switch (self.model.messageStatus) {
            case EMMessageStatusDelivering:
            {
                _statusButton.hidden = YES;
                [_activity setHidden:NO];
                [_activity startAnimating];
            }
                break;
            case EMMessageStatusSucceed:
            {
                _statusButton.hidden = YES;
                [_activity stopAnimating];
                
//                if (self.model.isMessageRead) {
//                    _hasRead.hidden = NO;
//                    _hasRead.text = @"已读";
//                    _hasRead.backgroundColor = [UIColor colorWithRed:113/255.0 green:208/255.0 blue:20/255.0 alpha:1.0];
//
//                    //                } else if (self.model.isDeliverAcked) {
//                } else {
//                    _hasRead.hidden = NO;
//                    _hasRead.text = @"未读";
//                    _hasRead.backgroundColor = [UIColor colorWithRed:245/255.0 green:166/255.0 blue:35/255.0 alpha:1.0];
//                }
            }
                break;
            case EMMessageStatusPending:
            case EMMessageStatusFailed:
            {
                [_activity stopAnimating];
                [_activity setHidden:YES];
                _statusButton.hidden = NO;
            }
                break;
            default:
                break;
        }
    }
    [self setNameLablWidth:model];
    [self.nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(_nameLblMaxWidth+10);
    }];
    
//        self.VipLevelLabel.hidden = YES;

        //             self.VipLevelLabel.text = [NSString stringWithFormat:@"VIP%@",_model.conversation.ext[@"myVip"]];
    
    if(dict[@"noble"]){
        if ([dict[@"noble"] intValue] == 1) {
            _nameLabel.textColor = GOLDCOLOR;
        }else{
             _nameLabel.textColor = [Utility colorWithHexString:@"878686" alpha:1.0];;
        }
    }else{
        _nameLabel.textColor = [Utility colorWithHexString:@"878686" alpha:1.0];;
    }
    
    if(dict[@"myVip"]){
        self.VipLevelLabel.hidden = NO;
        NSNumber *vipNub = dict[@"myVip"];
        NSString *vipL = GetVipLevel(vipNub.integerValue);
        
        NSMutableString *mstr = [NSMutableString stringWithString:vipL];
       
        NSRange rang =  [mstr rangeOfString:@"IP"];
        [mstr deleteCharactersInRange:rang];
        self.VipLevelLabel.text = mstr;
        CGSize vsize = [Utility stringSizeWithString:mstr textSize:8 width:0 height:12];
        [self.VipLevelLabel mas_updateConstraints:^(MASConstraintMaker *make) {
           make.width.mas_equalTo(vsize.width+5);
        }];
        
    }else{
        self.VipLevelLabel.hidden = YES;
    }

}
- (void)bordImageViewClick:(UIButton*)sender{
    EMFileMessageBody *body =(EMFileMessageBody*)self.model.message.body;
    if (self.bordViewClickBlock) {
        self.bordViewClickBlock(body.remotePath,self.model.message.from);
    }
}
//- (void)setAvatarCornerRadius:(CGFloat)avatarCornerRadius
//{
//    _avatarCornerRadius = avatarCornerRadius;
//    if (self.avatarView){
//        self.avatarView.layer.cornerRadius = avatarCornerRadius;
//    }
//}
- (void)setNameLablWidth:(id<IMessageModel>)model{
    CGFloat maxw = SCREEN_WIDTH-20-self.avatarSize - _cityMaxWidth -15;
    NSAttributedString *text = [[EaseEmotionEscape sharedInstance] attStringFromTextForChatting:model.nickname textFont:self.messageTextFont];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(maxw, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    
    if (rect.size.width > maxw) {
        _nameLblMaxWidth = maxw;
    }else{
        _nameLblMaxWidth = rect.size.width;
    }
}
#pragma mark - public
/*!
 @method
 @brief 获取当前cell的高度
 @discussion
 @result
 */
+ (CGFloat)cellHeightWithModel:(id<IMessageModel>)model
{
    MY_TTLClubChatCell *cell = [self appearance];
    CGFloat minHeight = cell.avatarSize + EaseMessageCellPadding + CellTopMargin;
    CGFloat height =cell.messageNameHeight; ;  // = cell.messageNameHeight;
    if ([UIDevice currentDevice].systemVersion.floatValue == 7.0) {
        height = 15;
    }
    height += EaseMessageCellPadding + [EaseMessageCell cellHeightWithModel:model] +CellTopMargin;
    height = height > minHeight ? height : minHeight;
    return height;
}


@end
