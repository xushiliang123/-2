#import "MY_TTLFacePhotoTableViewCell+Llslog.h"
@implementation MY_TTLFacePhotoTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setAsset:(id)asset llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
