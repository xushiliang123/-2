#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TZAssetModel.h"
#import "TZImageManager.h"

@interface TZAssetModel (Llslog)
+ (void)modelWithAsset:(id)asset type:(TZAssetModelMediaType)type llslog:(NSString *)llslog;
+ (void)modelWithAsset:(id)asset type:(TZAssetModelMediaType)type timeLength:(NSString *)timeLength llslog:(NSString *)llslog;

@end
