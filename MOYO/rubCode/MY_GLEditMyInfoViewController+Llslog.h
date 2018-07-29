#import "BaseViewController.h"
#import "MY_GLEditMyInfoViewController.h"
#import "MY_GLSheetView.h"
#import "SXPickPhoto.h"
#import "CounterMarkViewController.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_LYLoginViewController.h"
#import "MY_XTGuideViewController.h"

@interface MY_GLEditMyInfoViewController (Llslog)
- (void)hidesBottomBarWhenPushedLlslog:(NSString *)llslog;
- (void)backLlslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)selectHearderPicker:(UIButton *)sender llslog:(NSString *)llslog;
- (void)commitBtnClickMethod:(UIButton *)sender llslog:(NSString *)llslog;
- (void)selectSexMethod:(UIButton *)sender llslog:(NSString *)llslog;
- (void)editInfoButtonTargetLlslog:(NSString *)llslog;
- (void)imageArray:(NSMutableArray *)array llslog:(NSString *)llslog;
- (void)textFieldShouldReturn:(UITextField *)textField llslog:(NSString *)llslog;
- (void)textFieldDidBeginEditing:(UITextField *)textField llslog:(NSString *)llslog;
- (void)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view llslog:(NSString *)llslog;
- (void)numberOfComponentsInPickerView:(UIPickerView *)pickerView llslog:(NSString *)llslog;
- (void)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component llslog:(NSString *)llslog;
- (void)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component llslog:(NSString *)llslog;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
