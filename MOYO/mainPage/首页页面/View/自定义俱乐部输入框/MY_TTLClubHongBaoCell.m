//
//  MY_TTLClubHongBaoCell.m
//  VTIME
//
//  Created by 听听 on 2017/10/20.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLClubHongBaoCell.h"
#import "LXDTextView.h"
#import "EaseBubbleView+Text.h"
#import "EaseBubbleView+Image.h"
#import "UIImageView+WebCache.h"
#import "EaseEmotionEscape.h"
#import "EaseLocalDefine.h"
CGFloat const HongBaoCellTopMargin = 10;
@interface MY_TTLClubHongBaoCell()<LXDTextViewDelegate>
{
    CGFloat _nameLblMaxWidth;
    CGFloat _cityMaxWidth;
    CGFloat _bubbleViewHeight;
}
@end
@implementation MY_TTLClubHongBaoCell
@synthesize nameLabel = _nameLabel;
+ (instancetype)cellForTableView:(UITableView *)tableView withModel:(id<IMessageModel>)model{
    static NSString *cId = @"MY_TTLClubChatHongBaoCell";
//    NSString *CellIdentifier = [EaseMessageCell cellIdentifierWithModel:model];
    
    MY_TTLClubHongBaoCell *cell = [tableView dequeueReusableCellWithIdentifier:cId];
    if (cell == nil) {
        cell = [[MY_TTLClubHongBaoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cId model:model];
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
+ (void)initialize
{
    // UIAppearance Proxy Defaults
    MY_TTLClubHongBaoCell *cell = [self appearance];
    cell.statusSize = 20;
    cell.activitySize = 20;
    cell.bubbleMaxWidth = 200;
    cell.leftBubbleMargin = UIEdgeInsetsMake(8, 15, 8, 10);
    cell.rightBubbleMargin = UIEdgeInsetsMake(12, 10, 12, 15);
    cell.bubbleMargin = UIEdgeInsetsMake(0, 0, 15, 0);
    
    cell.avatarSize = 45;
    cell.messageNameColor = [UIColor whiteColor];
    cell.messageNameFont = [UIFont boldSystemFontOfSize:14];
    cell.messageNameHeight = 25;
    cell.messageTextFont = [UIFont systemFontOfSize:14];
//    cell.messageTextColor = [UIColor whiteColor];
    cell.hongBaoHeight = 70;
    cell.bottomLableHeight = 0.5;
}
- (void)setUIWith:(id<IMessageModel>)model{
    self.activitySize = 20;
    self.bubbleMaxWidth = 200;
    self.leftBubbleMargin = UIEdgeInsetsMake(8, 15, 8, 10);
    self.rightBubbleMargin = UIEdgeInsetsMake(8, 10, 8, 15);
    self.bubbleMargin = UIEdgeInsetsMake(0, 0, 15, 0);
    _cityMaxWidth = 80;
    _statusButton = [[UIButton alloc] init];
    _statusButton.accessibilityIdentifier = @"status";
    _statusButton.translatesAutoresizingMaskIntoConstraints = NO;
    _statusButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [_statusButton setImage:[UIImage imageNamed:@"EaseUIResource.bundle/messageSendFail"] forState:UIControlStateNormal];
    [_statusButton addTarget:self action:@selector(statusAction) forControlEvents:UIControlEventTouchUpInside];
    _statusButton.hidden = YES;
    [self.contentView addSubview:_statusButton];
    
    _bubbleView = [[EaseBubbleView alloc] initWithMargin:_leftBubbleMargin isSender:NO];
    _bubbleView.translatesAutoresizingMaskIntoConstraints = NO;
    _bubbleView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_bubbleView];
    
    _avatarView = [[UIImageView alloc] init];
    _avatarView.translatesAutoresizingMaskIntoConstraints = NO;
    _avatarView.backgroundColor = [UIColor clearColor];
    _avatarView.clipsToBounds = YES;
    _avatarView.userInteractionEnabled = YES;
    [self.contentView addSubview:_avatarView];
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(LongPoint:)];
    lpgr.minimumPressDuration = 0.5;
    [_avatarView addGestureRecognizer:lpgr];
    
    _hasRead = [[UILabel alloc] init];
    _hasRead.accessibilityIdentifier = @"has_read";
    _hasRead.translatesAutoresizingMaskIntoConstraints = NO;
    _hasRead.text = NSEaseLocalizedString(@"hasRead", @"Read");
    _hasRead.textAlignment = NSTextAlignmentCenter;
    _hasRead.textColor = [UIColor whiteColor];
    _hasRead.font = [UIFont systemFontOfSize:9];
    _hasRead.backgroundColor = [UIColor colorWithRed:245/255.0 green:166/255.0 blue:35/255.0 alpha:1.0];
    _hasRead.layer.cornerRadius = 3.0;
    _hasRead.layer.masksToBounds = YES;
    _hasRead.hidden = YES;
    [_hasRead sizeToFit];
    [self.contentView addSubview:_hasRead];
    
    _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activity.accessibilityIdentifier = @"sending";
    _activity.translatesAutoresizingMaskIntoConstraints = NO;
    _activity.backgroundColor = [UIColor clearColor];
    _activity.hidden = YES;
    [self.contentView addSubview:_activity];
    
//    [_bubbleView setupTextBubbleView];
    [_bubbleView setupTextBubbleView];
    
//    _bubbleView.textLabel.font = _messageTextFont;
//    _bubbleView.textLabel.textColor = _messageTextColor;
    _bubbleView.textLabel.font = [UIFont systemFontOfSize:14];
    _bubbleView.textLabel.textColor = [Utility colorWithHexString:@"d9b878" alpha:1.0];


    self.backgroundColor = [UIColor clearColor];
    self.avatarSize = 45;
    self.avatarView.layer.cornerRadius = self.avatarSize/2;
    self.avatarView.layer.masksToBounds = YES;
    self.messageNameFont = [UIFont boldSystemFontOfSize:14];
    self.messageNameHeight = 25;
    self.hongBaoHeight = 70;
    self.bottomLableHeight = 0.5;
    self.messageTextFont = [UIFont systemFontOfSize:14];
    
    self.VipLevelLabel = [[UILabel alloc] init];
    _VipLevelLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _VipLevelLabel.layer.cornerRadius = 6;
    _VipLevelLabel.layer.borderColor = [UIColor blackColor].CGColor;
    _VipLevelLabel.layer.borderWidth = 0.7;
    _VipLevelLabel.layer.masksToBounds = YES;
    _VipLevelLabel.font = [UIFont boldSystemFontOfSize:7.0];
    _VipLevelLabel.textColor = [UIColor whiteColor];
//    _VipLevelLabel.textColor = [UIColor colorWithRed:254/255 green:254/255 blue:254/255 alpha:1];
    _VipLevelLabel.text = @"SVIP10";
    _VipLevelLabel.textAlignment = NSTextAlignmentCenter;
    _VipLevelLabel.backgroundColor = [Utility colorWithHexString:@"#FA4034" alpha:1.0f];
    [self.contentView addSubview:_VipLevelLabel];

    
    _videoverifyImg = [[UIImageView alloc] init];
    _videoverifyImg.translatesAutoresizingMaskIntoConstraints = NO;
    _videoverifyImg.image = [UIImage imageNamed:@"videoverify"];
    _videoverifyImg.hidden = YES;
    [self.contentView addSubview:_videoverifyImg];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.font =[UIFont boldSystemFontOfSize:14];
    _nameLabel.textColor = [Utility colorWithHexString:@"878686" alpha:1.0];
    [self.contentView addSubview:_nameLabel];
    [self setNameLablWidth:model];
    self.cityLable = [[UILabel alloc]init];
    self.cityLable.textColor =[Utility colorWithHexString:@"878686" alpha:1.0];
    self.cityLable.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.cityLable];
    
    LXDTextView * textView = [[LXDTextView alloc] init];
    
    textView.delegate = self;
    textView.textAttributes =  @{
      NSForegroundColorAttributeName: [Utility colorWithHexString:@"b3b3b3" alpha:1.0],
      NSFontAttributeName: [UIFont systemFontOfSize: 13]
      };
    self.bottomLblView = textView;
    [self.contentView addSubview: textView];
    
    self.hongbaoView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.hongbaoView.backgroundColor = [UIColor yellowColor];
//    [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"clubMoney"] forState:UIControlStateNormal];
    [self.hongbaoView addTarget:self action:@selector(hongBaoButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    //138 102
    [self.contentView addSubview:self.hongbaoView];
    
    [self configureLayoutConstraintsWithModel:model];
    if ([UIDevice currentDevice].systemVersion.floatValue == 7.0) {
        self.messageNameHeight = 15;
    }
    self.sendBubbleBackgroundImage = [[UIImage imageNamed:@"bubblesOther"] stretchableImageWithLeftCapWidth:35 topCapHeight:35];
    self.recvBubbleBackgroundImage = [[UIImage imageNamed:@"bubblesOther"] stretchableImageWithLeftCapWidth:35 topCapHeight:35];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bubbleViewTapAction:)];
    [_bubbleView addGestureRecognizer:tapRecognizer];
    
    UITapGestureRecognizer *tapRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(avatarViewTapAction:)];
    [_avatarView addGestureRecognizer:tapRecognizer2];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _bubbleView.backgroundImageView.image = self.model.isSender ? self.sendBubbleBackgroundImage : self.recvBubbleBackgroundImage;
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
    [self configureRecvLayoutConstraints];
 
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
    self.cityLable.textAlignment = NSTextAlignmentLeft;
    __weak typeof(self)WeakSelf = self;
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(WeakSelf.contentView.mas_left).mas_offset(EaseMessageCellPadding);
        make.top.mas_equalTo(WeakSelf.contentView.mas_top).mas_offset(HongBaoCellTopMargin);
        make.width.mas_equalTo(WeakSelf.avatarSize);
        make.height.mas_equalTo(WeakSelf.avatarSize);
    }];
    
    
    [self.VipLevelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(WeakSelf.avatarView.mas_right).mas_offset(5);
        make.bottom.mas_equalTo(WeakSelf.avatarView.mas_bottom);
        make.width.mas_equalTo(23);
        make.height.mas_equalTo(12);
    }];
