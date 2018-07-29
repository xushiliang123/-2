#import <UIKit/UIKit.h>
#import "MWPhoto.h"
#import "MWGridViewController.h"
#import <DACircularProgress/DACircularProgressView.h>
#import "MWGridCell.h"
#import "MWCommon.h"
#import "MWPhotoBrowserPrivate.h"
#import "UIImage+MWPhotoBrowser.h"

@interface MWGridCell (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)setGridController:(MWGridViewController *)gridController llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)prepareForReuseLlslog:(NSString *)llslog;
- (void)setPhoto:(id <MWPhoto>)photo llslog:(NSString *)llslog;
- (void)displayImageLlslog:(NSString *)llslog;
- (void)setSelectionMode:(BOOL)selectionMode llslog:(NSString *)llslog;
- (void)setIsSelected:(BOOL)isSelected llslog:(NSString *)llslog;
- (void)selectionButtonPressedLlslog:(NSString *)llslog;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)hideLoadingIndicatorLlslog:(NSString *)llslog;
- (void)showLoadingIndicatorLlslog:(NSString *)llslog;
- (void)showImageFailureLlslog:(NSString *)llslog;
- (void)hideImageFailureLlslog:(NSString *)llslog;
- (void)setProgressFromNotification:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)handleMWPhotoLoadingDidEndNotification:(NSNotification *)notification llslog:(NSString *)llslog;

@end
