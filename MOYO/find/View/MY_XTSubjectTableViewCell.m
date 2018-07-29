//
//  MY_XTSubjectTableViewCell.m
//  VTIME
//
//  Created by tingting on 2017/11/8.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTSubjectTableViewCell.h"
#import "MY_XTSubjectCollectionViewCell.h"

@implementation MY_XTSubjectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    self.subImgArr = @[@"tea",@"Ksong",@"drink",@"shopping",@"basketball",@"play",@"card",@"holiday"];
    self.subNameArr = @[@"美食",@"唱K",@"品酒",@"甩手",@"运动",@"游戏",@"棋牌",@"旅游"];
    
    
    UICollectionViewFlowLayout * layout=[UICollectionViewFlowLayout alloc];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.SubjectCollectionView.collectionViewLayout = layout;
    self.SubjectCollectionView.delegate=self;
    self.SubjectCollectionView.dataSource=self;
    self.SubjectCollectionView.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:self.SubjectCollectionView];
    
    
    [self.SubjectCollectionView    registerNib:[UINib nibWithNibName:@"MY_XTSubjectCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MY_XTSubjectCollectionViewCell"];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    HomeModel *HModel = [self.HomeArray objectAtIndex:indexPath.row];
    MY_XTSubjectCollectionViewCell *collcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MY_XTSubjectCollectionViewCell" forIndexPath:indexPath];
    
  
    
    //找到每一个按钮；
    UIButton *deviceImageButton = collcell.SubimgV;
    
    [deviceImageButton addTarget:self action:@selector(deviceButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [collcell SetCollCellDataImg:[self.subImgArr objectAtIndex:indexPath.row]];
    [collcell SetCollCellDataName:[self.subNameArr objectAtIndex:indexPath.row]];
    
    if(indexPath.row == 0)
    {
        collcell.SubimgV.selected = YES;
        self.lastSelectedButton = collcell.SubimgV;
    }
    
    
    return collcell;
}

- (void)deviceButtonPressed:(id)sender{
    
    
    UIView *v = [sender superview];//获取父类view
    MY_XTSubjectCollectionViewCell *cell = (MY_XTSubjectCollectionViewCell *)[v superview];//获取cell
    
    NSIndexPath *indexpath = [self.SubjectCollectionView indexPathForCell:cell];//获取cell对应的indexpath;
    
    //代理传值
    if([self.delegateColl respondsToSelector:@selector(ClickCooRow:)])
    {
        [self.delegateColl ClickCooRow:indexpath.row];
    }
    
    
    if(self.lastSelectedButton!=nil){
        
        self.lastSelectedButton.selected = NO;
        
    }
    self.lastSelectedButton = sender;
    
    
    
}




#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH / 8, 63 * SCREEN_HEIGHT / 667);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
#pragma mark --UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    MY_XTSubjectCollectionViewCell * cell = (MY_XTSubjectCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor whiteColor];
//
//
//
//
//    //代理传值
//    if([self.delegateColl respondsToSelector:@selector(ClickCooRow:)])
//    {
//        [self.delegateColl ClickCooRow:indexPath.row];
//    }
//    //代理传值
//    if([self.delegateColl respondsToSelector:@selector(tableCellButtonDidSelected:)])
//    {
//        [self.delegateColl tableCellButtonDidSelected:cell.SubimgV];
//    }
    
}

- (void)selectItemAtIndexPath:(nullable NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UICollectionViewScrollPosition)scrollPosition
{
    MY_XTSubjectCollectionViewCell * cell = (MY_XTSubjectCollectionViewCell *)[self.SubjectCollectionView cellForItemAtIndexPath:indexPath];
    if(indexPath.row == 0)
    {
        cell.SubimgV.selected = YES;
    }
    
}


//接收数据
-(void)getHomeArray:(NSArray *)homeArray 
{
    self.subImgArr = homeArray;
}

@end
