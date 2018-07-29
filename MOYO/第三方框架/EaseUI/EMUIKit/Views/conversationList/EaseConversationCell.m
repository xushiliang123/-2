/************************************************************
 *  * Hyphenate CONFIDENTIAL
 * __________________
 * Copyright (C) 2016 Hyphenate Inc. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of Hyphenate Inc.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Hyphenate Inc.
 */

#import "EaseConversationCell.h"

#if ENABLE_LITE == 1
#import <HyphenateLite/EMConversation.h>
#else
#import <Hyphenate/EMConversation.h>
#endif
#import "UIImageView+WebCache.h"

CGFloat const EaseConversationCellPadding = 10;

@interface EaseConversationCell()

@property (nonatomic) NSLayoutConstraint *titleWithAvatarLeftConstraint;

@property (nonatomic) NSLayoutConstraint *titleWithoutAvatarLeftConstraint;

@property (nonatomic) NSLayoutConstraint *detailWithAvatarLeftConstraint;

@property (nonatomic) NSLayoutConstraint *detailWithoutAvatarLeftConstraint;

@property (nonatomic) NSLayoutConstraint *viplevelWithAvatarLeftConstraint;

@property (nonatomic) NSLayoutConstraint *viplevelWithoutAvatarLeftConstraint;

@property (nonatomic) NSLayoutConstraint *clubIDWidthConstraint;
@property (nonatomic) NSLayoutConstraint *titleWithOutClubLeftConstraint;
@property (nonatomic) NSLayoutConstraint *noneClubIDWidthConstraint;
@end

@implementation EaseConversationCell

+ (void)initialize
{
    // UIAppearance Proxy Defaults
    /** @brief 默认配置 */
    EaseConversationCell *cell = [self appearance];
    cell.titleLabelColor = [self colorWithHexString:@"#333333" alpha:1.0];
    cell.titleLabelFont = [UIFont systemFontOfSize:16];
    cell.detailLabelColor = [self colorWithHexString:@"#999999" alpha:1.0];
    cell.detailLabelFont = [UIFont systemFontOfSize:14];
    cell.timeLabelColor = [self colorWithHexString:@"#999999" alpha:1.0];
    cell.timeLabelFont = [UIFont systemFontOfSize:11];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _showAvatar = YES;
        [self _setupSubview];
    }
    
    return self;
}

#pragma mark - private layout subviews

/*!
 @method
 @brief 加载视图
 @discussion
 @return
 */
- (void)_setupSubview
{
    self.accessibilityIdentifier = @"table_cell";

    _avatarView = [[EaseImageView alloc] init];
    _avatarView.translatesAutoresizingMaskIntoConstraints = NO;
    _avatarView.imageView.layer.cornerRadius = (EaseConversationCellMinHeight- 18)/2;
    _avatarView.imageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_avatarView];

    _timeLabel = [[UILabel alloc] init];
    _timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _timeLabel.font = _timeLabelFont;
    _timeLabel.textColor = _timeLabelColor;
    _timeLabel.textAlignment = NSTextAlignmentRight;
    _timeLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_timeLabel];
    
//    _VipLevelLabel = [[UILabel alloc] init];
//    _VipLevelLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    _VipLevelLabel.layer.cornerRadius = 7;
//    _VipLevelLabel.layer.masksToBounds = YES;
//    _VipLevelLabel.font = [UIFont systemFontOfSize:9];
//    _VipLevelLabel.textColor = [UIColor whiteColor];
//    _VipLevelLabel.text = @"SVIP10";
//    _VipLevelLabel.textAlignment = NSTextAlignmentCenter;
//    _VipLevelLabel.backgroundColor = [Utility colorWithHexString:@"#FA4034" alpha:1.0f];
//    [self.contentView addSubview:_VipLevelLabel];
    
    
    _clubIDImg = [[UIImageView alloc] init];
    _clubIDImg.translatesAutoresizingMaskIntoConstraints = NO;
    _clubIDImg.image = [UIImage imageNamed:@"clubB"];
    _clubIDImg.backgroundColor = [UIColor clearColor];
    [self addSubview:_clubIDImg];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.accessibilityIdentifier = @"title";
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _titleLabel.numberOfLines = 1;
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = _titleLabelFont;
    _titleLabel.textColor = _titleLabelColor;
    [self.contentView addSubview:_titleLabel];
    
    _detailLabel = [[UILabel alloc] init];
    _detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _detailLabel.backgroundColor = [UIColor clearColor];
    _detailLabel.font = _detailLabelFont;
    _detailLabel.textColor = _detailLabelColor;
    [self.contentView addSubview:_detailLabel];
    
    [self _setupAvatarViewConstraints];
    [self _setupTimeLabelConstraints];
    [self _setupTitleLabelConstraints];
    [self _setupDetailLabelConstraints];
//    [self _setupVipLabelConstraints];
}

#pragma mark - Setup Constraints

