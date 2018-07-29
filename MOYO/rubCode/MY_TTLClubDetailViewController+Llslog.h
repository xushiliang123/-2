#import "BaseViewController.h"
#import "MY_TTLClubDetailViewController.h"
#import "MY_TTLClubDetHeaderCollectionViewCell.h"
#import "MY_TTLClubDetailMemberCollectionViewCell.h"
#import "MY_LLClubsReportViewController.h"
#import "MY_LLClubsManagerViewController.h"
#import "MY_LLAddNewViewController.h"
#import "MY_TTLSelfCenterViewController.h"
#import "MY_GLClubUserModel.h"

@interface MY_TTLClubDetailViewController (Llslog)
- (void)hidesBottomBarWhenPushedLlslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)UpdateUILlslog:(NSString *)llslog;
- (void)joinCreateLlslog:(NSString *)llslog;
- (void)joinClickLlslog:(NSString *)llslog;
- (void)setBtnClickLlslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing llslog:(NSString *)llslog;
- (void)numberOfSectionsInCollectionView:(UICollectionView *)collectionView llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog;
- (void)ClubInfoDicLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
