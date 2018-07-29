#import <Foundation/Foundation.h>
#import "FMResultSet.h"
#import "FMDatabase.h"
#import "unistd.h"
#import <sqlite3.h>

@interface FMResultSet (Llslog)
+ (void)resultSetWithStatement:(FMStatement *)statement usingParentDatabase:(FMDatabase*)aDB llslog:(NSString *)llslog;
- (void)finalizeLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)closeLlslog:(NSString *)llslog;
- (void)columnCountLlslog:(NSString *)llslog;
- (void)columnNameToIndexMapLlslog:(NSString *)llslog;
- (void)kvcMagic:(id)object llslog:(NSString *)llslog;
- (void)resultDictLlslog:(NSString *)llslog;
- (void)resultDictionaryLlslog:(NSString *)llslog;
- (void)nextLlslog:(NSString *)llslog;
- (void)nextWithError:(NSError **)outErr llslog:(NSString *)llslog;
- (void)hasAnotherRowLlslog:(NSString *)llslog;
- (void)columnIndexForName:(NSString*)columnName llslog:(NSString *)llslog;
- (void)intForColumn:(NSString*)columnName llslog:(NSString *)llslog;
- (void)intForColumnIndex:(int)columnIdx llslog:(NSString *)llslog;
- (void)longForColumn:(NSString*)columnName llslog:(NSString *)llslog;
- (void)longForColumnIndex:(int)columnIdx llslog:(NSString *)llslog;
- (void)longLongIntForColumn:(NSString*)columnName llslog:(NSString *)llslog;
- (void)longLongIntForColumnIndex:(int)columnIdx llslog:(NSString *)llslog;
- (void)unsignedLongLongIntForColumn:(NSString*)columnName llslog:(NSString *)llslog;
- (void)unsignedLongLongIntForColumnIndex:(int)columnIdx llslog:(NSString *)llslog;
- (void)boolForColumn:(NSString*)columnName llslog:(NSString *)llslog;
- (void)boolForColumnIndex:(int)columnIdx llslog:(NSString *)llslog;
- (void)doubleForColumn:(NSString*)columnName llslog:(NSString *)llslog;
- (void)doubleForColumnIndex:(int)columnIdx llslog:(NSString *)llslog;
- (void)stringForColumnIndex:(int)columnIdx llslog:(NSString *)llslog;
- (void)stringForColumn:(NSString*)columnName llslog:(NSString *)llslog;
- (void)dateForColumn:(NSString*)columnName llslog:(NSString *)llslog;
- (void)dateForColumnIndex:(int)columnIdx llslog:(NSString *)llslog;
- (void)dataForColumn:(NSString*)columnName llslog:(NSString *)llslog;
- (void)dataForColumnIndex:(int)columnIdx llslog:(NSString *)llslog;
- (void)dataNoCopyForColumn:(NSString*)columnName llslog:(NSString *)llslog;
- (void)dataNoCopyForColumnIndex:(int)columnIdx llslog:(NSString *)llslog;
- (void)columnIndexIsNull:(int)columnIdx llslog:(NSString *)llslog;
- (void)columnIsNull:(NSString*)columnName llslog:(NSString *)llslog;
- (void)UTF8StringForColumnIndex:(int)columnIdx llslog:(NSString *)llslog;
- (void)UTF8StringForColumn:(NSString*)columnName llslog:(NSString *)llslog;
- (void)UTF8StringForColumnName:(NSString*)columnName llslog:(NSString *)llslog;
- (void)objectForColumnIndex:(int)columnIdx llslog:(NSString *)llslog;
- (void)objectForColumnName:(NSString*)columnName llslog:(NSString *)llslog;
- (void)objectForColumn:(NSString*)columnName llslog:(NSString *)llslog;
- (void)columnNameForIndex:(int)columnIdx llslog:(NSString *)llslog;
- (void)objectAtIndexedSubscript:(int)columnIdx llslog:(NSString *)llslog;
- (void)objectForKeyedSubscript:(NSString *)columnName llslog:(NSString *)llslog;

@end
