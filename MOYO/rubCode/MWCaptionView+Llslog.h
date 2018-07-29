#import <UIKit/UIKit.h>
#import "MWPhotoProtocol.h"
#import "MWCommon.h"
#import "MWCaptionView.h"
#import "MWPhoto.h"

@interface MWCaptionView (Llslog)
- (void)initWithPhoto:(id<MWPhoto>)photo llslog:(NSString *)llslog;
- (void)sizeThatFits:(CGSize)size llslog:(NSString *)llslog;
- (void)setupCaptionLlslog:(NSString *)llslog;

@end
