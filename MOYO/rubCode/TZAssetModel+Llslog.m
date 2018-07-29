#import "TZAssetModel+Llslog.h"
@implementation TZAssetModel (Llslog)
+ (void)modelWithAsset:(id)asset type:(TZAssetModelMediaType)type llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)modelWithAsset:(id)asset type:(TZAssetModelMediaType)type timeLength:(NSString *)timeLength llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
