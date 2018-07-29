#import "BaseViewController.h"
#import "CounterMarkViewController.h"
#import "CounterMarkCollectionCell.h" // CollectionCell
#import "AttributeMarkLabel.h"// custom label
#import "MY_LYLoginViewController.h"
#import "MY_LYHomePageViewController.h"
#import "MY_TTLEditInfoViewController.h"
#import "MY_GLEditMyInfoViewController.h"
#import "SystemMarkModel.h"//标签

@interface CounterMarkViewController (Llslog)
- (void)hidesBottomBarWhenPushedLlslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)loadUILlslog:(NSString *)llslog;
- (void)bottomButtonViewLlslog:(NSString *)llslog;
- (void)makeSureOrCancelClickMethod:(UIButton*)sender llslog:(NSString *)llslog;
- (void)backClicksssLlslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog;
- (void)ObjectTojsonString:(id)object llslog:(NSString *)llslog;
- (void)assembleMarkToString:(NSArray *)arr llslog:(NSString *)llslog;
- (void)postOfDataRequestLlslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)numberOfSectionsInCollectionView:(UICollectionView *)collectionView llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView
          viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)dataAryLlslog:(NSString *)llslog;
- (void)selectedMarkAryLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
