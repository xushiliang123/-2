//
//  Utility.h
//  TogetherLu
//
//  Created by Louie on 16/12/15.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface Utility : NSObject

//  创建UIButton（设置image）
+ (UIButton *)createButtonWithFrame:(CGRect)rect setImage:(NSString *)imageName target:(id)target action:(SEL)action;

//  创建UIButton（设置BackgroundImage）
+ (UIButton *)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)color frame:(CGRect)rect setBackgroundImage:(NSString *)imageName target:(id)target action:(SEL)action;

//  创建UILabel
+ (UILabel *)createLabeltitleColor:(UIColor *)color frame:(CGRect)rect BackgroundColor:(UIColor *)bgColor textSize:(NSInteger)textSize;

//  创建UITextField
+ (UITextField *)createTextFieldtextColor:(UIColor *)color frame:(CGRect)rect BackgroundColor:(UIColor *)bgColor placeholder:(NSString *)placeholder;

//  创建图片
+ (UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName;

// 16进制颜色
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

//计算文字的高度或宽度
+ (CGSize)stringSizeWithString:(NSString *)str textSize:(NSInteger)textSize width:(CGFloat)width height:(CGFloat)height;

//计算单行文字的长度
CGSize GetStringSize(NSString* strText, UIFont *font);

//NSString 高度
CGRect GetNSStringRect(NSString* strText,float width);


//判断各种空,空返回yes,否则为no
+(BOOL)isBlankString:(NSString *)string;

//后台时间转字符串
+(NSString *)getDateDisplayString:(long long) miliSeconds;
+(NSString *)getDateShowMonthDayString:(long long) miliSeconds;
//后台时间转字符串
+(NSString *)getStringDate:(long long) miliSeconds;

//时间显示内容  月-日 时：分
+(NSString *)getDateShowMonthDayHourMinuteString:(long long) miliSeconds;
    //时间显示内容   时：分
+(NSString *)getDateShowHourMinuteString:(long long) miliSeconds;


+ (NSDate*)dateFromString:(NSString*)string  formatter:(NSString*)aFormat;
+ (NSString*)stringFromDate:(NSDate*)aDate formatter:(NSString *)aFormat;
    
//  免费约玩、个人信息-动态列表，达人技能评论时间、发现界面动态时间、发布-求约，信息界面时间、发现界面动态时间、信息界面时间、个人信息-送礼记录、动态详情-送礼记录、动态详情、约玩详情
// ******** 一天内时间显示按24小时制，一天以上时间显示为月-日（如04-07）
+(NSString *)dyanmaicShowDateString:(long long) miliSeconds;


//  信息详情界面新信息上的系统时间   *****一天内时间显示按24小时制，一天以上时间显示为月-日 时分（如04-07 20:20）
+(NSString *)infomationDetailShowDateString:(long long) miliSeconds;

//  获取剩余时间
+ (NSString*)getOvertime:(NSNumber *)mNum;

//  个人信息上线时间、达人技能上线时间、信息-通讯录上线时间
//  **********  一个小时内显示为多少分钟前（如2分钟前）；一天内1个小时以上显示为多少小时前（如3小时前），一天以前显示为几天前（如10天前）一天以前一个月以内显示为几天前（如10天前）；一个月以前显示为几月前（如3月前）
+(NSString *)onLineShowDateString:(long long) miliSeconds;

//计算 距离 当前时间 之前/之后 的一个时间 isLast YES 之前 NO 之后
+(NSString *)dateStringAfterlocalDateForYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day Hour:(NSInteger)hour Minute:(NSInteger)minute Second:(NSInteger)second;

// 获取文件大小
+(CGFloat) getFileSize:(NSString *)path;

//  获取文件时长
+(CGFloat) getVideoLength:(NSURL *)URL;

//  固定宽度，计算高度
+ (CGFloat)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size;

//  固定高度，计算宽度
+ (CGFloat)textWidthFromTextString:(NSString *)text height:(CGFloat)textHeight fontSize:(CGFloat)size;

//判断是否是纯数字
+ (BOOL)isPureNumandCharacters:(NSString *)string;

//判断字符串是否全是空格
+ (BOOL) isEmpty:(NSString *) str;

//  弹窗
+(void)alertViewWithTitle:(NSString *)title withBlockCancle:(void (^)())blockCancle withBlockSure:(void (^)())blockSure withBlock:(void (^)(UIAlertController *))blockOver;

// 判断手机号
+ (BOOL)verifyPhoneNumber:(NSString*)phone;

//获取视频第一帧
+ (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time ;

//图片拉伸方法 传入图片的名称
+(UIImage*)userComeInRoom:(NSString*)pictureName;

//获取手机系统版本
+(NSString *)getphoneVersion;

//获取当前手机机型
+(NSString *)getPhoneType;

//获取当前app版本号
+(NSString *)getAppVersion;
    
//  是否是审核环境
+ (BOOL)isAuditEnvironment;

//获取聊天室中 消费等级图标
+(UIImage*)getImgOfConsumptionLevel:(NSString*)imgIndex;

//单行的
+ (CGSize)text:(NSString *)text SizeWithFont:(UIFont*)font;

/**
 根据字体、行数、行间距和constrainedWidth计算多行文本占据的size
 **/
+(CGSize)text:(NSString *)text textSizeWithFont:(UIFont*)font   numberOfLines:(NSInteger)numberOfLines  lineSpacing:(CGFloat)lineSpacing    constrainedWidth:(CGFloat)constrainedWidth  isLimitedToLines:(BOOL *)isLimitedToLines;

//  返回具有透明图层 颜色渐变的View
UIView* getGradientView(CGRect frame);

// 切圆
+ (UIImage *)circleImage:(UIImage*)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
+(UIImage*)createImageWithColor:(UIColor*)color;
//   数字 转 VIP等级
NSString* GetVipLevel(NSInteger scoreInt);

//  中间有空格的 数字 转 VIP等级
NSString* NiBGetVipLevel(NSInteger scoreInt);

//重定义图像尺寸
UIImage*  ImageResize(UIImage* image,CGSize size);

//  解析josn 字符串
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

//+ (UIViewController*)currentViewController;


//  获取H5加载 URL 区分正式和审核
+ (NSString *)getH5Url:(NSString *)baseUrl;
//字典转json格式字符串：
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

+ (NSString *)setNickNameWithConversationId:(NSString *)conversationId;
@end
