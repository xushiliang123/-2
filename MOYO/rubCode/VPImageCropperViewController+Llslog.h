#import <UIKit/UIKit.h>
#import "VPImageCropperViewController.h"

@interface VPImageCropperViewController (Llslog)
- (void)deallocLlslog:(NSString *)llslog;
- (void)initWithImage:(UIImage *)originalImage cropFrame:(CGRect)cropFrame limitScaleRatio:(NSInteger)limitRatio llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation llslog:(NSString *)llslog;
- (void)initViewLlslog:(NSString *)llslog;
- (void)initControlBtnLlslog:(NSString *)llslog;
- (void)cancel:(id)sender llslog:(NSString *)llslog;
- (void)confirm:(id)sender llslog:(NSString *)llslog;
- (void)overlayClippingLlslog:(NSString *)llslog;
- (void)addGestureRecognizersLlslog:(NSString *)llslog;
- (void)pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer llslog:(NSString *)llslog;
- (void)panView:(UIPanGestureRecognizer *)panGestureRecognizer llslog:(NSString *)llslog;
- (void)handleScaleOverflow:(CGRect)newFrame llslog:(NSString *)llslog;
- (void)handleBorderOverflow:(CGRect)newFrame llslog:(NSString *)llslog;
- (void)getSubImageLlslog:(NSString *)llslog;

@end
