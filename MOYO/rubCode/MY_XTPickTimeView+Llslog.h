#import <UIKit/UIKit.h>
#import "MY_XTPickTimeView.h"
#import "MLPickerScrollView.h"
#import "MLDemoItem.h"
#import "MLDemoModel.h"
#import "MY_XTItem.h"

@interface MY_XTPickTimeView (Llslog)
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initContentLlslog:(NSString *)llslog;
- (void)showInView:(UIView *)view llslog:(NSString *)llslog;
- (void)disMissViewLlslog:(NSString *)llslog;
- (void)latelyEightTimeLlslog:(NSString *)llslog;
- (void)yesbtnLlslog:(NSString *)llslog;
- (void)numberOfItemAtPickerScrollView:(MLPickerScrollView *)pickerScrollView llslog:(NSString *)llslog;
- (void)pickerScrollView:(MLPickerScrollView *)pickerScrollView itemAtIndex:(NSInteger)index llslog:(NSString *)llslog;
- (void)itemForIndexChange:(MLPickerItem *)item llslog:(NSString *)llslog;
- (void)itemForIndexBack:(MLPickerItem *)item llslog:(NSString *)llslog;

@end
