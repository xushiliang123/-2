//
//  MY_XTSubjectCollectionViewCell.h
//  VTIME
//
//  Created by tingting on 2017/11/7.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_XTSubjectCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *SubimgV;
@property (weak, nonatomic) IBOutlet UILabel *SubNameLabel;

-(void)SetCollCellDataImg :(NSString *)subImgv;
-(void)SetCollCellDataName :(NSString *)subName;

@end
