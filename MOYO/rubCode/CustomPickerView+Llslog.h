#import <UIKit/UIKit.h>
#import "PickerModel.h"
#import "CustomPickerView.h"

@interface CustomPickerView (Llslog)
+ (void)initializeLlslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray oldModel:(PickerModel *)oldModel llslog:(NSString *)llslog;
- (void)dismissAlertLlslog:(NSString *)llslog;
- (void)setUIWithTitleArray:(NSArray *)titleArray llslog:(NSString *)llslog;
- (void)showLlslog:(NSString *)llslog;
- (void)appRootViewControllerLlslog:(NSString *)llslog;
- (void)removeFromSuperviewLlslog:(NSString *)llslog;
- (void)willMoveToSuperview:(UIView *)newSuperview llslog:(NSString *)llslog;
- (void)hidePickerViewClick:(UIButton *)btn llslog:(NSString *)llslog;
- (void)setPickerArray:(NSArray *)pickerArray llslog:(NSString *)llslog;
- (void)numberOfComponentsInPickerView:(UIPickerView *)pickerView llslog:(NSString *)llslog;
- (void)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component llslog:(NSString *)llslog;
- (void)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component llslog:(NSString *)llslog;
- (void)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component llslog:(NSString *)llslog;
- (void)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view llslog:(NSString *)llslog;
- (void)setButtonTextFont:(UIFont *)buttonTextFont llslog:(NSString *)llslog;
- (void)setButtonTextColor:(UIColor *)buttonTextColor llslog:(NSString *)llslog;
- (void)setTitleTextFont:(UIFont *)titleTextFont llslog:(NSString *)llslog;
- (void)setTitleTextColor:(UIColor *)titleTextColor llslog:(NSString *)llslog;
- (void)setPickerViewTextFont:(UIFont *)pickerViewTextFont llslog:(NSString *)llslog;
- (void)setPickerViewTextColor:(UIColor *)pickerViewTextColor llslog:(NSString *)llslog;

@end
