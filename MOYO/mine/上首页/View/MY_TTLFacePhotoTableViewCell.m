//
//  MY_TTLFacePhotoTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2016/12/27.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLFacePhotoTableViewCell.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>

@implementation MY_TTLFacePhotoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _labelDetail.font = [UIFont systemFontOfSize:13];
    _labelDetail.textColor = [Utility colorWithHexString:@"999999" alpha:1];
    
    self.imgvIcon.layer.masksToBounds = YES;
    self.imgvIcon.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)setAsset:(id)asset {
    _asset = asset;
    if ([asset isKindOfClass:[PHAsset class]]) {
        PHAsset *phAsset = asset;
    } else if ([asset isKindOfClass:[ALAsset class]]) {
        ALAsset *alAsset = asset;
#pragma clang diagnostic pop
    }
}

@end
