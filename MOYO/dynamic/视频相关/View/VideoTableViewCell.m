//
//  VideoTableViewCell.m
//  videoTest
//
//  Created by Louie on 2017/6/14.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "VideoTableViewCell.h"
#import <AVFoundation/AVFoundation.h>

@implementation VideoTableViewCell
{
    UIView * _filletView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setUI];
    }
    return self;
}

- (void)setUI
{

    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self layoutIfNeeded];
    
//  头像
    self.avatarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.avatarBtn.layer.masksToBounds = YES;
    self.avatarBtn.layer.cornerRadius = 55/2;
    [self.contentView addSubview:self.avatarBtn];
    
    [self.avatarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView.mas_top).mas_offset(10);
        make.left.equalTo(self.contentView.mas_left).mas_offset(10);
        make.height.width.mas_equalTo(55);
    }];
    
//  加V认证标示
    self.VimageView = [[UIImageView alloc] init];
    self.VimageView.image = [UIImage imageNamed:@"addV"];
    self.VimageView.hidden = YES;
    [self.contentView addSubview:self.VimageView];
    
    [self.VimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.avatarBtn.mas_bottom);
        make.right.equalTo(self.avatarBtn.mas_right);
        make.height.width.mas_equalTo(17);
    }];
    
//  昵称
    self.nickLabel = [[UILabel alloc] init];
    self.nickLabel.font = [UIFont systemFontOfSize:18];
    self.nickLabel.textColor = COlOR333;
    [self.contentView addSubview:self.nickLabel];

    [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.avatarBtn.mas_top).mas_offset(4.5);
        make.left.equalTo(self.avatarBtn.mas_right).mas_offset(20);
        make.right.equalTo(self.contentView.mas_right).mas_offset(-65);
        make.height.mas_equalTo(20);
    }];

    
//  地址和时间
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont systemFontOfSize:15];
    self.timeLabel.textColor = COlOR999;
    self.timeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.timeLabel];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.avatarBtn.mas_bottom).mas_offset(-4.5);
        make.left.equalTo(self.avatarBtn.mas_right).mas_offset(20);
        make.width.mas_equalTo(SCREEN_WIDTH - 90);
        make.height.mas_equalTo(17);
    }];
    
    if (!self.isMyDynamic) {
        //  关注按钮
        self.attentionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.attentionBtn.layer.masksToBounds = YES;
        self.attentionBtn.layer.cornerRadius = 3.0;
        self.attentionBtn.layer.borderWidth = 0.5;
        self.attentionBtn.layer.borderColor = GOLDCOLOR.CGColor;
        self.attentionBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
        [self.attentionBtn setTitleColor:GOLDCOLOR forState:UIControlStateNormal];
        [self.contentView addSubview:self.attentionBtn];
        
        [self.attentionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.avatarBtn.mas_centerY);
            make.right.equalTo(self.contentView.mas_right).mas_offset(-10);
            make.width.mas_equalTo(55);
            make.height.mas_equalTo(25);
        }];
    }
    
//  分割线
//    UIView * lineView = [[UIView alloc] init];
//    lineView.backgroundColor = [Utility colorWithHexString:@"#e5e5e5" alpha:1.0];
//    [self.contentView addSubview:lineView];
//    
//    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.bottom.equalTo(self.contentView.mas_bottom).mas_offset(-45);
//        make.left.equalTo(self.contentView.mas_left).mas_offset(10);
//        make.width.mas_equalTo(SCREEN_WIDTH - 20);
//        make.height.mas_equalTo(0.5);
//    }];
    
//  动态
    self.dynamicLabel = [[UILabel alloc] init];
    self.dynamicLabel.numberOfLines = 0;
    self.dynamicLabel.font = [UIFont systemFontOfSize:14];
    self.dynamicLabel.textColor = COlOR333;
    [self.contentView addSubview:self.dynamicLabel];
    
    [self.dynamicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.avatarBtn.mas_bottom).mas_offset(9);
        make.left.equalTo(self.contentView.mas_left).mas_offset(10);
        make.width.mas_equalTo(SCREEN_WIDTH - 20);
        make.height.mas_equalTo(16);
    }];
    
//  圆角视图
    _filletView = [[UIView alloc] init];
    _filletView.backgroundColor = [UIColor whiteColor];
