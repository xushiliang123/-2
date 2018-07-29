#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Utility.h"
#import <sys/utsname.h>

@interface Utility (Llslog)
+ (void)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)color frame:(CGRect)rect setBackgroundImage:(NSString *)imageName target:(id)target action:(SEL)action llslog:(NSString *)llslog;
+ (void)createButtonWithFrame:(CGRect)rect setImage:(NSString *)imageName target:(id)target action:(SEL)action llslog:(NSString *)llslog;
+ (void)createLabeltitleColor:(UIColor *)color frame:(CGRect)rect BackgroundColor:(UIColor *)bgColor textSize:(NSInteger)textSize llslog:(NSString *)llslog;
+ (void)createTextFieldtextColor:(UIColor *)color frame:(CGRect)rect BackgroundColor:(UIColor *)bgColor placeholder:(NSString *)placeholder llslog:(NSString *)llslog;
+ (void)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName llslog:(NSString *)llslog;
+ (void)stringSizeWithString:(NSString *)str textSize:(NSInteger)textSize width:(CGFloat)width height:(CGFloat)height llslog:(NSString *)llslog;
+ (void)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha llslog:(NSString *)llslog;
+ (void)isBlankString:(NSString *)string llslog:(NSString *)llslog;
+ (void)getDateDisplayString:(long long) miliSeconds llslog:(NSString *)llslog;
+ (void)getDateShowMonthDayString:(long long) miliSeconds llslog:(NSString *)llslog;
+ (void)getDateShowHourMinuteString:(long long) miliSeconds llslog:(NSString *)llslog;
+ (void)getDateShowMonthDayHourMinuteString:(long long) miliSeconds llslog:(NSString *)llslog;
+ (void)getStringDate:(long long)miliSeconds llslog:(NSString *)llslog;
+ (void)dyanmaicShowDateString:(long long) miliSeconds llslog:(NSString *)llslog;
+ (void)infomationDetailShowDateString:(long long) miliSeconds llslog:(NSString *)llslog;
+ (void)getOvertime:(NSNumber *)mNum llslog:(NSString *)llslog;
+ (void)onLineShowDateString:(long long) miliSeconds llslog:(NSString *)llslog;
+ (void)dateFromString:(NSString*)string  formatter:(NSString*)aFormat llslog:(NSString *)llslog;
+ (void)stringFromDate:(NSDate *)aDate formatter:(NSString *)aFormat llslog:(NSString *)llslog;
+ (void)dateStringAfterlocalDateForYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day Hour:(NSInteger)hour Minute:(NSInteger)minute Second:(NSInteger)second llslog:(NSString *)llslog;
+ (void)getFileSize:(NSString *)path llslog:(NSString *)llslog;
+ (void)getVideoLength:(NSURL *)URL llslog:(NSString *)llslog;
+ (void)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size llslog:(NSString *)llslog;
+ (void)textWidthFromTextString:(NSString *)text height:(CGFloat)textHeight fontSize:(CGFloat)size llslog:(NSString *)llslog;
+ (void)isPureNumandCharacters:(NSString *)string llslog:(NSString *)llslog;
+ (void)isEmpty:(NSString *) str llslog:(NSString *)llslog;
+ (void)alertViewWithTitle:(NSString *)title withBlockCancle:(void (^)())blockCancle withBlockSure:(void (^)())blockSure withBlock:(void (^)(UIAlertController *))blockOver llslog:(NSString *)llslog;
+ (void)verifyPhoneNumber:(NSString*)phone llslog:(NSString *)llslog;
+ (void)thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time llslog:(NSString *)llslog;
+ (void)userComeInRoom:(NSString*)pictureName llslog:(NSString *)llslog;
+ (void)getphoneVersionLlslog:(NSString *)llslog;
+ (void)getPhoneTypeLlslog:(NSString *)llslog;
+ (void)getAppVersionLlslog:(NSString *)llslog;
+ (void)getImgOfConsumptionLevel:(NSString*)imgIndex llslog:(NSString *)llslog;
+ (void)isAuditEnvironmentLlslog:(NSString *)llslog;
+ (void)text:(NSString *)text SizeWithFont:(UIFont*)font llslog:(NSString *)llslog;
+ (void)text:(NSString *)text textSizeWithFont:(UIFont*)font
             numberOfLines:(NSInteger)numberOfLines
               lineSpacing:(CGFloat)lineSpacing
          constrainedWidth:(CGFloat)constrainedWidth
          isLimitedToLines:(BOOL *)isLimitedToLines llslog:(NSString *)llslog;
+ (void)circleImage:(UIImage*)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor llslog:(NSString *)llslog;
+ (void)createImageWithColor:(UIColor*)color llslog:(NSString *)llslog;
+ (void)dictionaryWithJsonString:(NSString *)jsonString llslog:(NSString *)llslog;
+ (void)getH5Url:(NSString *)baseUrl llslog:(NSString *)llslog;
+ (void)dictionaryToJson:(NSDictionary *)dic llslog:(NSString *)llslog;
+ (void)setNickNameWithConversationId:(NSString *)conversationId llslog:(NSString *)llslog;

@end
