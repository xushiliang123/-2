#import <UIKit/UIKit.h>
#import "MLPickerScrollView.h"
#import "MLPickerItem.h"
#import "MLPickerScrollView+Llslog.h"

@interface MLPickerScrollView (LlslogLlslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setUpLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)layoutItemsLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)reloadDataLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)scollToSelectdIndex:(NSInteger)index llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setItemAtContentOffset:(CGPoint)offset llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)scollToItemViewAtIndex:(NSInteger)index animated:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setCenterContentOffset:(UIScrollView *)scrollView llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)selectItemAtIndex:(NSInteger)index llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)itemInCenterChange:(MLPickerItem*)item llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)itemInCenterBack:(MLPickerItem*)item llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
