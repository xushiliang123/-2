//
//  MY_XTSubjectCollectionViewCell.m
//  VTIME
//
//  Created by tingting on 2017/11/7.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTSubjectCollectionViewCell.h"

@implementation MY_XTSubjectCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.SubNameLabel.font = [UIFont systemFontOfSize:9 * SCREEN_HEIGHT / 667];
}

-(void)SetCollCellDataImg :(NSString *)subImgv
{
    [self.SubimgV setImage:[UIImage imageNamed:subImgv] forState:UIControlStateNormal];
    [self.SubimgV setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",subImgv]] forState:UIControlStateSelected];
     [self.SubimgV addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.SubimgV.tag = 100;
}

-(void)SetCollCellDataName :(NSString *)subName
{
    self.SubNameLabel.text = subName;
}

- (void)buttonAction:(UIButton *)button {
    button.selected = !button.selected;
}

@end
