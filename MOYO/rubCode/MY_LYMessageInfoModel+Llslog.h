#import "BaseModel.h"
#import "MY_LYPersonInfoModel.h"
#import "MY_LYMessageInfoModel.h"

@interface MY_LYMessageInfoModel (Llslog)
+ (void)sharedManagerLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)addDictionaryWithValue:(id)value key:(NSString *)key llslog:(NSString *)llslog;
- (void)msgDictLlslog:(NSString *)llslog;
- (void)setPersonModelArray:(NSArray *)modelArray llslog:(NSString *)llslog;
- (void)modelArrayLlslog:(NSString *)llslog;
- (void)loadPersonModelWithID:(NSInteger)userId llslog:(NSString *)llslog;
- (void)insertModelWith:(MY_LYPersonInfoModel*)pinfmodel llslog:(NSString *)llslog;

@end
