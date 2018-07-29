#import <Foundation/Foundation.h>
#import "YYKVStorage.h"
#import "UIApplication+YYAdd.h"
#import <UIKit/UIKit.h>
#import <time.h>
#import <sqlite3.h>
#import "sqlite3.h"

@interface YYKVStorageItem (Llslog)
- (void)_dbOpenLlslog:(NSString *)llslog;
- (void)_dbCloseLlslog:(NSString *)llslog;
- (void)_dbCheckLlslog:(NSString *)llslog;
- (void)_dbInitializeLlslog:(NSString *)llslog;
- (void)_dbCheckpointLlslog:(NSString *)llslog;
- (void)_dbExecute:(NSString *)sql llslog:(NSString *)llslog;
- (void)_dbPrepareStmt:(NSString *)sql llslog:(NSString *)llslog;
- (void)_dbJoinedKeys:(NSArray *)keys llslog:(NSString *)llslog;
- (void)_dbBindJoinedKeys:(NSArray *)keys stmt:(sqlite3_stmt *)stmt fromIndex:(int)index llslog:(NSString *)llslog;
- (void)_dbSaveWithKey:(NSString *)key value:(NSData *)value fileName:(NSString *)fileName extendedData:(NSData *)extendedData llslog:(NSString *)llslog;
- (void)_dbUpdateAccessTimeWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)_dbUpdateAccessTimeWithKeys:(NSArray *)keys llslog:(NSString *)llslog;
- (void)_dbDeleteItemWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)_dbDeleteItemWithKeys:(NSArray *)keys llslog:(NSString *)llslog;
- (void)_dbDeleteItemsWithSizeLargerThan:(int)size llslog:(NSString *)llslog;
- (void)_dbDeleteItemsWithTimeEarlierThan:(int)time llslog:(NSString *)llslog;
- (void)_dbGetItemFromStmt:(sqlite3_stmt *)stmt excludeInlineData:(BOOL)excludeInlineData llslog:(NSString *)llslog;
- (void)_dbGetItemWithKey:(NSString *)key excludeInlineData:(BOOL)excludeInlineData llslog:(NSString *)llslog;
- (void)_dbGetItemWithKeys:(NSArray *)keys excludeInlineData:(BOOL)excludeInlineData llslog:(NSString *)llslog;
- (void)_dbGetValueWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)_dbGetFilenameWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)_dbGetFilenameWithKeys:(NSArray *)keys llslog:(NSString *)llslog;
- (void)_dbGetFilenamesWithSizeLargerThan:(int)size llslog:(NSString *)llslog;
- (void)_dbGetFilenamesWithTimeEarlierThan:(int)time llslog:(NSString *)llslog;
- (void)_dbGetItemSizeInfoOrderByTimeAscWithLimit:(int)count llslog:(NSString *)llslog;
- (void)_dbGetItemCountWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)_dbGetTotalItemSizeLlslog:(NSString *)llslog;
- (void)_dbGetTotalItemCountLlslog:(NSString *)llslog;
- (void)_fileWriteWithName:(NSString *)filename data:(NSData *)data llslog:(NSString *)llslog;
- (void)_fileReadWithName:(NSString *)filename llslog:(NSString *)llslog;
- (void)_fileDeleteWithName:(NSString *)filename llslog:(NSString *)llslog;
- (void)_fileMoveAllToTrashLlslog:(NSString *)llslog;
- (void)_fileEmptyTrashInBackgroundLlslog:(NSString *)llslog;
- (void)_resetLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithPath:(NSString *)path type:(YYKVStorageType)type llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)saveItem:(YYKVStorageItem *)item llslog:(NSString *)llslog;
- (void)saveItemWithKey:(NSString *)key value:(NSData *)value llslog:(NSString *)llslog;
- (void)saveItemWithKey:(NSString *)key value:(NSData *)value filename:(NSString *)filename extendedData:(NSData *)extendedData llslog:(NSString *)llslog;
- (void)removeItemForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)removeItemForKeys:(NSArray *)keys llslog:(NSString *)llslog;
- (void)removeItemsLargerThanSize:(int)size llslog:(NSString *)llslog;
- (void)removeItemsEarlierThanTime:(int)time llslog:(NSString *)llslog;
- (void)removeItemsToFitSize:(int)maxSize llslog:(NSString *)llslog;
- (void)removeItemsToFitCount:(int)maxCount llslog:(NSString *)llslog;
- (void)removeAllItemsLlslog:(NSString *)llslog;
- (void)removeAllItemsWithProgressBlock:(void(^)(int removedCount, int totalCount))progress
                               endBlock:(void(^)(BOOL error))end llslog:(NSString *)llslog;
- (void)getItemForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)getItemInfoForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)getItemValueForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)getItemForKeys:(NSArray *)keys llslog:(NSString *)llslog;
- (void)getItemInfoForKeys:(NSArray *)keys llslog:(NSString *)llslog;
- (void)getItemValueForKeys:(NSArray *)keys llslog:(NSString *)llslog;
- (void)itemExistsForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)getItemsCountLlslog:(NSString *)llslog;
- (void)getItemsSizeLlslog:(NSString *)llslog;

@end
