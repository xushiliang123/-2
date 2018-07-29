//
//  MY_XTSubjectTableViewCell.h
//  VTIME
//
//  Created by tingting on 2017/11/8.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  delegateColl <NSObject>


-(void)ClickCooRow :(int)CellRow;
-(void)tableCellButtonDidSelected:(UIButton *)button;

@end

@interface MY_XTSubjectTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSArray *subImgArr;
@property (strong, nonatomic) NSArray *subNameArr;
@property (nonatomic, strong) UIButton *lastSelectedButton;

@property (weak, nonatomic) IBOutlet UICollectionView *SubjectCollectionView;

@property (weak, nonatomic) id <delegateColl> delegateColl;

@end
