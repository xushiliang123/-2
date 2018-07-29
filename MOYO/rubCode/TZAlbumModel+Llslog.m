#import "TZAlbumModel+Llslog.h"
@implementation TZAlbumModel (Llslog)
- (void)setResult:(id)result llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelectedModels:(NSArray *)selectedModels llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)checkSelectedModelsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