//    [self.cityLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(WeakSelf.contentView.mas_right).mas_offset(-15);
//        make.top.mas_equalTo(WeakSelf.contentView.mas_top).mas_offset(20);
//        make.width.mas_equalTo(45);
//        make.height.mas_equalTo(25);
//    }];
//
//    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(WeakSelf.avatarView.mas_right).mas_offset(EaseMessageCellPadding);
//        make.centerY.mas_equalTo(WeakSelf.cityLable.mas_centerY);
//        make.right.mas_equalTo(WeakSelf.cityLable.mas_left).mas_offset(-30);
//        make.height.mas_equalTo(WeakSelf.messageNameHeight);
//    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(WeakSelf.avatarView.mas_right).mas_offset(EaseMessageCellPadding);
        make.top.mas_equalTo(WeakSelf.contentView.mas_top).mas_offset(HongBaoCellTopMargin);
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
    
    [self.bubbleView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(WeakSelf.avatarView.mas_right).mas_offset(EaseMessageCellPadding / 2);
        make.top.mas_equalTo(WeakSelf.nameLabel.mas_bottom).mas_offset(5);
        make.bottom.mas_equalTo(WeakSelf.hongbaoView.mas_top).mas_offset(-5);
        
        make.width.mas_equalTo(WeakSelf.bubbleMaxWidth);
        //            make.right.mas_equalTo(self.dateLable.mas_left).mas_offset(-25);
//        make.height.mas_equalTo(_bubbleViewHeight);
    }];
    [self.bottomLblView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(WeakSelf.contentView.mas_bottom);
        make.left.mas_equalTo(WeakSelf.bubbleView.mas_left);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(WeakSelf.bottomLableHeight);
    }];
    [self.hongbaoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(WeakSelf.bottomLblView.mas_top).mas_offset(-5);
        make.left.mas_equalTo(WeakSelf.bubbleView.mas_left).mas_offset(5);
        make.width.mas_equalTo(117);
        make.height.mas_equalTo(WeakSelf.hongBaoHeight);
    }];
    
    [self.statusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(WeakSelf.contentView.mas_centerY).mas_offset(-5);
        make.left.mas_equalTo(WeakSelf.bubbleView.mas_right).mas_offset(5);
        make.width.mas_equalTo(WeakSelf.statusSize);
        make.height.mas_equalTo(WeakSelf.statusSize);
    }];
    [self.activity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(WeakSelf.contentView.mas_centerY).mas_offset(-5);
        make.left.mas_equalTo(WeakSelf.bubbleView.mas_right).mas_offset(15);
        make.width.mas_equalTo(WeakSelf.activitySize);
         make.height.mas_equalTo(WeakSelf.activitySize);
    }];
    [self.hasRead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(WeakSelf.bubbleView.mas_right).mas_offset(5);
        make.top.mas_equalTo(WeakSelf.bubbleView.mas_top).mas_offset(0);
        make.width.mas_equalTo(15);
        make.height.mas_equalTo(15);
    }];

}
/*!
 @method
 @brief 修改已读Label的宽度约束
 @discussion
 @result
 */
