//
//  CounterMarkCollectionCell.h
//  TogetherLu
//
//  Created by gll on 2017/6/14.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CounterMarkCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *markLabel;
@property (assign,nonatomic)BOOL    isSelectedCell;// ...是否选中

// 选中与非选中状态
-(void)selectedStatusOfCollectionCell:(BOOL)isSelect;

@end
