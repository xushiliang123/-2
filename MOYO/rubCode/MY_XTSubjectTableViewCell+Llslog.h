#import <UIKit/UIKit.h>
#import "MY_XTSubjectTableViewCell.h"
#import "MY_XTSubjectCollectionViewCell.h"

@interface MY_XTSubjectTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)numberOfSectionsInCollectionView:(UICollectionView *)collectionView llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)deviceButtonPressed:(id)sender llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)selectItemAtIndexPath:(nullable NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UICollectionViewScrollPosition)scrollPosition llslog:(NSString *)llslog;
- (void)getHomeArray:(NSArray *)homeArray llslog:(NSString *)llslog;

@end