//- (void)_updateHasReadWidthConstraint
//{
//    if (_hasRead) {
//        [self removeConstraint:self.hasReadWidthConstraint];
//
//        self.hasReadWidthConstraint = [NSLayoutConstraint constraintWithItem:_hasRead attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:25];
//        [self addConstraint:self.hasReadWidthConstraint];
//    }
//}

/*!
 @method
 @brief 修改发送状态按钮的宽度约束，主要是发送失败的状态
 @discussion
 @result
 */
//- (void)_updateStatusButtonWidthConstraint
//{
//    if (_statusButton) {
//        [self removeConstraint:self.statusWidthConstraint];
//
//        self.statusWidthConstraint = [NSLayoutConstraint constraintWithItem:self.statusButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:self.statusSize];
//        [self addConstraint:self.statusWidthConstraint];
//    }
//}

/*!
 @method
 @brief 修改发送进度的宽度约束
 @discussion
 @result
 */
//- (void)_updateActivityWidthConstraint
//{
//    if (_activity) {
//        [self removeConstraint:self.activtiyWidthConstraint];
//
//        self.statusWidthConstraint = [NSLayoutConstraint constraintWithItem:self.activity attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:self.activitySize];
//        [self addConstraint:self.activtiyWidthConstraint];
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
/*!
 @method
 @brief 修改气泡的宽度约束
 @discussion
 @result
 */