/*!
 @method
 @brief 设置avatarView的约束
 @discussion
 @return
 */
- (void)_setupAvatarViewConstraints
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:9.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-9.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:EaseConversationCellPadding]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.avatarView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
}

/*!
 @method
 @brief 设置timeLabel的约束
 @discussion
 @return
 */
- (void)_setupTimeLabelConstraints
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.timeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:17]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.timeLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-EaseConversationCellPadding]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.timeLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:nil multiplier:1.0 constant:12]];
    
}

/*!
 @method
 @brief 设置titleLabel的约束
 @discussion
 @return
 */
- (void)_setupTitleLabelConstraints
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.clubIDImg attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.avatarView attribute:NSLayoutAttributeTop multiplier:1.0 constant:6]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.clubIDImg attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.avatarView attribute:NSLayoutAttributeRight multiplier:1.0 constant:EaseConversationCellPadding]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.clubIDImg attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:nil multiplier:1.0 constant:17]];
    self.clubIDWidthConstraint = [NSLayoutConstraint constraintWithItem:self.clubIDImg attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:nil multiplier:1.0 constant:47];
    [self addConstraint:self.clubIDWidthConstraint];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.avatarView attribute:NSLayoutAttributeTop multiplier:1.0 constant:6]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:nil multiplier:1.0 constant:17]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.timeLabel attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-EaseConversationCellPadding]];
    
//    self.titleWithAvatarLeftConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.avatarView attribute:NSLayoutAttributeRight multiplier:1.0 constant:EaseConversationCellPadding];
    self.titleWithAvatarLeftConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.clubIDImg attribute:NSLayoutAttributeRight multiplier:1.0 constant:2];

    [self addConstraint:self.titleWithAvatarLeftConstraint];
    

    
    self.noneClubIDWidthConstraint = [NSLayoutConstraint constraintWithItem:self.clubIDImg attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:nil multiplier:1.0 constant:0.1];
    self.titleWithOutClubLeftConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.clubIDImg attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.1];
}

-(void)_setupVipLabelConstraints
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.VipLevelLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:nil multiplier:1.0 constant:14]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.VipLevelLabel attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:1.5]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.VipLevelLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:nil multiplier:1.0 constant:33]];
    
    self.viplevelWithAvatarLeftConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.VipLevelLabel attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-EaseConversationCellPadding];
    
    self.viplevelWithoutAvatarLeftConstraint = [NSLayoutConstraint constraintWithItem:self.VipLevelLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:EaseConversationCellPadding];
    
    [self addConstraint:self.viplevelWithAvatarLeftConstraint];
}

/*!
 @method
 @brief 设置detailLabel的约束
 @discussion
 @return
 */
- (void)_setupDetailLabelConstraints
{
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:nil multiplier:1.0 constant:14]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.avatarView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-6]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-EaseConversationCellPadding]];
    
    self.detailWithAvatarLeftConstraint = [NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.avatarView attribute:NSLayoutAttributeRight multiplier:1.0 constant:EaseConversationCellPadding+2];
    
    self.detailWithoutAvatarLeftConstraint = [NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:EaseConversationCellPadding+2];
    
    [self addConstraint:self.detailWithAvatarLeftConstraint];
}

#pragma mark - setter

- (void)setShowAvatar:(BOOL)showAvatar
{
    if (_showAvatar != showAvatar) {
        _showAvatar = showAvatar;
        self.avatarView.hidden = !showAvatar;
        if (_showAvatar) {
            [self removeConstraint:self.titleWithoutAvatarLeftConstraint];
            [self removeConstraint:self.detailWithoutAvatarLeftConstraint];
            [self removeConstraint:self.viplevelWithoutAvatarLeftConstraint];
            [self addConstraint:self.titleWithAvatarLeftConstraint];
            [self addConstraint:self.detailWithAvatarLeftConstraint];
            [self addConstraint:self.viplevelWithAvatarLeftConstraint];
        }
        else{
            [self removeConstraint:self.titleWithAvatarLeftConstraint];
            [self removeConstraint:self.detailWithAvatarLeftConstraint];
            [self addConstraint:self.titleWithoutAvatarLeftConstraint];
            [self addConstraint:self.detailWithoutAvatarLeftConstraint];
            [self removeConstraint:self.viplevelWithAvatarLeftConstraint];
            [self addConstraint:self.viplevelWithoutAvatarLeftConstraint];
        }
    }
}

