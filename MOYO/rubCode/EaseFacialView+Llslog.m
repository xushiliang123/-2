#import "EaseFacialView+Llslog.h"
@implementation EaseFacialView (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)numberOfSectionsInCollectionView:(UICollectionView *)collectionView llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)didSendEmotion:(EaseEmotion *)emotion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)loadFacialView:(NSArray*)emotionManagers size:(CGSize)size llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)loadFacialViewWithPage:(NSInteger)page llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
