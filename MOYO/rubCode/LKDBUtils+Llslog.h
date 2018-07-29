#import <Foundation/Foundation.h>
#import "LKDBUtils.h"

@interface LKDBUtils (Llslog)
+ (void)getDocumentPathLlslog:(NSString *)llslog;
+ (void)getDirectoryForDocuments:(NSString *)dir llslog:(NSString *)llslog;
+ (void)getPathForDocuments:(NSString *)filename llslog:(NSString *)llslog;
+ (void)getPathForDocuments:(NSString *)filename inDir:(NSString *)dir llslog:(NSString *)llslog;
+ (void)isFileExists:(NSString *)filepath llslog:(NSString *)llslog;
+ (void)deleteWithFilepath:(NSString *)filepath llslog:(NSString *)llslog;
+ (void)getFilenamesWithDir:(NSString *)dir llslog:(NSString *)llslog;
+ (void)checkStringIsEmpty:(NSString *)string llslog:(NSString *)llslog;
+ (void)getTrimStringWithString:(NSString *)string llslog:(NSString *)llslog;
+ (void)getDBDateFormatLlslog:(NSString *)llslog;
+ (void)stringWithDate:(NSDate *)date llslog:(NSString *)llslog;
+ (void)dateWithString:(NSString *)str llslog:(NSString *)llslog;
+ (void)numberFormatterLlslog:(NSString *)llslog;

@end
