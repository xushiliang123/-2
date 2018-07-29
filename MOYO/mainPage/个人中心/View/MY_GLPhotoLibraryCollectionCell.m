//
//  MY_GLPhotoLibraryCollectionCell.m
//  VTIME
//
//  Created by gll on 2017/9/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLPhotoLibraryCollectionCell.h"

@implementation MY_GLPhotoLibraryCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.photoImageView.backgroundColor = [UIColor whiteColor];
    self.photoImageView.contentMode = UIViewContentModeScaleAspectFill;//UIViewContentModeScaleAspectFit;
    self.photoImageView.clipsToBounds = YES;
    
//  
    
}

@end
