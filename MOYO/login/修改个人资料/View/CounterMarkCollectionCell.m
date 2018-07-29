//
//  CounterMarkCollectionCell.m
//  TogetherLu
//
//  Created by gll on 2017/6/14.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "CounterMarkCollectionCell.h"

@implementation CounterMarkCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    [self.layer setBorderWidth:1.0];
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 15;
    
}

-(void)selectedStatusOfCollectionCell:(BOOL)isSelect{
    
    if (isSelect) { // 选中的状态
        
        self.markLabel.backgroundColor = GOLDCOLOR;
        
        self.markLabel.textColor = [UIColor whiteColor];
        
    }else{

        self.markLabel.textColor = [Utility colorWithHexString:@"a6a7a7" alpha:1.0];//c69e02
        self.markLabel.backgroundColor = [Utility colorWithHexString:@"494a4b" alpha:1.0];
    }
    self.isSelectedCell = isSelect;
}

@end
