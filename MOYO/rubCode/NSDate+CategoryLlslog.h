#import <Foundation/Foundation.h>
#import "NSDate+Category.h"
#import "NSDateFormatter+Category.h"
#import "EaseLocalDefine.h"

@interface NSDate (CategoryLlslog)
- (void)timeIntervalDescriptionLlslog:(NSString *)llslog;
- (void)minuteDescriptionLlslog:(NSString *)llslog;
- (void)formattedTimeLlslog:(NSString *)llslog;
- (void)formattedDateDescriptionLlslog:(NSString *)llslog;
- (void)timeIntervalSince1970InMilliSecondLlslog:(NSString *)llslog;
+ (void)dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond llslog:(NSString *)llslog;
+ (void)formattedTimeFromTimeInterval:(long long)time llslog:(NSString *)llslog;
+ (void)dateWithDaysFromNow: (NSInteger) days llslog:(NSString *)llslog;
+ (void)dateWithDaysBeforeNow: (NSInteger) days llslog:(NSString *)llslog;
+ (void)dateTomorrowLlslog:(NSString *)llslog;
+ (void)dateYesterdayLlslog:(NSString *)llslog;
+ (void)dateWithHoursFromNow: (NSInteger) dHours llslog:(NSString *)llslog;
+ (void)dateWithHoursBeforeNow: (NSInteger) dHours llslog:(NSString *)llslog;
+ (void)dateWithMinutesFromNow: (NSInteger) dMinutes llslog:(NSString *)llslog;
+ (void)dateWithMinutesBeforeNow: (NSInteger) dMinutes llslog:(NSString *)llslog;
- (void)isEqualToDateIgnoringTime: (NSDate *) aDate llslog:(NSString *)llslog;
- (void)isTodayLlslog:(NSString *)llslog;
- (void)isTomorrowLlslog:(NSString *)llslog;
- (void)isYesterdayLlslog:(NSString *)llslog;
- (void)isSameWeekAsDate: (NSDate *) aDate llslog:(NSString *)llslog;
- (void)isThisWeekLlslog:(NSString *)llslog;
- (void)isNextWeekLlslog:(NSString *)llslog;
- (void)isLastWeekLlslog:(NSString *)llslog;
- (void)isSameMonthAsDate: (NSDate *) aDate llslog:(NSString *)llslog;
- (void)isThisMonthLlslog:(NSString *)llslog;
- (void)isSameYearAsDate: (NSDate *) aDate llslog:(NSString *)llslog;
- (void)isThisYearLlslog:(NSString *)llslog;
- (void)isNextYearLlslog:(NSString *)llslog;
- (void)isLastYearLlslog:(NSString *)llslog;
- (void)isEarlierThanDate: (NSDate *) aDate llslog:(NSString *)llslog;
- (void)isLaterThanDate: (NSDate *) aDate llslog:(NSString *)llslog;
- (void)isInFutureLlslog:(NSString *)llslog;
- (void)isInPastLlslog:(NSString *)llslog;
- (void)isTypicallyWeekendLlslog:(NSString *)llslog;
- (void)isTypicallyWorkdayLlslog:(NSString *)llslog;
- (void)dateByAddingDays: (NSInteger) dDays llslog:(NSString *)llslog;
- (void)dateBySubtractingDays: (NSInteger) dDays llslog:(NSString *)llslog;
- (void)dateByAddingHours: (NSInteger) dHours llslog:(NSString *)llslog;
- (void)dateBySubtractingHours: (NSInteger) dHours llslog:(NSString *)llslog;
- (void)dateByAddingMinutes: (NSInteger) dMinutes llslog:(NSString *)llslog;
- (void)dateBySubtractingMinutes: (NSInteger) dMinutes llslog:(NSString *)llslog;
- (void)dateAtStartOfDayLlslog:(NSString *)llslog;
- (void)componentsWithOffsetFromDate: (NSDate *) aDate llslog:(NSString *)llslog;
- (void)minutesAfterDate: (NSDate *) aDate llslog:(NSString *)llslog;
- (void)minutesBeforeDate: (NSDate *) aDate llslog:(NSString *)llslog;
- (void)hoursAfterDate: (NSDate *) aDate llslog:(NSString *)llslog;
- (void)hoursBeforeDate: (NSDate *) aDate llslog:(NSString *)llslog;
- (void)daysAfterDate: (NSDate *) aDate llslog:(NSString *)llslog;
- (void)daysBeforeDate: (NSDate *) aDate llslog:(NSString *)llslog;
- (void)distanceInDaysToDate:(NSDate *)anotherDate llslog:(NSString *)llslog;
- (void)nearestHourLlslog:(NSString *)llslog;
- (void)hourLlslog:(NSString *)llslog;
- (void)minuteLlslog:(NSString *)llslog;
- (void)secondsLlslog:(NSString *)llslog;
- (void)dayLlslog:(NSString *)llslog;
- (void)monthLlslog:(NSString *)llslog;
- (void)weekLlslog:(NSString *)llslog;
- (void)weekdayLlslog:(NSString *)llslog;
- (void)yearLlslog:(NSString *)llslog;

@end
