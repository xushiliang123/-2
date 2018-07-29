#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TZAssetModel.h"
#import "TZImageManager.h"

@interface TZAlbumModel (Llslog)
- (void)setResult:(id)result llslog:(NSString *)llslog;
- (void)setSelectedModels:(NSArray *)selectedModels llslog:(NSString *)llslog;
- (void)checkSelectedModelsLlslog:(NSString *)llslog;

@end
