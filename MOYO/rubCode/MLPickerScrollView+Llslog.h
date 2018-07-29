#import <UIKit/UIKit.h>
#import "MLPickerScrollView.h"
#import "MLPickerItem.h"

@interface MLPickerScrollView (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)setUpLlslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)layoutItemsLlslog:(NSString *)llslog;
- (void)reloadDataLlslog:(NSString *)llslog;
- (void)scollToSelectdIndex:(NSInteger)index llslog:(NSString *)llslog;
- (void)setItemAtContentOffset:(CGPoint)offset llslog:(NSString *)llslog;
- (void)scollToItemViewAtIndex:(NSInteger)index animated:(BOOL)animated llslog:(NSString *)llslog;
- (void)setCenterContentOffset:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)selectItemAtIndex:(NSInteger)index llslog:(NSString *)llslog;
- (void)itemInCenterChange:(MLPickerItem*)item llslog:(NSString *)llslog;
- (void)itemInCenterBack:(MLPickerItem*)item llslog:(NSString *)llslog;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate llslog:(NSString *)llslog;

@end
