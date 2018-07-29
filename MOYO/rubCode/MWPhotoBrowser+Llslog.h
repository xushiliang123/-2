#import <UIKit/UIKit.h>
#import "MWPhoto.h"
#import "MWPhotoProtocol.h"
#import "MWCaptionView.h"
#import <QuartzCore/QuartzCore.h>
#import "MWCommon.h"
#import "MWPhotoBrowser.h"
#import "MWPhotoBrowserPrivate.h"
#import "SDImageCache.h"
#import "UIImage+MWPhotoBrowser.h"

@interface MWPhotoBrowser (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initWithDelegate:(id <MWPhotoBrowserDelegate>)delegate llslog:(NSString *)llslog;
- (void)initWithPhotos:(NSArray *)photosArray llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)decoder llslog:(NSString *)llslog;
- (void)_initialisationLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)releaseAllUnderlyingPhotos:(BOOL)preserveCurrent llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)tapHideActionLlslog:(NSString *)llslog;
- (void)performLayoutLlslog:(NSString *)llslog;
- (void)viewDidUnloadLlslog:(NSString *)llslog;
- (void)presentingViewControllerPrefersStatusBarHiddenLlslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)willMoveToParentViewController:(UIViewController *)parent llslog:(NSString *)llslog;
- (void)didMoveToParentViewController:(UIViewController *)parent llslog:(NSString *)llslog;
- (void)setNavBarAppearance:(BOOL)animated llslog:(NSString *)llslog;
- (void)storePreviousNavBarAppearanceLlslog:(NSString *)llslog;
- (void)restorePreviousNavBarAppearance:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillLayoutSubviewsLlslog:(NSString *)llslog;
- (void)layoutVisiblePagesLlslog:(NSString *)llslog;
- (void)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation llslog:(NSString *)llslog;
- (void)supportedInterfaceOrientationsLlslog:(NSString *)llslog;
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration llslog:(NSString *)llslog;
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration llslog:(NSString *)llslog;
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation llslog:(NSString *)llslog;
- (void)currentIndexLlslog:(NSString *)llslog;
- (void)reloadDataLlslog:(NSString *)llslog;
- (void)numberOfPhotosLlslog:(NSString *)llslog;
- (void)photoAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)thumbPhotoAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)captionViewForPhotoAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)photoIsSelectedAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)setPhotoSelected:(BOOL)selected atIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)imageForPhoto:(id<MWPhoto>)photo llslog:(NSString *)llslog;
- (void)loadAdjacentPhotosIfNecessary:(id<MWPhoto>)photo llslog:(NSString *)llslog;
- (void)handleMWPhotoLoadingDidEndNotification:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)tilePagesLlslog:(NSString *)llslog;
- (void)updateVisiblePageStatesLlslog:(NSString *)llslog;
- (void)isDisplayingPageForIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)pageDisplayedAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)pageDisplayingPhoto:(id<MWPhoto>)photo llslog:(NSString *)llslog;
- (void)configurePage:(MWZoomingScrollView *)page forIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)dequeueRecycledPageLlslog:(NSString *)llslog;
- (void)didStartViewingPageAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)frameForPagingScrollViewLlslog:(NSString *)llslog;
- (void)frameForPageAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)contentSizeForPagingScrollViewLlslog:(NSString *)llslog;
- (void)contentOffsetForPageAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)frameForToolbarAtOrientation:(UIInterfaceOrientation)orientation llslog:(NSString *)llslog;
- (void)frameForCaptionView:(MWCaptionView *)captionView atIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)frameForSelectedButton:(UIButton *)selectedButton atIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)frameForPlayButton:(UIButton *)playButton atIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)updateNavigationLlslog:(NSString *)llslog;
- (void)jumpToPageAtIndex:(NSUInteger)index animated:(BOOL)animated llslog:(NSString *)llslog;
- (void)gotoPreviousPageLlslog:(NSString *)llslog;
- (void)gotoNextPageLlslog:(NSString *)llslog;
- (void)showPreviousPhotoAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)showNextPhotoAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)selectedButtonTapped:(id)sender llslog:(NSString *)llslog;
- (void)playButtonTapped:(id)sender llslog:(NSString *)llslog;
- (void)indexForPlayButton:(UIView *)playButton llslog:(NSString *)llslog;
- (void)playVideoAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)_playVideo:(NSURL *)videoURL atPhotoIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)videoFinishedCallback:(NSNotification*)notification llslog:(NSString *)llslog;
- (void)clearCurrentVideoLlslog:(NSString *)llslog;
- (void)setVideoLoadingIndicatorVisible:(BOOL)visible atPageIndex:(NSUInteger)pageIndex llslog:(NSString *)llslog;
- (void)positionVideoLoadingIndicatorLlslog:(NSString *)llslog;
- (void)showGridAnimatedLlslog:(NSString *)llslog;
- (void)showGrid:(BOOL)animated llslog:(NSString *)llslog;
- (void)hideGridLlslog:(NSString *)llslog;
- (void)setControlsHidden:(BOOL)hidden animated:(BOOL)animated permanent:(BOOL)permanent llslog:(NSString *)llslog;
- (void)prefersStatusBarHiddenLlslog:(NSString *)llslog;
- (void)preferredStatusBarStyleLlslog:(NSString *)llslog;
- (void)preferredStatusBarUpdateAnimationLlslog:(NSString *)llslog;
- (void)cancelControlHidingLlslog:(NSString *)llslog;
- (void)hideControlsAfterDelayLlslog:(NSString *)llslog;
- (void)areControlsHiddenLlslog:(NSString *)llslog;
- (void)hideControlsLlslog:(NSString *)llslog;
- (void)showControlsLlslog:(NSString *)llslog;
- (void)toggleControlsLlslog:(NSString *)llslog;
- (void)setCurrentPhotoIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)doneButtonPressed:(id)sender llslog:(NSString *)llslog;
- (void)actionButtonPressed:(id)sender llslog:(NSString *)llslog;
- (void)progressHUDLlslog:(NSString *)llslog;
- (void)showProgressHUDWithMessage:(NSString *)message llslog:(NSString *)llslog;
- (void)hideProgressHUD:(BOOL)animated llslog:(NSString *)llslog;
- (void)showProgressHUDCompleteMessage:(NSString *)message llslog:(NSString *)llslog;

@end
