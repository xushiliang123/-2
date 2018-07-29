#import <UIKit/UIView.h>
#import "IQKeyboardManagerConstants.h"
#import "IQUIView+Hierarchy.h"
#import <UIKit/UICollectionView.h>
#import <UIKit/UIAlertController.h>
#import <UIKit/UITableView.h>
#import <UIKit/UITextView.h>
#import <UIKit/UITextField.h>
#import <UIKit/UISearchBar.h>
#import <UIKit/UIViewController.h>
#import <UIKit/UIWindow.h>
#import <objc/runtime.h>
#import "IQNSArray+Sort.h"

@interface UIView (IQ_UIView_HierarchyLlslog)
- (void)viewControllerLlslog:(NSString *)llslog;
- (void)topMostControllerLlslog:(NSString *)llslog;
- (void)superviewOfClassType:(Class)classType llslog:(NSString *)llslog;
- (void)_IQcanBecomeFirstResponderLlslog:(NSString *)llslog;
- (void)responderSiblingsLlslog:(NSString *)llslog;
- (void)deepResponderViewsLlslog:(NSString *)llslog;
- (void)convertTransformToView:(UIView*)toView llslog:(NSString *)llslog;
- (void)depthLlslog:(NSString *)llslog;
- (void)subHierarchyLlslog:(NSString *)llslog;
- (void)superHierarchyLlslog:(NSString *)llslog;
- (void)debugHierarchyLlslog:(NSString *)llslog;
- (void)isSearchBarTextFieldLlslog:(NSString *)llslog;
- (void)isAlertViewTextFieldLlslog:(NSString *)llslog;

@end