- (void)setModel:(id<IConversationModel>)model
{
    _model = model;
    
    self.modelDic = _model.conversation.ext;
    
    if ([_model.title length] > 0) {
        self.titleLabel.text = _model.title;
    }
    else{
        self.titleLabel.text = _model.conversation.conversationId;
    }
    if (model.conversation.type == EMConversationTypeChat) {
        NSString * colorStr = @"#000000";
        //  是贵族 颜色是黄色
        if ([[self.modelDic objectForKey:@"noble"] integerValue]) {
            colorStr = @"#E2C04E";
        }
        self.titleLabelColor = [Utility colorWithHexString:colorStr alpha:1.0];
    }else{
         self.titleLabelColor = [Utility colorWithHexString:@"#000000" alpha:1.0];
    }
    
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],
//                                                                      NSForegroundColorAttributeName:[Utility colorWithHexString:colorStr alpha:1.0]}];
    
    
    if (self.showAvatar) {
        if ([_model.avatarURLPath length] > 0){
            [self.avatarView.imageView sd_setImageWithURL:[NSURL URLWithString:_model.avatarURLPath] placeholderImage:_model.avatarImage options:SDWebImageAllowInvalidSSLCertificates];
        } else {
            if (_model.avatarImage) {
                self.avatarView.image = _model.avatarImage;
            }
        }
    }
    
    if (_model.conversation.unreadMessagesCount == 0) {
        _avatarView.showBadge = NO;
    }
    else{
        _avatarView.showBadge = YES;
        _avatarView.badge = _model.conversation.unreadMessagesCount;
    }
    
//    if ([_model.conversation.conversationId isEqualToString:@"tingting1"] || [_model.conversation.conversationId isEqualToString:@"tingting3"] || [_model.conversation.conversationId isEqualToString:@"kefu1"] || [_model.conversation.conversationId isEqualToString:@"tingting5"])
//    {
//        self.VipLevelLabel.hidden = YES;
//        _avatarView.AddVImg.hidden = YES;
//    }
//    else
//    {
         if (_model.conversation.type == EMConversationTypeGroupChat || _model.conversation.type == EMConversationTypeChatRoom)
         {
//             self.VipLevelLabel.hidden = YES;
//             _avatarView.AddVImg.hidden = YES;
             self.clubIDImg.hidden = NO;
             [self removeConstraint:self.noneClubIDWidthConstraint];
             [self addConstraint:self.clubIDWidthConstraint];
             [self removeConstraint:self.titleWithOutClubLeftConstraint];
             [self addConstraint:self.titleWithAvatarLeftConstraint];

         }
         else{
             self.clubIDImg.hidden = YES;
             [self removeConstraint:self.clubIDWidthConstraint];
             [self addConstraint:self.noneClubIDWidthConstraint];
             
             [self removeConstraint:self.titleWithAvatarLeftConstraint];
             [self addConstraint:self.titleWithOutClubLeftConstraint];
//             self.VipLevelLabel.hidden = YES;
////             self.VipLevelLabel.text = [NSString stringWithFormat:@"VIP%@",_model.conversation.ext[@"myVip"]];
//             if(_model.conversation.ext[@"noble"])
//             {
//                 self.titleLabel.textColor = GOLDCOLOR;
//             }
//             else
//             {
//             }
//             if(_model.conversation.ext[@"addV"])
//             {
//                 _avatarView.AddVImg.hidden = NO;
//             }
//             else
//             {
//                 _avatarView.AddVImg.hidden = YES;
//             }

         }
//    }
    

}

- (void)setTitleLabelFont:(UIFont *)titleLabelFont
{
    _titleLabelFont = titleLabelFont;
    _titleLabel.font = _titleLabelFont;
}

- (void)setTitleLabelColor:(UIColor *)titleLabelColor
{
    _titleLabelColor = titleLabelColor;
    _titleLabel.textColor = _titleLabelColor;
}

- (void)setDetailLabelFont:(UIFont *)detailLabelFont
{
    _detailLabelFont = detailLabelFont;
    _detailLabel.font = _detailLabelFont;
}

- (void)setDetailLabelColor:(UIColor *)detailLabelColor
{
    _detailLabelColor = detailLabelColor;
    _detailLabel.textColor = _detailLabelColor;
}

- (void)setTimeLabelFont:(UIFont *)timeLabelFont
{
    _timeLabelFont = timeLabelFont;
    _timeLabel.font = _timeLabelFont;
}

- (void)setTimeLabelColor:(UIColor *)timeLabelColor
{
    _timeLabelColor = timeLabelColor;
    _timeLabel.textColor = _timeLabelColor;
}
#pragma mark - class method
/*!
 @method
 @brief 获取cell的重用标识
 @discussion
 @param model   消息model
 @return 返回cell的重用标识
 */
+ (NSString *)cellIdentifierWithModel:(id)model
{
    return @"EaseConversationCell";
}
/*!
 @method
 @brief 获取cell的高度
 @discussion
 @param model   消息model
 @return  返回cell的高度
 */
+ (CGFloat)cellHeightWithModel:(id)model
{
    return EaseConversationCellMinHeight;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (_avatarView.badge) {
        _avatarView.badgeBackgroudColor = [UIColor clearColor];
    }
}
-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    if (_avatarView.badge) {
        _avatarView.badgeBackgroudColor = [UIColor redColor];
    }
}
//颜色
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

@end
