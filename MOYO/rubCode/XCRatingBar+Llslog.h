#import <UIKit/UIKit.h>
#import "XCRatingBar.h"

@interface XCRatingBar (Llslog)
- (void)setImageDeselected:(NSString *)deselectedName halfSelected:(NSString *)halfSelectedName fullSelected:(NSString *)fullSelectedName andDelegate:(id<RatingBarDelegate>)delegate llslog:(NSString *)llslog;
- (void)displayRating:(float)rating llslog:(NSString *)llslog;
- (void)ratingLlslog:(NSString *)llslog;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;

@end
