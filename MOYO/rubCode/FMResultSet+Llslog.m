#import "FMResultSet+Llslog.h"
@implementation FMResultSet (Llslog)
+ (void)resultSetWithStatement:(FMStatement *)statement usingParentDatabase:(FMDatabase*)aDB llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)finalizeLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deallocLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)closeLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)columnCountLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)columnNameToIndexMapLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)kvcMagic:(id)object llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)resultDictLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)resultDictionaryLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)nextLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)nextWithError:(NSError **)outErr llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hasAnotherRowLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)columnIndexForName:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)intForColumn:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)intForColumnIndex:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)longForColumn:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)longForColumnIndex:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)longLongIntForColumn:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)longLongIntForColumnIndex:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)unsignedLongLongIntForColumn:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)unsignedLongLongIntForColumnIndex:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)boolForColumn:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)boolForColumnIndex:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)doubleForColumn:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)doubleForColumnIndex:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)stringForColumnIndex:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)stringForColumn:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)dateForColumn:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)dateForColumnIndex:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)dataForColumn:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)dataForColumnIndex:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)dataNoCopyForColumn:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)dataNoCopyForColumnIndex:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)columnIndexIsNull:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)columnIsNull:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)UTF8StringForColumnIndex:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)UTF8StringForColumn:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)UTF8StringForColumnName:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)objectForColumnIndex:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)objectForColumnName:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)objectForColumn:(NSString*)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)columnNameForIndex:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)objectAtIndexedSubscript:(int)columnIdx llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)objectForKeyedSubscript:(NSString *)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
