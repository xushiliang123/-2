#import "XCRatingBar+Llslog.h"
@implementation XCRatingBar (Llslog)
- (void)setImageDeselected:(NSString *)deselectedName halfSelected:(NSString *)halfSelectedName fullSelected:(NSString *)fullSelectedName andDelegate:(id<RatingBarDelegate>)delegate llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)displayRating:(float)rating llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)ratingLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
