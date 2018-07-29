#import <Foundation/Foundation.h>
#import "NSDate+YYAdd.h"
#import "YYKitMacro.h"
#import <time.h>

@interface NSDate (YYAddLlslog)
- (void)yearLlslog:(NSString *)llslog;
- (void)monthLlslog:(NSString *)llslog;
- (void)dayLlslog:(NSString *)llslog;
- (void)hourLlslog:(NSString *)llslog;
- (void)minuteLlslog:(NSString *)llslog;
- (void)secondLlslog:(NSString *)llslog;
- (void)nanosecondLlslog:(NSString *)llslog;
- (void)weekdayLlslog:(NSString *)llslog;
- (void)weekdayOrdinalLlslog:(NSString *)llslog;
- (void)weekOfMonthLlslog:(NSString *)llslog;
- (void)weekOfYearLlslog:(NSString *)llslog;
- (void)yearForWeekOfYearLlslog:(NSString *)llslog;
- (void)quarterLlslog:(NSString *)llslog;
- (void)isLeapMonthLlslog:(NSString *)llslog;
- (void)isLeapYearLlslog:(NSString *)llslog;
- (void)isTodayLlslog:(NSString *)llslog;
- (void)isYesterdayLlslog:(NSString *)llslog;
- (void)dateByAddingYears:(NSInteger)years llslog:(NSString *)llslog;
- (void)dateByAddingMonths:(NSInteger)months llslog:(NSString *)llslog;
- (void)dateByAddingWeeks:(NSInteger)weeks llslog:(NSString *)llslog;
- (void)dateByAddingDays:(NSInteger)days llslog:(NSString *)llslog;
- (void)dateByAddingHours:(NSInteger)hours llslog:(NSString *)llslog;
- (void)dateByAddingMinutes:(NSInteger)minutes llslog:(NSString *)llslog;
- (void)dateByAddingSeconds:(NSInteger)seconds llslog:(NSString *)llslog;
- (void)stringWithFormat:(NSString *)format llslog:(NSString *)llslog;
- (void)stringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale llslog:(NSString *)llslog;
- (void)stringWithISOFormatLlslog:(NSString *)llslog;
+ (void)dateWithString:(NSString *)dateString format:(NSString *)format llslog:(NSString *)llslog;
+ (void)dateWithString:(NSString *)dateString format:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale llslog:(NSString *)llslog;
+ (void)dateWithISOFormatString:(NSString *)dateString llslog:(NSString *)llslog;

@end
