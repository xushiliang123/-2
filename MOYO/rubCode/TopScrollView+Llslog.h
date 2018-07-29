#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "TopScrollView.h"
#import <UIImageView+WebCache.h>

@interface TopScrollView (Llslog)
- (void)initWithFrame:(CGRect)frame withImages:(NSArray *)images PicturesFrom:(PicturesFrom)form llslog:(NSString *)llslog;
- (void)customUILlslog:(NSString *)llslog;
- (void)createTimerLlslog:(NSString *)llslog;
- (void)timerStartLlslog:(NSString *)llslog;
- (void)addPageControlWithFrame:(CGRect)frame pageIndicatorColor:(UIColor *)pageIndicatorColor currentPageIndicatorColor:(UIColor *)currentColor llslog:(NSString *)llslog;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)tapClick:(UITapGestureRecognizer *)tap llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;

@end