//    filletView.layer.masksToBounds = YES;
    _filletView.layer.cornerRadius = 6;
////    阴影的颜色
//    _filletView.layer.shadowColor = [UIColor blackColor].CGColor;
////    阴影的透明度
//    _filletView.layer.shadowOpacity = 0.15;
////    阴影的圆角
//    _filletView.layer.shadowRadius = 4.f;
////    阴影偏移量
//    _filletView.layer.shadowOffset = CGSizeMake(4,4);
    [self.contentView addSubview:_filletView];
    
    [_filletView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left).mas_offset(10);
        make.width.mas_equalTo(SCREEN_WIDTH - 20);
        make.height.mas_equalTo(SCREEN_WIDTH - 20 + 50);
    }];
    
//  展示图
    self.picView = [[UIImageView alloc] init];
    self.picView.userInteractionEnabled = YES;
    self.picView.contentMode = UIViewContentModeScaleAspectFill;
    self.picView.layer.masksToBounds = YES;
    self.picView.layer.cornerRadius = 6;
    [_filletView addSubview:self.picView];
    
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, SCREEN_WIDTH - 20, SCREEN_WIDTH - 20) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(6, 6)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = self.picView.bounds;
//    maskLayer.path = maskPath.CGPath;
//    self.picView.layer.mask = maskLayer;
    
    [self.picView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_filletView.mas_top);
        make.left.equalTo(_filletView.mas_left);
        make.width.mas_equalTo(SCREEN_WIDTH - 20);
        make.height.mas_equalTo(SCREEN_WIDTH - 20);
    }];
    
    // 设置imageView的tag，在PlayerView中取（建议设置100以上）
    self.picView.tag = 101;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(picViewTapResture:)];
    [self.picView addGestureRecognizer:tap];
    
    CGFloat width = 54 + 25;
    CGFloat space = (SCREEN_WIDTH- width * 4) / 5.0;

//  私聊
    self.privateChat = [[ParallelButton alloc] init];
    self.privateChat.title = @"私聊";
    self.privateChat.leftImageView.image = [UIImage imageNamed:@"privateChat"];
    [self.contentView addSubview:self.privateChat];

    [self.privateChat mas_makeConstraints:^(MASConstraintMaker *make) {

        make.bottom.equalTo(_filletView.mas_bottom);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(25);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(width);
    }];
    
//  点赞
    self.zanBtn = [[ParallelButton alloc] init];
    self.zanBtn.title = @"点赞";
    self.zanBtn.leftImageView.image = [UIImage imageNamed:@"dianZan"];
    [self.contentView addSubview:self.zanBtn];
    
    [self.zanBtn mas_makeConstraints:^(MASConstraintMaker *make) {

        make.bottom.equalTo(_filletView.mas_bottom);
        make.left.equalTo(self.privateChat.mas_right).mas_offset(space);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(width);
    }];

    
//  浏览量
    self.pageViewBtn = [[ParallelButton alloc] init];
    self.pageViewBtn.title = @"浏览量";
    self.pageViewBtn.leftImageView.image = [UIImage imageNamed:@"BrowseVolume"];
    [self.contentView addSubview:self.pageViewBtn];
    
    [self.pageViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_filletView.mas_bottom);
        make.left.equalTo(self.zanBtn.mas_right).mas_offset(space);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(width);
    }];
    
    //红包
    self.hongBaoChat = [[ParallelButton alloc] init];
    self.hongBaoChat.title = @"红包";
    self.hongBaoChat.imageWidth = 15;
    self.hongBaoChat.leftImageView.image = [UIImage imageNamed:@"moneyG"];
    [self.contentView addSubview:self.hongBaoChat];
    [self.hongBaoChat addTarget:self action:@selector(hongBaoChatClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.hongBaoChat mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(_filletView.mas_bottom);
        make.left.equalTo(self.pageViewBtn.mas_right).mas_offset(space);;
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(width);
    }];
    

//    self.commentBtn.backgroundColor = [UIColor redColor];
//    self.zanBtn.backgroundColor = [UIColor greenColor];
//    self.pageViewBtn.backgroundColor = [UIColor purpleColor];
//    self.giftsBtn.backgroundColor = [UIColor orangeColor];
    
