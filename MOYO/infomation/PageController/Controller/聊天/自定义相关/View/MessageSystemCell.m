//
//  MessageSystemCell.m
//  TogetherLu
//
//  Created by Louie on 2017/5/23.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MessageSystemCell.h"

@implementation MessageSystemCell
{
    UIView * _grayView;
    UITapGestureRecognizer* _tap;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    
    if (self){
        
        [self setUI];
    }
    return self;
}
/*
 _titleLabel.layer.masksToBounds = YES;
 _titleLabel.layer.cornerRadius = 22 * 0.2;
 
 cell.titleLabelColor = [self colorWithHexString:@"#ffffff" alpha:1.0];
 cell.titleLabelBackgroundColor = [self colorWithHexString:@"#3d3d3d" alpha:0.2];
 cell.titleLabelFont = [UIFont systemFontOfSize:12];
 cell.titleLabel.textAlignment = NSTextAlignmentCenter;
 */


- (void)setUI{
    
    self.backgroundColor = [UIColor clearColor];
    
    _grayView = [[UIView alloc] init];
    _grayView.backgroundColor = [Utility colorWithHexString:@"#3d3d3d" alpha:0.2];
    _grayView.layer.masksToBounds = YES;
    _grayView.layer.cornerRadius = 22 * 0.2;
    [self.contentView addSubview:_grayView];
    
    self.grayLabel = [[UILabel alloc] init];
    self.grayLabel.textColor = [Utility colorWithHexString:@"#ffffff" alpha:1.0];
//    self.grayLabel.backgroundColor = [Utility colorWithHexString:@"#3d3d3d" alpha:0.2];
    self.grayLabel.font = [UIFont systemFontOfSize:12];
    self.grayLabel.textAlignment = NSTextAlignmentCenter;
//    self.grayLabel.layer.masksToBounds = YES;
//    self.grayLabel.layer.cornerRadius = 22 * 0.2;
    self.grayLabel.userInteractionEnabled = YES;
    self.grayLabel.numberOfLines = 0;
    [_grayView addSubview:self.grayLabel];
    
    [_grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.contentView).mas_offset(25);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.width.mas_equalTo(120);
        make.bottom.mas_equalTo(self.contentView).mas_offset(-13);
    }];
    
    [self.grayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_grayView.mas_top);
        make.centerX.mas_equalTo(_grayView.mas_centerX);
        make.width.mas_equalTo(_grayView.mas_width).mas_offset(-20);
        make.bottom.mas_equalTo(_grayView.mas_bottom);
    }];
}


- (void)setModel:(id<IMessageModel>)model {
    _model = model;
    
    self.grayLabel.text = model.text;
    
    CGFloat width = [Utility stringSizeWithString:model.text textSize:12 width:0 height:12].width;
    
    if (width > SCREEN_WIDTH - 100) {
        
        width = SCREEN_WIDTH - 80;
    } else {
        
        width = width + 20;
    }
    
    [_grayView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.contentView).mas_offset(25);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.width.mas_equalTo(width + 20);
        make.bottom.mas_equalTo(self.contentView).mas_offset(-13);
    }];
    
    [self.grayLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_grayView.mas_top);
        make.centerX.mas_equalTo(_grayView.mas_centerX);
        make.width.mas_equalTo(_grayView.mas_width).mas_offset(-20);
        make.bottom.mas_equalTo(_grayView.mas_bottom);
    }];
    

    
    if ([model.message.ext objectForKey:@"orderNo"] ){
        NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:model.text];
        [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.0f] range:NSMakeRange(AttributedStr.length - 4, 4)];
        [AttributedStr addAttribute:NSForegroundColorAttributeName value:GOLDCOLOR range:NSMakeRange(AttributedStr.length - 4, 4)];
        self.grayLabel.attributedText = AttributedStr;
    }
    if ([model.message.ext objectForKey:@"kefu"]) {
        NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:model.text];
        [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.0f] range:NSMakeRange(AttributedStr.length - 6, 4)];
        [AttributedStr addAttribute:NSForegroundColorAttributeName value:GOLDCOLOR range:NSMakeRange(AttributedStr.length - 6, 4)];
        self.grayLabel.attributedText = AttributedStr;
    }
    if ([model.message.ext objectForKey:@"orderNo"] || [model.message.ext objectForKey:@"kefu"]) {
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionTap)];
        [self.grayLabel addGestureRecognizer:_tap];
    }
    else{
        [self.grayLabel removeGestureRecognizer:_tap];
    }
    
}
-(void)actionTap
{
    if ([_model.message.ext objectForKey:@"orderNo"] ){
        NSNumber* orderId = [NSNumber numberWithInteger:[[NSString stringWithFormat:@"%@",[_model.message.ext objectForKey:@"orderNo"]] integerValue]];
        NSNumber* tag = [NSNumber numberWithInteger:[[NSString stringWithFormat:@"%@",[_model.message.ext objectForKey:@"tag"]] integerValue]];
        _blockOrder(orderId, tag);
    }
    if ([_model.message.ext objectForKey:@"kefu"]) {
        _blockKefu();
    }
}



/*
 - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(id<IMessageModel>)model
 {
 self = [super initWithStyle:style reuseIdentifier:reuseIdentifier model:model];
 
 if (self) {
 self.hasRead.hidden = YES;
 self.selectionStyle = UITableViewCellSelectionStyleNone;
 
 [self setUI];
 }
 
 return self;
 }
 
 */





/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
