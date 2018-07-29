//
//  MY_GLMainTopicTableViewCell.m
//  VTIME
//
//  Created by gll on 2018/1/12.
//  Copyright © 2018年 MadridLee. All rights reserved.
//

#import "MY_GLMainTopicTableViewCell.h"
#import "HeadBtn.h"

@implementation MY_GLMainTopicTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

//  屏蔽审核服 不能显示 成为贵族

- (void)setUIWithArray:(NSArray *)imageArray{
    
    NSInteger arrayCount = imageArray.count;
    
    //  每行个数
    NSInteger rowNumber = imageArray.count;
    //    NSInteger rowNumber = 4;
    for (NSInteger i = 0; i < arrayCount; ++i) {
        
        NSInteger line = i ;//% rowNumber;
//        NSInteger row = i / rowNumber;
        //   宽 、间距
        CGFloat width = SCREEN_WIDTH / (imageArray.count * 1.0);
        CGFloat verSpace = 0;
        //  高  、 间距
        CGFloat height =  ScaleHeight(94);
        CGFloat horSpace = 0;
        
        CGFloat originX = horSpace + (horSpace + width) * line;
        CGFloat originY = 18;
        
        CGRect rect = CGRectMake(originX, originY, width, height);
        
        NSString * title = imageArray[i];
        
        HeadBtn * btn = [[HeadBtn alloc] initWithFrame:rect];
        btn.headImage.image = [UIImage imageNamed:title];
        btn.btnTitle.text = title;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        //[Utility createButtonWithTitle:nil titleColor:nil frame:rect setBackgroundImage:imageArray[i] target:self action:];
        
        btn.tag = i + MyTAG;
        [self addSubview:btn];
        
        //  未读红点
        
        //  如果是正式服则有红点 审核服就不加了
        if (arrayCount > 2) {
            
            if (0 == i) {
                //  上首页
                if (!UserObject(GetOnHome)) {
                    [self addBedeView:btn];
                }
            }else if (1 == i){
                //  邀请好友
                if (!UserObject(InviteFriend)) {
                    [self addBedeView:btn];
                }
                
            }else if (2 == i){
                //  成为贵族
                if (!UserObject(BecomeNobility)) {
                    [self addBedeView:btn];
                }
                
            }else if (3 == i){
                //  玩法攻略
                if (!UserObject(PlayingMethodStrategy)) {
                    [self addBedeView:btn];
                }
            }
        }
        
//        if ([servicedcit[@"tag"] integerValue]) {
//
//            UIImageView * hotImgV = [[UIImageView alloc] init];
//            hotImgV.image = [UIImage imageNamed:@"HomePageHot"];
//            [self addSubview:hotImgV];
//
//            [hotImgV mas_makeConstraints:^(MASConstraintMaker *make) {
//
//                make.top.equalTo(btn.mas_top).mas_offset(-4);
//                make.left.equalTo(btn.mas_centerX).mas_offset(8);
//                make.width.mas_equalTo(15);
//                make.height.mas_equalTo(18);
//            }];
//        }
    }
}

-(void)addBedeView:(HeadBtn*)btn{
    
    UIView * bedgeView = [[UIView alloc]init];
    [btn addSubview:bedgeView];
    bedgeView.backgroundColor = [Utility colorWithHexString:@"FF0F1A" alpha:1.0];
    bedgeView.layer.masksToBounds = YES;
    bedgeView.layer.cornerRadius = 5.0;
    [bedgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(btn.mas_top);
        make.left.mas_equalTo(btn.mas_centerX).mas_offset(ScaleWidth(37/2.0));
        make.width.height.mas_equalTo(10.0);
        
//         make.left.equalTo(btn.mas_centerX).mas_offset(8)
        
    }];
    
    NSLog(@"%@",NSStringFromCGRect(bedgeView.frame));
    
}



- (void)btnClick:(UIButton *)btn{
    
    NSInteger index = btn.tag - MyTAG;
    
    //  点击某个Bt让红点移除
    if ( 0 ==  index) {
        //  把数据添加 下次显示就不显示红点了
        UserSetObject(@"1", GetOnHome);
        
        for (UIView * tagV in [btn subviews]) {
            [tagV removeFromSuperview];
        }
    }else if (1 == index){
        
        UserSetObject(@"1", InviteFriend);
        
        for (UIView * tagV in [btn subviews]) {
            [tagV removeFromSuperview];
        }
        
    }else if (2 == index){
        
        UserSetObject(@"1", BecomeNobility);
        
        for (UIView * tagV in [btn subviews]) {
            [tagV removeFromSuperview];
        }
        
    }else if (3 == index){
        
        UserSetObject(@"1", PlayingMethodStrategy);
        
        for (UIView * tagV in [btn subviews]) {
            [tagV removeFromSuperview];
        }
    }
    
    self.buttonClick(index);
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