//  播放按钮
    // 代码添加playerBtn到imageView上
    self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.playBtn.backgroundColor = [UIColor purpleColor];
    [self.playBtn setImage:[UIImage imageNamed:@"videoPlayBtn"] forState:UIControlStateNormal];
    [self.playBtn addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [self.picView addSubview:self.playBtn];
    
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.picView);
        make.width.height.mas_equalTo(ScaleWidth(50));
    }];
}

- (void)hongBaoChatClick:(ParallelButton*)sender{
    if ([self.delegate respondsToSelector:@selector(VideoTableViewCellHongBaoBtnClickWithCell:withModel:)]) {
        [self.delegate VideoTableViewCellHongBaoBtnClickWithCell:self withModel:self.model];
    }
}
- (void)setIsMyDynamic:(BOOL)isMyDynamic {
    _isMyDynamic = isMyDynamic;
    
    CGFloat width = 54 + 25;
    CGFloat space = (SCREEN_WIDTH - width * 4 - 25) / 2;
    
    if (self.isMyDynamic) {
        
        self.privateChat.hidden = YES;

//  删除之前的约束
        [self.zanBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_filletView.mas_bottom);
            make.left.equalTo(self.privateChat.mas_right).mas_offset(space);
            make.height.mas_equalTo(50);
            make.width.mas_equalTo(width);
        }];
//  添加新的约束
        [self.zanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(_filletView.mas_bottom);
            make.left.mas_equalTo(self.contentView.mas_left).mas_offset(25);
            make.height.mas_equalTo(50);
            make.width.mas_equalTo(width);
        }];
    }
    else {
        
        self.privateChat.hidden = NO;

//  删除之前的约束
        [self.zanBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(_filletView.mas_bottom);
            make.left.mas_equalTo(self.contentView.mas_left).mas_offset(25);
            make.height.mas_equalTo(50);
            make.width.mas_equalTo(width);
        }];
//  添加新的约束
        [self.zanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(_filletView.mas_bottom);
            make.left.equalTo(self.privateChat.mas_right).mas_offset(space);
            make.height.mas_equalTo(50);
            make.width.mas_equalTo(width);
        }];
    }
}


// 切圆角
- (void)cutRoundView:(UIImageView *)imageView
{
    
//    CGFloat corner = imageView.frame.size.width / 2;
    CGFloat corner = 3;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(corner, corner)];
    shapeLayer.path = path.CGPath;
    imageView.layer.mask = shapeLayer;
}




- (void)setModel:(VideoResolutionModel *)model
{
    _model = model;
    
    //  头像
    [self.avatarBtn sd_setImageWithURL:[NSURL URLWithString:model.headIcon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"占位图"]];
    
    //  昵称
    self.nickLabel.text = model.nickName;
    //  昵称颜色
    if (model.nobleLevel.integerValue == 1) {
        self.nickLabel.textColor = GOLDCOLOR;
    }
    else {
        self.nickLabel.textColor = COlOR333;
    }
    
    //  关注按钮
    if (_model.userId.integerValue == [USERID integerValue]) {
        
        self.attentionBtn.hidden = YES;
    }else{
        if ([model.isFollow integerValue]) {
            
            self.attentionBtn.hidden = YES;
            
        }else{
            self.attentionBtn.hidden = NO;
        }
    }
//    
//    //  隐私设置 0为开，1为关  设置多个图标
//    if (model.secretStatus.integerValue) {
//        
//        [self.typeImageView changeSex:model.sex withAge:_model.age withIsQualification:model.isQualification withConsumptionLevel:model.consumptionLevel WithTypeArray:model.type];
//    }else{
//        [self.typeImageView changeSex:model.sex withAge:_model.age withIsQualification:model.isQualification withConsumptionLevel:model.consumptionLevel WithTypeArray:@[]];
//    }
    
    //  动态文字
    self.dynamicLabel.text = model.content;
    
    [self.dynamicLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(model.dynamicHeight + 1);
    }];
    
    //  视频首帧（图片）
    //    [self.picView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"占位图"] options:SDWebImageAllowInvalidSSLCertificates ];
    
    [self.picView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"占位图"] options:SDWebImageAllowInvalidSSLCertificates completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        //  视频动态显示按钮， 非视频动态隐藏按钮
        if (model.dynamicType.integerValue) {
            if (error) {
                self.playBtn.hidden = YES;
            }
            else {
                self.playBtn.hidden = NO;
            }
            
        }else {
            self.playBtn.hidden = YES;
        }
    }];
    
    NSInteger h = model.videoHeight;
    NSInteger w = model.videoWidth;
    
    //  动态图片
    CGFloat imgH = SCREEN_WIDTH - 20;
    if (model.dynamicType.integerValue) {
        if (w > h) {
            imgH = h * imgH / w;
        }
        else {
            imgH = imgH;
        }
    }
    
    [_filletView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(imgH + 50);
    }];
    
    [self.picView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(imgH);
    }];
    
    //  地点+时间
    NSString * region = nil;
    NSMutableString * city = nil;
    
