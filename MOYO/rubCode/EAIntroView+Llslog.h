#import <UIKit/UIKit.h>
#import "EARestrictedScrollView.h"
#import "EAIntroPage.h"
#import "EAIntroView.h"

@interface EAIntroView (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame andPages:(NSArray *)pagesArray llslog:(NSString *)llslog;
- (void)applyDefaultsToSelfDuringInitializationWithFrame:(CGRect)frame pages:(NSArray *)pagesArray llslog:(NSString *)llslog;
- (void)applyDefaultsToBackgroundImageView:(UIImageView *)backgroundImageView llslog:(NSString *)llslog;
- (void)makePanelVisibleAtIndex:(NSUInteger)panelIndex llslog:(NSString *)llslog;
- (void)pageForIndex:(NSUInteger)idx llslog:(NSString *)llslog;
- (void)alphaForPageIndex:(NSUInteger)idx llslog:(NSString *)llslog;
- (void)showTitleViewForPage:(NSUInteger)idx llslog:(NSString *)llslog;
- (void)viewForPageIndex:(NSUInteger)idx llslog:(NSString *)llslog;
- (void)bgImageForPage:(NSUInteger)idx llslog:(NSString *)llslog;
- (void)bgColorForPage:(NSUInteger)idx llslog:(NSString *)llslog;
- (void)showPanelAtPageControlLlslog:(NSString *)llslog;
- (void)checkIndexForScrollView:(EARestrictedScrollView *)scrollView llslog:(NSString *)llslog;
- (void)finishIntroductionAndRemoveSelfLlslog:(NSString *)llslog;
- (void)skipIntroductionLlslog:(NSString *)llslog;
- (void)notifyDelegateWithPreviousPage:(NSUInteger)previousPageIndex andCurrentPage:(NSUInteger)currentPageIndex llslog:(NSString *)llslog;
- (void)scrollViewLlslog:(NSString *)llslog;
- (void)visiblePageIndexLlslog:(NSString *)llslog;
- (void)bgImageViewLlslog:(NSString *)llslog;
- (void)pageBgBackLlslog:(NSString *)llslog;
- (void)pageBgFrontLlslog:(NSString *)llslog;
- (void)pageControlLlslog:(NSString *)llslog;
- (void)applyDefaultsToPageControlLlslog:(NSString *)llslog;
- (void)skipButtonLlslog:(NSString *)llslog;
- (void)applyDefaultsToSkipButtonLlslog:(NSString *)llslog;
- (void)footerConstraintsLlslog:(NSString *)llslog;
- (void)titleViewConstraintsLlslog:(NSString *)llslog;
- (void)buildBackgroundImageLlslog:(NSString *)llslog;
- (void)buildScrollViewLlslog:(NSString *)llslog;
- (void)viewForPage:(EAIntroPage *)page atXIndex:(CGFloat)xIndex llslog:(NSString *)llslog;
- (void)appendCloseViewAtXIndex:(CGFloat*)xIndex llslog:(NSString *)llslog;
- (void)removeCloseViewAtXIndex:(CGFloat*)xIndex llslog:(NSString *)llslog;
- (void)buildTitleViewLlslog:(NSString *)llslog;
- (void)buildFooterViewLlslog:(NSString *)llslog;
- (void)scrollViewWillBeginDragging:(EARestrictedScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewDidEndDecelerating:(EARestrictedScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewDidEndScrollingAnimation:(EARestrictedScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewDidScroll:(EARestrictedScrollView *)scrollView llslog:(NSString *)llslog;
- (void)crossDissolveForOffset:(CGFloat)offset llslog:(NSString *)llslog;
- (void)deviceOrientationDidChange:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)setScrollingEnabled:(BOOL)scrollingEnabled llslog:(NSString *)llslog;
- (void)setPages:(NSArray *)pages llslog:(NSString *)llslog;
- (void)setBgImage:(UIImage *)bgImage llslog:(NSString *)llslog;
- (void)setBgViewContentMode:(UIViewContentMode)bgViewContentMode llslog:(NSString *)llslog;
- (void)setSwipeToExit:(BOOL)swipeToExit llslog:(NSString *)llslog;
- (void)setTitleView:(UIView *)titleView llslog:(NSString *)llslog;
- (void)setTitleViewY:(CGFloat)titleViewY llslog:(NSString *)llslog;
- (void)setPageControl:(UIPageControl *)pageControl llslog:(NSString *)llslog;
- (void)setPageControlY:(CGFloat)pageControlY llslog:(NSString *)llslog;
- (void)setSkipButton:(UIButton *)skipButton llslog:(NSString *)llslog;
- (void)setSkipButtonY:(CGFloat)skipButtonY llslog:(NSString *)llslog;
- (void)setSkipButtonSideMargin:(CGFloat)skipButtonSideMargin llslog:(NSString *)llslog;
- (void)setSkipButtonAlignment:(EAViewAlignment)skipButtonAlignment llslog:(NSString *)llslog;
- (void)setShowSkipButtonOnlyOnLastPage:(BOOL)showSkipButtonOnlyOnLastPage llslog:(NSString *)llslog;
- (void)setUseMotionEffects:(BOOL)useMotionEffects llslog:(NSString *)llslog;
- (void)setMotionEffectsRelativeValue:(CGFloat)motionEffectsRelativeValue llslog:(NSString *)llslog;
- (void)addMotionEffectsOnBgLlslog:(NSString *)llslog;
- (void)removeMotionEffectsOnBgLlslog:(NSString *)llslog;
- (void)showFullscreenLlslog:(NSString *)llslog;
- (void)showFullscreenWithAnimateDuration:(CGFloat)duration llslog:(NSString *)llslog;
- (void)showFullscreenWithAnimateDuration:(CGFloat)duration andInitialPageIndex:(NSUInteger)initialPageIndex llslog:(NSString *)llslog;
- (void)showInView:(UIView *)view llslog:(NSString *)llslog;
- (void)showInView:(UIView *)view animateDuration:(CGFloat)duration llslog:(NSString *)llslog;
- (void)showInView:(UIView *)view animateDuration:(CGFloat)duration withInitialPageIndex:(NSUInteger)initialPageIndex llslog:(NSString *)llslog;
- (void)hideWithFadeOutDuration:(CGFloat)duration llslog:(NSString *)llslog;
- (void)setCurrentPageIndex:(NSUInteger)currentPageIndex llslog:(NSString *)llslog;
- (void)setCurrentPageIndex:(NSUInteger)currentPageIndex animated:(BOOL)animated llslog:(NSString *)llslog;
- (void)goToNext:(id)sender llslog:(NSString *)llslog;
- (void)setLimitPageIndex:(NSInteger)limitPageIndex llslog:(NSString *)llslog;

@end
