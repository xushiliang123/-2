//
//  MY_LLAddressListCell.m
//  VTIME
//
//  Created by Louie on 2017/9/11.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLAddressListCell.h"
#import "MY_LYMessageInfoModel.h"
@implementation MY_LLAddressListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.headIcon.layer.masksToBounds = YES;
    self.headIcon.layer.cornerRadius = 31;
    self.headIcon.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
    [self.headIcon addGestureRecognizer:tap];
    
    self.VImg.hidden = YES;
}


- (void)setModel:(MY_LYPersonInfoModel *)model {
    _model = model;
    
    [self.headIcon sd_setImageWithURL:[NSURL URLWithString:model.headIcon] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageAllowInvalidSSLCertificates];
    
    self.nickName.text = model.nickName;
    
    
    NSMutableString * heightStr = [NSMutableString string];
    if (model.height) {
        [heightStr appendFormat:@"%tdcm", model.height];
        [heightStr appendString:@"  "];
    }
    if (model.constellation) {
        [heightStr appendString:model.constellation];
    }
    
    self.heightLabel.text = heightStr;
    
    NSMutableString * distanceStr = [NSMutableString string];
    
    if (model.distance) {
        [distanceStr appendFormat:@"%.1fkm", [model.distance floatValue]];
    }
    
    if (model.lastLoginTime) {
        [distanceStr appendString:@"|"];
        NSString * timeStr = [Utility onLineShowDateString:model.lastLoginTime];
        
        [distanceStr appendString:timeStr];
    }

    if ([model.secretStatus integerValue] == 0) {//显示距离
        //同一个城市显示距离
        //不在同一个城市显示名称

        __block NSString* strCity = @"";
        NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
        NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
        MY_LYPersonInfoModel *infomodel = arry.firstObject;
        
//         MY_LLPersonInfoModel * infomodel = [[MessageInfoModel sharedManager]loadPersonModelWithID:[USERID integerValue]];
        if (![Utility isBlankString:infomodel.region]) {
            strCity = infomodel.region;
            
            if (![Utility isBlankString:strCity]) {
                if (![Utility isBlankString:model.region] && model.distance != nil) {
                    if ([strCity rangeOfString:model.region].location != NSNotFound) {
                        if (_model.lastLoginTime) {
                            NSString* str = [Utility onLineShowDateString:_model.lastLoginTime];
                            self.distanceLabel.text  = [NSString stringWithFormat:@"%@km|%@",model.distance,str];
                        }
                        else{
                            self.distanceLabel.text  = [NSString stringWithFormat:@"%@km|12:00",model.distance];
                        }
                    }
                    else{
                        if (_model.lastLoginTime) {
                            NSString* str = [Utility onLineShowDateString:_model.lastLoginTime];
                            self.distanceLabel.text  = [NSString stringWithFormat:@"%@|%@",model.region,str];
                        }
                        else{
                            self.distanceLabel.text  = [NSString stringWithFormat:@"%@|12:00",model.region];
                        }
                    }
                }
                else{
                    if (_model.lastLoginTime) {
                        NSString* str = [Utility onLineShowDateString:_model.lastLoginTime];
                        self.distanceLabel.text  = [NSString stringWithFormat:@"%@",str];
                    }
                    else{
                        self.distanceLabel.text  = [NSString stringWithFormat:@"12:00"];
                    }
                }
            }
            else{
                if (_model.lastLoginTime) {
                    NSString* str = [Utility onLineShowDateString:_model.lastLoginTime];
                    self.distanceLabel.text  = [NSString stringWithFormat:@"%@",str];
                }
                else{
                    self.distanceLabel.text = [NSString stringWithFormat:@"12:00"];
                }
            }
        }
        else{
            if (_model.lastLoginTime) {
                NSString* str = [Utility onLineShowDateString:model.lastLoginTime];
                self.distanceLabel.text  = [NSString stringWithFormat:@"隐身|%@",str];
            }
            else{
                self.distanceLabel.text  = [NSString stringWithFormat:@"隐身|12:00"];
            }
        }
        
//        NSString * where = [NSString stringWithFormat:@"userId = %@", USERID];
//
//        [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//
//            if ([dataArray.firstObject isKindOfClass:[MY_LLPersonInfoModel class]]) {
//
//                MY_LLPersonInfoModel * infomodel = dataArray.firstObject;
//
//                    dispatch_async(dispatch_get_main_queue(), ^{
//
//                        if (![Utility isBlankString:infomodel.region]) {
//                            strCity = infomodel.region;
//
//                            if (![Utility isBlankString:strCity]) {
//                                if (![Utility isBlankString:model.region] && model.distance != nil) {
//                                    if ([strCity rangeOfString:model.region].location != NSNotFound) {
//                                        if (_model.lastLoginTime) {
//                                            NSString* str = [Utility onLineShowDateString:_model.lastLoginTime];
//                                            self.distanceLabel.text  = [NSString stringWithFormat:@"%@km|%@",model.distance,str];
//                                        }
//                                        else{
//                                            self.distanceLabel.text  = [NSString stringWithFormat:@"%@km|12:00",model.distance];
//                                        }
//                                    }
//                                    else{
//                                        if (_model.lastLoginTime) {
//                                            NSString* str = [Utility onLineShowDateString:_model.lastLoginTime];
//                                            self.distanceLabel.text  = [NSString stringWithFormat:@"%@|%@",model.region,str];
//                                        }
//                                        else{
//                                            self.distanceLabel.text  = [NSString stringWithFormat:@"%@|12:00",model.region];
//                                        }
//                                    }
//                                }
//                                else{
//                                    if (_model.lastLoginTime) {
//                                        NSString* str = [Utility onLineShowDateString:_model.lastLoginTime];
//                                        self.distanceLabel.text  = [NSString stringWithFormat:@"%@",str];
//                                    }
//                                    else{
//                                        self.distanceLabel.text  = [NSString stringWithFormat:@"12:00"];
//                                    }
//                                }
//                            }
//                            else{
//                                if (_model.lastLoginTime) {
//                                    NSString* str = [Utility onLineShowDateString:_model.lastLoginTime];
//                                    self.distanceLabel.text  = [NSString stringWithFormat:@"%@",str];
//                                }
//                                else{
//                                    self.distanceLabel.text = [NSString stringWithFormat:@"12:00"];
//                                }
//                            }
//                        }
//                        else{
//                            if (_model.lastLoginTime) {
//                                NSString* str = [Utility onLineShowDateString:model.lastLoginTime];
//                                self.distanceLabel.text  = [NSString stringWithFormat:@"隐身|%@",str];
//                            }
//                            else{
//                                self.distanceLabel.text  = [NSString stringWithFormat:@"隐身|12:00"];
//                            }
//                        }
//
//                    });
//            }
//        }];
    }
        
//  是否互相关注
    if (model.isFriend) {
        self.interdependenceImgV.hidden = NO;
    }
    else {
        self.interdependenceImgV.hidden = YES;
    }
    
//    self.distanceLabel.text = distanceStr;
    
    [self.sexView setSex:model.sex age:model.age vip:model.consumptionLevel];
    
    if (model.isAuthen) {
        self.VImg.hidden = NO;
    }
    else {
        self.VImg.hidden = YES;
    }
    
    if(model.nobleLevel)
    {
        self.gztb.hidden = NO;
        self.nickName.textColor = GOLDCOLOR;
    }
    else
    {
        self.gztb.hidden = YES;
    }
    
    
}

- (void)tapGesture {
    
    if (self.headIconGestureBlock) {
        
        self.headIconGestureBlock(self.model);
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
