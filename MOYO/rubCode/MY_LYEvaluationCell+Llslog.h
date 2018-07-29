#import <UIKit/UIKit.h>
#import "MY_LYEvaluationCell.h"
#import "XCRatingBar.h"

@interface MY_LYEvaluationCell (Llslog)
+ (void)cellWithTableView:(UITableView *)tableVeiw llslog:(NSString *)llslog;
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog;
- (void)setRating:(CGFloat)rating llslog:(NSString *)llslog;
- (void)ratingChanged:(float)newRating viewTag:(NSInteger)tag llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;

@end
