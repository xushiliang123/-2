#import <UIKit/UIKit.h>
#import "TZTestCell.h"
#import "UIView+Layout.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface TZTestCell (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)setAsset:(id)asset llslog:(NSString *)llslog;
- (void)setRow:(NSInteger)row llslog:(NSString *)llslog;
- (void)snapshotViewLlslog:(NSString *)llslog;

@end