- (void)_updateBubbleMaxWidthConstraint
{
    __weak typeof(self)WeakSelf = self;
    [self.bubbleView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(WeakSelf.bubbleMaxWidth);
    }];
    //    self.bubbleMaxWidthConstraint.active = YES;
}
#pragma mark - setter

- (void)setModel:(id<IMessageModel>)model
{
    _model = model;
//    self.modelDic = model.message.ext;
    NSDictionary * dict = model.message.ext;
    NSNumber *typNub = dict[@"lqType"];
    if (dict[@"isVideoVerify"]) {
        NSInteger isvideoverify = [dict[@"isVideoVerify"] integerValue];
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
    if (typNub.intValue == 1) {
        [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"clubMoneyH"] forState:UIControlStateNormal];
        self.isHiddenBottomView = YES;
        self.bottomLblView.text = nil;
        self.bottomLblView.hyperlinkMapper = nil;
    }else if(typNub.intValue == 2){
        [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"clubMoneyComp"] forState:UIControlStateNormal];
        self.isHiddenBottomView = NO;
        self.bottomLblView.text = @"我的红包已被领完，点击查看详情";
        self.bottomLblView.hyperlinkMapper = @{@"查看详情":@""};
        
    }else{
        [self.hongbaoView setBackgroundImage:[UIImage imageNamed:@"clubMoney"] forState:UIControlStateNormal];
        self.isHiddenBottomView = YES;
        self.bottomLblView.text = nil;
        self.bottomLblView.hyperlinkMapper = nil;
    }
   
    self.cityLable.text =  model.address;
//    NSString * avatarURLPath = dict[@"avatarURLPath"];
    if (model.avatarURLPath) {
//        __weak typeof(self) WeakSelf = self;
        [self.avatarView sd_setImageWithURL:[NSURL URLWithString:model.avatarURLPath] placeholderImage:model.avatarImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            WeakSelf.avatarView.image = [Utility circleImage:WeakSelf.avatarView.image  borderWidth:0.5 borderColor:[UIColor whiteColor]];
        }];
    } else {
        self.avatarView.image =  [UIImage imageNamed:@"8686"];
        
//        NSLog(@"send:%d  --name:%@  --headid:  --from:%@ --ext:%@",model.isSender,model.nickname,model.avatarURLPath,model.message.from,dict);
    }
    
     _bubbleView.textLabel.attributedText = [[EaseEmotionEscape sharedInstance] attStringFromTextForChatting:model.text textFont:self.messageTextFont];
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
- (void)bubbleViewTapAction:(UITapGestureRecognizer *)tapRecognizer{
    
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
    
    if ([_delegate respondsToSelector:@selector(hongBaoButtonSelected:)]) {
//        NSLog(@"%@",self.model.message.ext);
        [_delegate hongBaoButtonSelected:self.model];
    }
}
//- (void)setStatusSize:(CGFloat)statusSize
//{
//    _statusSize = statusSize;
//    [self _updateStatusButtonWidthConstraint];
//}
//
//- (void)setActivitySize:(CGFloat)activitySize
//{
//    _activitySize = activitySize;
//    [self _updateActivityWidthConstraint];
//}