//    if (UserObject(@"city")) {
//        city = [[NSMutableString alloc]initWithString:UserObject(@"city")];
//    }
    
    if (model.distanceStatus.integerValue) {
        region = @"隐身";
        
    }else{
        if ([_personalModel.region isEqualToString:model.region]) {
            if ([model.region isEqualToString:@"角落里"]) {
                region =  model.region;
            }else{
                region  = [NSString stringWithFormat:@"%.1fkm",[model.distance floatValue]];
            }
        }else{
            region =  model.region;
        }
    }
    
//  删除Or私聊按钮
    if (model.userId.integerValue == [USERID integerValue]) {
        
        self.privateChat.title = @"删除";
        self.privateChat.leftImageView.image = [UIImage imageNamed:@"DynamicDelete"];
    }else {
        self.privateChat.title = @"私聊";
        self.privateChat.leftImageView.image = [UIImage imageNamed:@"privateChat"];
    }
    
    if(![[NSString stringWithFormat:@"%@",model.encourageMoney] isEqualToString:@"0"])
    {
        self.hongBaoChat.title = [NSString stringWithFormat:@"%@",model.encourageMoney];
    }else{
        self.hongBaoChat.title = @"红包";
    }
    
    NSString * timeStr = [Utility isBlankString:model.createTime.stringValue]?@"1分钟前": [Utility dyanmaicShowDateString:model.createTime.longLongValue];
    
    self.timeLabel.text = [NSString stringWithFormat:@"%@ | %@", region, timeStr];
    
    // 点赞数
    NSString * thumbNumStr =  model.thumbNum.integerValue?model.thumbNum.stringValue:@"点赞";
    self.zanBtn.title = thumbNumStr;
    if (model.isClick.integerValue > 0) {
        self.zanBtn.leftImageView.image = [UIImage imageNamed:@"yiZan"];
    }
    else {
        self.zanBtn.leftImageView.image = [UIImage imageNamed:@"dianZan"];
    }
    
    // 浏览量
    NSString * browseVolume = model.viewNum.integerValue?model.viewNum.stringValue:@"浏览量";
    self.pageViewBtn.title = browseVolume;
    
    //  加v认证标示
    if (model.isAuthen.integerValue) {
        
        self.VimageView.hidden = NO;
    }
    else {
        
        self.VimageView.hidden = YES;
    }
    
    //  去除磨玻璃效果
    if (self.effectView) {
        [self.effectView removeFromSuperview];
        self.effectView = nil;
    }
}


- (void)play:(UIButton *)sender
{
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];

    //  毛玻璃视图
    self.effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

    //添加到要有毛玻璃特效的控件中
    self.effectView.frame = self.picView.bounds;
    [self.picView addSubview:self.effectView];

    //设置模糊透明度
    self.effectView.alpha = .9f;
    
    if (self.playBlock) {
        self.playBlock(sender);
    }
    
    //    NSMutableDictionary * parameters = [NSMutableDictionary dictionaryWithObject:USERKEY forKey:@"key"];
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    
    [parameters setObject:_model.did forKey:@"dynamicId"];
    
//    [TLHTTPRequest MY_getWithBaseUrl:DynamicPlayNum parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//        
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//        
//    }];
}

- (void)picViewTapResture:(UITapGestureRecognizer *)tap {
    
    if (self.ViewLargeImageBlock) {
        self.ViewLargeImageBlock(self.model, self.frame.origin.y);
    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