- (void)setSendBubbleBackgroundImage:(UIImage *)sendBubbleBackgroundImage
{
    _sendBubbleBackgroundImage = sendBubbleBackgroundImage;
}

- (void)setRecvBubbleBackgroundImage:(UIImage *)recvBubbleBackgroundImage
{
    _recvBubbleBackgroundImage = recvBubbleBackgroundImage;
}

- (void)setBubbleMaxWidth:(CGFloat)bubbleMaxWidth
{
    _bubbleMaxWidth = bubbleMaxWidth;
    [self _updateBubbleMaxWidthConstraint];
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

- (void)setMessageTextFont:(UIFont *)messageTextFont
{
    _messageTextFont = messageTextFont;
    if (_bubbleView.textLabel) {
        _bubbleView.textLabel.font = messageTextFont;
    }
}

- (void)setMessageTextColor:(UIColor *)messageTextColor
{
    _messageTextColor = messageTextColor;
    if (_bubbleView.textLabel) {
        _bubbleView.textLabel.textColor = _messageTextColor;
    }
}
- (void)setIsHiddenBottomView:(BOOL)isHiddenBottomView{
    _isHiddenBottomView = isHiddenBottomView;
    self.bottomLblView.hidden = isHiddenBottomView;
    
    if (isHiddenBottomView) {
        self.bottomLableHeight = 0.5;
    }else{
        self.bottomLableHeight = 40;
    }
    [self.bottomLblView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.bottomLableHeight);
    }];
    [self updateConstraintsIfNeeded];
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
    if (model.cellHeight > 0) {
        return model.cellHeight;
    }
    MY_TTLClubHongBaoCell *cell = [self appearance];
    CGFloat minHeight = cell.avatarSize + EaseMessageCellPadding + HongBaoCellTopMargin +cell.hongBaoHeight+cell.bottomLableHeight;
    //    CGFloat minHeight = cell.avatarSize + 12;
    
    CGFloat height =cell.messageNameHeight  ;  // = cell.messageNameHeight;
    if ([UIDevice currentDevice].systemVersion.floatValue == 7.0) {
        height = 15;
    }
    height += HongBaoCellTopMargin+cell.hongBaoHeight+cell.bottomLableHeight+EaseMessageCellPadding+5+5;
    
    CGFloat bubbleMaxWidth = cell.bubbleMaxWidth;
    if ([UIDevice currentDevice].systemVersion.floatValue == 7.0) {
        bubbleMaxWidth = 200;
    }
    bubbleMaxWidth -= (cell.leftBubbleMargin.left + cell.leftBubbleMargin.right + cell.rightBubbleMargin.left + cell.rightBubbleMargin.right)/2;
    CGFloat Textheight = EaseMessageCellPadding + 5;  // + cell.bubbleMargin.bottom;
    
    NSAttributedString *text = [[EaseEmotionEscape sharedInstance] attStringFromTextForChatting:model.text textFont:cell.messageTextFont];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(bubbleMaxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
     Textheight += (rect.size.height > 15 ? rect.size.height : 15) ;
    
    height += Textheight;
    height = height > minHeight ? height : minHeight;
    model.cellHeight = height;
    return height;
}

#pragma mark LXDTextViewDelegate
- (void)textView: (LXDTextView *)textView didSelectedHyperlink: (NSString *)hyperlink{
    NSDictionary *dict = self.model.message.ext;
    if ([_delegate respondsToSelector:@selector(hongBaoDetailSelected:)]) {
        [_delegate hongBaoDetailSelected:dict];
    }
}
//- (void)textView:(LXDTextView *)textView didFinishTextRender:(NSInteger)reasonableLength{
//
//}

-(void)LongPoint:(UILongPressGestureRecognizer *)lgz
{
    //    if (lgz.state == UIGestureRecognizerStateBegan)
    //    {
    if (_delegate && [_delegate respondsToSelector:@selector(getUserName:)]) {
        [_delegate getUserName:_model];
        
        //            return;
        //        }
    }
}
@end
