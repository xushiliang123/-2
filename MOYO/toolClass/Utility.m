//
//  Utility.m
//  TogetherLu
//
//  Created by Louie on 16/12/15.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "Utility.h"
#import <sys/utsname.h>
@implementation Utility

//  创建UIButton（设置BackgroundImage）
+ (UIButton *)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)color frame:(CGRect)rect setBackgroundImage:(NSString *)imageName target:(id)target action:(SEL)action{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = rect;
    
    if (title.length) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    
    if (color) {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
    
    if (imageName.length) {
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

//  创建UIButton（设置image）
+ (UIButton *)createButtonWithFrame:(CGRect)rect setImage:(NSString *)imageName target:(id)target action:(SEL)action{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = rect;
    
    if (imageName.length) {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

//  创建UILabel
+ (UILabel *)createLabeltitleColor:(UIColor *)color frame:(CGRect)rect BackgroundColor:(UIColor *)bgColor textSize:(NSInteger)textSize{
    
    UILabel * label = [[UILabel alloc] initWithFrame:rect];

    label.font = [UIFont systemFontOfSize:textSize];
    
    if (color) {
        label.textColor = color;
    }
    
    if (bgColor) {
        label.backgroundColor = bgColor;
    }
    
    return label;
}

//  创建UITextField
+ (UITextField *)createTextFieldtextColor:(UIColor *)color frame:(CGRect)rect BackgroundColor:(UIColor *)bgColor placeholder:(NSString *)placeholder{
    
    UITextField * textField = [[UITextField alloc] initWithFrame:rect];
    
    if (placeholder.length) {
        textField.placeholder = placeholder;
    }
    
    if (color) {
        textField.textColor = color;
    }
    
    if (bgColor) {
        textField.backgroundColor = bgColor;
    }
    
    return textField;
}

//  创建图片
+ (UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
    if (imageName) {
        imgView.image = [UIImage imageNamed:imageName];
    }
    return imgView;
}

//计算文字的高度或宽度
+ (CGSize)stringSizeWithString:(NSString *)str textSize:(NSInteger)textSize width:(CGFloat)width height:(CGFloat)height{
    
    CGSize sizeMake = CGSizeZero;
    if (height) {
        
        sizeMake = CGSizeMake(MAXFLOAT, height);
        
    }else if (width){
        
        sizeMake = CGSizeMake(width, MAXFLOAT);
    }
    
    CGSize size = [str boundingRectWithSize:sizeMake options:NSStringDrawingUsesLineFragmentOrigin|
                   NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:textSize]} context:nil].size;
    
    return size;
}
//获得字符串的Size
CGSize GetStringSize(NSString* strText, UIFont *font)
{
    CGSize size = CGSizeZero;
    if (strText)
    {
        size = [strText sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]];
    }
    return size;
}

CGRect GetNSStringRect(NSString* strText,float width)
{
    //    Dbg(@" string =  %@-------------------width = %f",strText,width);
    CGRect bound = [strText boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];

    //    CGRect bound = [strText boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    return bound;
}

//颜色
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//判断各种空
+(BOOL)isBlankString:(NSString *)string{
    if (string == nil|| [string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

//时间显示内容
+(NSString *)getDateDisplayString:(long long) miliSeconds{
    
    NSTimeInterval tempMilli = miliSeconds;
    NSTimeInterval seconds = tempMilli/1000.0;
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:seconds];
    
    NSCalendar *calendar = [ NSCalendar currentCalendar ];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear ;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[ NSDate date]];
    NSDateComponents *myCmps = [calendar components:unit fromDate:myDate];
    
    NSDateFormatter *dateFmt = [[ NSDateFormatter alloc ] init];
        if (nowCmps.year != myCmps.year) {
            dateFmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        } else {
            if (nowCmps.day==myCmps.day) {
//                dateFmt.dateFormat = @"今天 HH:mm:ss";
                dateFmt.dateFormat = @"今天 HH:mm";
            } else if ((nowCmps.day-myCmps.day)==1) {
//                dateFmt.dateFormat = @"昨天 HH:mm:ss";
                dateFmt.dateFormat = @"昨天 HH:mm";
            } else {
//                dateFmt.dateFormat = @"MM-dd HH:mm:ss";
                dateFmt.dateFormat = @"MM-dd HH:mm";
            }
        }
//    dateFmt.dateFormat = @"MM月dd日";
    
    return [dateFmt stringFromDate:myDate];
}
//时间显示内容  月-日
+(NSString *)getDateShowMonthDayString:(long long) miliSeconds{
    
    NSTimeInterval tempMilli = miliSeconds;
    NSTimeInterval seconds = tempMilli/1000.0;
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:seconds];
    
    NSDateFormatter *dateFmt = [[ NSDateFormatter alloc ] init];
    
    dateFmt.dateFormat = @"MM月dd日";
    
    return [dateFmt stringFromDate:myDate];
}
    
//时间显示内容   时：分
+(NSString *)getDateShowHourMinuteString:(long long) miliSeconds{
    
    NSTimeInterval tempMilli = miliSeconds;
    NSTimeInterval seconds = tempMilli/1000.0;
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:seconds];
    
    NSDateFormatter *dateFmt = [[ NSDateFormatter alloc ] init];
    
    dateFmt.dateFormat = @"HH:mm";
    
    return [dateFmt stringFromDate:myDate];
}
    
//时间显示内容  月-日 时：分
+(NSString *)getDateShowMonthDayHourMinuteString:(long long) miliSeconds{
    
    NSTimeInterval tempMilli = miliSeconds;
    NSTimeInterval seconds = tempMilli/1000.0;
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:seconds];

    NSDateFormatter *dateFmt = [[ NSDateFormatter alloc ] init];

    dateFmt.dateFormat = @"MM-dd HH:mm";
    
    return [dateFmt stringFromDate:myDate];
}


//时间显示内容
+ (NSString *)getStringDate:(long long)miliSeconds{
    
    NSTimeInterval tempMilli = miliSeconds;
    NSTimeInterval seconds = tempMilli/1000.0;
    
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSDate * currentDate = [NSDate date];
    
    NSCalendar *calendar = [ NSCalendar currentCalendar];
    int unit = NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear ;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:myDate toDate:currentDate options:NSCalendarWrapComponents];
    
    NSDateFormatter *dateFmt = [[ NSDateFormatter alloc ] init];
    dateFmt.dateFormat = @"yyyy-MM-dd HH:mm";
    NSString * timeStr = [[NSString alloc] init];
//    if (nowCmps.year > 0) {
//        
//        dateFmt.dateFormat = @"yyyy-MM-dd"; // 一年以上
//        timeStr = [dateFmt stringFromDate:myDate];
//        
//    }else{
//        if (nowCmps.day >= 2){
//            dateFmt.dateFormat = @"MM-dd"; // 前两天 - 一年内
//            timeStr = [dateFmt stringFromDate:myDate];
//            
//        }else if (nowCmps.day == 1){
//            dateFmt.dateFormat = @"昨天 HH:mm"; // 昨天
//            timeStr = [dateFmt stringFromDate:myDate];
//            
//        }else if (nowCmps.hour == 0 && nowCmps.minute >0){
//            timeStr = [NSString stringWithFormat:@"%ld分之前",(long)nowCmps.minute];
//            
//        }else if (nowCmps.hour == 0  && nowCmps.minute <= 0){
//            timeStr = @"刚刚";
//            
//        }else if (nowCmps.day == 0){
//            dateFmt.dateFormat = @"HH:mm"; // 一天之内
//            timeStr = [dateFmt stringFromDate:myDate];
//        }
//    }
    
    NSMutableString * myDateStr = [NSMutableString stringWithFormat:@"%@", myDate];
    NSMutableString * curDateStr = [NSMutableString stringWithFormat:@"%@", currentDate];
    
    if (([[curDateStr substringToIndex:4] integerValue]-[[myDateStr substringToIndex:4] integerValue]) > 0) {
        
        dateFmt.dateFormat = @"yyyy-MM-dd"; // 一年以上
        timeStr = [dateFmt stringFromDate:myDate];
        
    } else if ([[curDateStr substringWithRange:NSMakeRange(5, 2)] integerValue] - [[myDateStr substringWithRange:NSMakeRange(5, 2)] integerValue] > 0 || ([[curDateStr substringWithRange:NSMakeRange(8, 2)] integerValue] - [[myDateStr substringWithRange:NSMakeRange(8, 2)] integerValue]) > 1) {
        
        dateFmt.dateFormat = @"MM-dd"; // 前两天 - 一年内
        timeStr = [dateFmt stringFromDate:myDate];
        
    } else if (([[curDateStr substringWithRange:NSMakeRange(8, 2)] integerValue] - [[myDateStr substringWithRange:NSMakeRange(8, 2)] integerValue]) == 1) {
        
        dateFmt.dateFormat = @"昨天 HH:mm"; // 昨天
        timeStr = [dateFmt stringFromDate:myDate];
        
    } else {
        
        if (nowCmps.hour == 0 && nowCmps.minute >0){
            
            timeStr = [NSString stringWithFormat:@"%ld分之前",(long)nowCmps.minute];
            
        }else if (nowCmps.hour == 0  && nowCmps.minute <= 0){
            
            timeStr = @"刚刚";
            
        }else if (nowCmps.day == 0){
            
            dateFmt.dateFormat = @"HH:mm"; // 一天之内
            timeStr = [dateFmt stringFromDate:myDate];
        }
    }
    return timeStr;
}

+(NSString *)dyanmaicShowDateString:(long long) miliSeconds{
    
    NSTimeInterval tempMilli = miliSeconds;
    NSTimeInterval seconds = tempMilli/1000.0;
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:seconds];
    
    NSCalendar *calendar = [ NSCalendar currentCalendar ];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear ;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[ NSDate date]];
    NSDateComponents *myCmps = [calendar components:unit fromDate:myDate];
    
    NSDateFormatter *dateFmt = [[ NSDateFormatter alloc ] init];
    if (nowCmps.year != myCmps.year) {
        dateFmt.dateFormat = @"yyyy-MM-dd";
    } else {
        if (nowCmps.month - myCmps.month > 0) {
            dateFmt.dateFormat = @"MM-dd";
        }else{
            if (nowCmps.day==myCmps.day ) {
                dateFmt.dateFormat = @"HH:mm";
            } else if ((nowCmps.day-myCmps.day) >= 1 ) {
                dateFmt.dateFormat = @"MM-dd";
            }
        }
    }
//    dateFmt.dateFormat = @"MM月dd日"; 
    
    return [dateFmt stringFromDate:myDate];
}
+(NSString *)infomationDetailShowDateString:(long long) miliSeconds{
    
    NSTimeInterval tempMilli = miliSeconds;
    NSTimeInterval seconds = tempMilli/1000.0;
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:seconds];
    
    NSCalendar *calendar = [ NSCalendar currentCalendar ];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear ;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[ NSDate date]];
    NSDateComponents *myCmps = [calendar components:unit fromDate:myDate];
    
    NSDateFormatter *dateFmt = [[ NSDateFormatter alloc ] init];
    if (nowCmps.year != myCmps.year) {
        dateFmt.dateFormat = @"yyyy-MM-dd";
    } else {
        if (nowCmps.day==myCmps.day) {
            dateFmt.dateFormat = @"HH:mm";
        } else if ((nowCmps.day-myCmps.day)>=1) {
            dateFmt.dateFormat = @"MM-dd HH:mm";
        }
    }
    //    dateFmt.dateFormat = @"MM月dd日";
    
    return [dateFmt stringFromDate:myDate];
}

+ (NSString*)getOvertime:(NSNumber *)mNum
{
    long msec = [mNum longLongValue];
    if (msec <= 0)
    {
        return @"";
    }
    
    NSInteger d = msec/1000/60/60/24;
    NSInteger h = msec/1000/60/60%24;
    NSInteger  m = msec/1000/60%60;
    
    NSString *_tStr = @"";
    NSString *_dStr = @"";
    NSString *_hStr = @"";
    NSString *_mStr = @"";
    if (d > 0)
    {
        _dStr = [NSString stringWithFormat:@"%ld天",d];
    }
    
    if (h > 0)
    {
        _hStr = [NSString stringWithFormat:@"%ld小时",h];
    }
    if (m > 0)
    {
        _mStr = [NSString stringWithFormat:@"%ld分钟",m];
    }
    
    _tStr = [NSString stringWithFormat:@"%@%@%@",_dStr,_hStr,_mStr];
    
    return _tStr;
}


//  **********  一个小时内显示为多少分钟前（如2分钟前）；一天内1个小时以上显示为多少小时前（如3小时前），一天以前显示为几天前（如10天前）一天以前一个月以内显示为几天前（如10天前）；一个月以前显示为几月前（如3月前）
+(NSString *)onLineShowDateString:(long long) miliSeconds{
    
    NSTimeInterval tempMilli = miliSeconds;
    NSTimeInterval seconds = tempMilli/1000.0;
    
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSDate * currentDate = [NSDate date];
    
    NSCalendar *calendar = [ NSCalendar currentCalendar];
    int unit = NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear ;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:myDate toDate:currentDate options:NSCalendarWrapComponents];
    
    NSDateFormatter *dateFmt = [[ NSDateFormatter alloc ] init];
    dateFmt.dateFormat = @"yyyy-MM-dd HH:mm";
    NSString * timeStr = [[NSString alloc] init];
//    NSMutableString * myDateStr = [NSMutableString stringWithFormat:@"%@", myDate];
//    NSMutableString * curDateStr = [NSMutableString stringWithFormat:@"%@", currentDate];
//        年
        if (nowCmps.year > 0 ) {
            dateFmt.dateFormat = @"yyyy-MM-dd HH:mm";
            timeStr = [dateFmt stringFromDate:myDate];
        }else{
//        月
        if ( nowCmps.month >0 && nowCmps.year == 0 ) {
            
            timeStr = [NSString stringWithFormat:@"%ld月前",(long)nowCmps.month];
        }else if ( nowCmps.month == 0 && nowCmps.day > 0 ){// 0月 大于0天
//          日
            timeStr = [NSString stringWithFormat:@"%ld天前",(long)nowCmps.day];
        }else if ( nowCmps.day == 0 && nowCmps.hour > 0 ) {// 0天 大于0小时
//            时
            timeStr = [NSString stringWithFormat:@"%ld小时前",(long)nowCmps.hour];
            
        }else if (nowCmps.hour == 0 && nowCmps.minute >0){// 0小时 大于0分钟
//            分
            timeStr = [NSString stringWithFormat:@"%ld分钟前",(long)nowCmps.minute];
            
        }else if (nowCmps.hour == 0  && nowCmps.minute <= 0){//  0分钟
            
            timeStr = @"1分钟前";
        }
    }
    return timeStr;

}
+ (NSDate*)dateFromString:(NSString*)string  formatter:(NSString*)aFormat{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    [formatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [formatter setDateFormat:aFormat];
    NSDate *date = [formatter dateFromString:string];

    return date;
}
+ (NSString *)stringFromDate:(NSDate *)aDate formatter:(NSString *)aFormat{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [formatter setDateFormat:aFormat];
    NSString *dateString = [formatter stringFromDate:aDate];
    
    return dateString;
}
+(NSString *)dateStringAfterlocalDateForYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day Hour:(NSInteger)hour Minute:(NSInteger)minute Second:(NSInteger)second
{
    // 当前日期
    NSDate *localDate = [NSDate date]; // 为伦敦时间
    // 在当前日期时间加上 时间：格里高利历
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *offsetComponent = [[NSDateComponents alloc]init];
    
    if (year) {
        [offsetComponent setYear:year];  // 设置开始时间为当前时间的前x年
    }else{
        [offsetComponent setYear:0];
    }
    
    if (month) {
        [offsetComponent setMonth:month];
    }else{
        [offsetComponent setMonth:0];
    }
    if (day) {
        [offsetComponent setDay:day];
    }else{
        [offsetComponent setDay:0];
    }
    if (hour) {
        [offsetComponent setHour:(hour+8)]; // 中国时区为正八区，未处理为本地，所以+8
    }else{
        [offsetComponent setHour:8];
    }
    if (minute) {
        [offsetComponent setMinute:minute];
    }else{
        [offsetComponent setMinute:0];
    }
    if (second) {
        [offsetComponent setSecond:second];
    }else{
        [offsetComponent setSecond:0];
    }
    // 当前时间后若干时间
    NSDate *minDate = [gregorian dateByAddingComponents:offsetComponent toDate:localDate options:0];
    
    NSString *dateString = [NSString stringWithFormat:@"%@",minDate];
    
    return dateString;
}

//此方法可以获取文件的大小，返回的是单位是KB。
+(CGFloat) getFileSize:(NSString *)path
{
    NSLog(@"%@",path);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    float filesize = -1.0;
    if ([fileManager fileExistsAtPath:path]) {
        NSDictionary *fileDic = [fileManager attributesOfItemAtPath:path error:nil];//获取文件的属性
        unsigned long long size = [[fileDic objectForKey:NSFileSize] longLongValue];
        filesize = 1.0*size/1024;
    }else{
        NSLog(@"找不到文件");
    }
    return filesize;
}


//此方法可以获取视频文件的时长。
+(CGFloat) getVideoLength:(NSURL *)URL
{
    
    AVURLAsset *avUrl = [AVURLAsset assetWithURL:URL];
    CMTime time = [avUrl duration];
    int second = ceil(time.value/time.timescale);
    return second;
}


//根据字符串的实际内容的多少 在固定的宽度和字体的大小，动态的计算出实际的高度
+ (CGFloat)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size{
    /*
     第一个参数: 预设空间 宽度固定  高度预设 一个最大值
     第二个参数: 行间距 如果超出范围是否截断
     第三个参数: 属性字典 可以设置字体大小
     */
    //xxxxxxxxxxxxxxxxxx
    //ghjdgkfgsfgskdgfjk
    //sdhgfsdjkhgfjd
    
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    //返回计算出的行高
    return rect.size.height;
 
}

//固定高度计算宽度
+ (CGFloat)textWidthFromTextString:(NSString *)text height:(CGFloat)textHeight fontSize:(CGFloat)size{
    /*
     第一个参数: 预设空间 宽度固定  高度预设 一个最大值
     第二个参数: 行间距 如果超出范围是否截断
     第三个参数: 属性字典 可以设置字体大小
     */
    //xxxxxxxxxxxxxxxxxx
    //ghjdgkfgsfgskdgfjk
    //sdhgfsdjkhgfjd

    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, textHeight) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    //返回计算出的行高
    return rect.size.width;
}
//判断是否是纯数字
+ (BOOL)isPureNumandCharacters:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}

//判断内容是否全部为空格  yes 全部为空格  no 不是
+ (BOOL) isEmpty:(NSString *) str {
    
    if (!str) {
        return true;
    } else {
        //A character set containing only the whitespace characters space (U+0020) and tab (U+0009) and the newline and nextline characters (U+000A–U+000D, U+0085).
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        //Returns a new string made by removing from both ends of the receiver characters contained in a given character set.
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

//  弹窗取消
+(void)alertViewWithTitle:(NSString *)title withBlockCancle:(void (^)())blockCancle withBlockSure:(void (^)())blockSure withBlock:(void (^)(UIAlertController *))blockOver{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"提示" message:title preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        blockCancle();
    }];
    UIAlertAction* action2=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        blockSure();
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    blockOver(alert);
    
    
}


+ (BOOL)verifyPhoneNumber:(NSString*)phone
{
    phone = [phone stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (phone.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:phone];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:phone];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:phone];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}

+ (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time {
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    NSParameterAssert(asset);
    AVAssetImageGenerator *assetImageGenerator =[[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetImageGenerator.appliesPreferredTrackTransform = YES;
    assetImageGenerator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    
    CGImageRef thumbnailImageRef = NULL;
    CFTimeInterval thumbnailImageTime = time;
    NSError *thumbnailImageGenerationError = nil;
    thumbnailImageRef = [assetImageGenerator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60)actualTime:NULL error:&thumbnailImageGenerationError];
    
    if(!thumbnailImageRef)
        NSLog(@"thumbnailImageGenerationError %@",thumbnailImageGenerationError);
    
    UIImage*thumbnailImage = thumbnailImageRef ? [[UIImage alloc]initWithCGImage: thumbnailImageRef] : nil;
    NSData *imageData = UIImageJPEGRepresentation(thumbnailImage, 0.5);
    UIImage *newImage = [UIImage imageWithData:imageData];
    return newImage;
}

//图片拉伸方法 传入图片的名称
+(UIImage*)userComeInRoom:(NSString*)pictureName{
    
    UIImage * button_image = nil;
    button_image = [UIImage imageNamed:pictureName];
    
    // 设置端盖的值
    CGFloat top     = button_image.size.height  * 0.5;
    CGFloat left    = button_image.size.width   * 0.5;
    CGFloat bottom  = button_image.size.height  * 0.5;
    CGFloat right   = button_image.size.width   * 0.5;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    button_image = [button_image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    //  指定为拉伸模式，伸缩后重新赋值
    return button_image;
}

+(NSString *)getphoneVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

+(NSString *)getPhoneType
{

    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPod1,1"])  return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])  return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])  return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])  return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])  return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])  return @"iPad 1G";
    if ([platform isEqualToString:@"iPad2,1"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])  return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])  return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])  return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad3,1"])  return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])  return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])  return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad4,1"])  return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])  return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])  return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])  return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"])  return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"])  return @"iPad Mini 2G";
    if ([platform isEqualToString:@"i386"])  return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    return platform;

}

+(NSString *)getAppVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

//获取聊天室中 消费等级图标
+(UIImage*)getImgOfConsumptionLevel:(NSString*)imgIndex{
    
    NSString * imgName = @"";
    NSInteger index = [imgIndex integerValue];
    if ( 0 < index && 6 > index ) {
        imgName = @"ChatRoomConsumptionLevel1-5";
    }else if ( 5 < index && 11 > index){
        imgName = @"ChatRoomConsumptionLevel6-10";
        
    }else if ( 10 < index && 16 > index){
        imgName = @"ChatRoomConsumptionLevel11-15";
        
    }else if ( 15 < index && 21 > index){
        imgName = @"ChatRoomConsumptionLevel16-20";
        
    }else if ( 20 < index && 26 > index){
        imgName = @"ChatRoomConsumptionLevel21-25";
        
    }else if ( 25 < index && 31 > index){
        imgName = @"ChatRoomConsumptionLevel26-30";
        
    }else if ( 30 < index && 36 > index){
        imgName = @"ChatRoomConsumptionLevel31-35";
        
    }else if ( 35 < index){
        imgName = @"ChatRoomConsumptionLevel36-40";
        
    }
    
    UIImage * img = [UIImage imageNamed:imgName];
    
    return img;
}
    
//  是否是审核环境
+ (BOOL)isAuditEnvironment {
    
    BOOL isAudit = NO;

    if (VERSION) {
        
        //  获取审核版本号
        NSString * auditVersion = VERSION;
        
        //  获取app版本号
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString * appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        
        if ([auditVersion isEqualToString:appVersion]) {
            isAudit = YES;
        }else {
            isAudit = NO;
        }
    }
    else {
        isAudit = YES;
    }
    
    return isAudit;
}


//单行的
+(CGSize)text:(NSString *)text SizeWithFont:(UIFont*)font{
    
    CGSize textSize = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    textSize = CGSizeMake((int)ceil(textSize.width), (int)ceil(textSize.height));
    return textSize;
}

/**
 根据字体、行数、行间距和constrainedWidth计算多行文本占据的size
 **/
+ (CGSize)text:(NSString *)text textSizeWithFont:(UIFont*)font
             numberOfLines:(NSInteger)numberOfLines
               lineSpacing:(CGFloat)lineSpacing
          constrainedWidth:(CGFloat)constrainedWidth
          isLimitedToLines:(BOOL *)isLimitedToLines{
    
    if (text.length == 0) {
        return CGSizeZero;
    }
    CGFloat oneLineHeight = font.lineHeight;
    CGSize textSize = [text boundingRectWithSize:CGSizeMake(constrainedWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    CGFloat rows = textSize.height / oneLineHeight;
    CGFloat realHeight = oneLineHeight;
    // 0 不限制行数
    if (numberOfLines == 0) {
        if (rows >= 1) {
            realHeight = (rows * oneLineHeight) + (rows - 1) * lineSpacing;
        }
    }else{
        if (rows > numberOfLines) {
            rows = numberOfLines;
            if (isLimitedToLines) {
                *isLimitedToLines = YES;  //被限制
            }
        }
        realHeight = (rows * oneLineHeight) + (rows - 1) * lineSpacing;
    }
    
    return CGSizeMake(ceil(constrainedWidth),ceil(realHeight));
}


UIView* getGradientView(CGRect frame){
    
    UIView * gradientView = [[UIView alloc]initWithFrame:frame];
    gradientView.backgroundColor = [UIColor redColor];
    
    CAGradientLayer* gradientLayer = [CAGradientLayer layer];//设置渐变效果
    
    //self.gradientLayer.borderWidth = 0;
    
    gradientLayer.frame= CGRectMake(0, 0, frame.size.width, frame.size.height);
    
    gradientLayer.colors=@[(__bridge id)[UIColor clearColor].CGColor,
                           
                           (__bridge id)[UIColor blackColor].CGColor];
    
    gradientLayer.startPoint=CGPointMake(0,1);
    
    gradientLayer.endPoint=CGPointMake(0,0);
    
    gradientLayer.locations = @[@(0.6f) ,@(2.0f)];
    
    [gradientView.layer addSublayer:gradientLayer];
    
    return gradientView;
}

+ (UIImage *)circleImage:(UIImage*)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    
    // 0. 加载原有图片
//    UIImage *image = [UIImage imageNamed:icon];
    // 1.创建图片上下文
    CGFloat margin = borderWidth;
    CGSize size = CGSizeMake(image.size.width + margin, image.size.height +margin);
    
    // YES 不透明 NO 透明
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    // 2.绘制大圆
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, size.width, size.height));
    [borderColor set];
    CGContextFillPath(ctx);
    
    // 3.绘制小圆
    CGFloat smallX = margin * 0.5;
    CGFloat smallY = margin * 0.5;
    CGFloat smallW = image.size.width;
    CGFloat smallH = image.size.height;
    CGContextAddEllipseInRect(ctx, CGRectMake(smallX, smallY, smallW, smallH));
    //    [[UIColor greenColor] set];
    //    CGContextFillPath(ctx);
    // 4.指点可用范围, 可用范围的适用范围是在指定之后,也就说在在指定剪切的范围之前绘制的东西不受影响
    CGContextClip(ctx);
    
    // 5.绘图图片
    [image drawInRect:CGRectMake(smallX, smallY, smallW, smallH)];
    
    // 6.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    return newImage;
}

+(UIImage*)createImageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

NSString* GetVipLevel(NSInteger scoreInt){
    if((scoreInt >=0)&&(scoreInt <=10))
    {
        return [NSString stringWithFormat:@"VIP%ld",scoreInt];
    }else if((scoreInt >10)&&(scoreInt <=20))
    {
        return [NSString stringWithFormat:@"VVIP%ld",scoreInt-10];
    }else if((scoreInt >20)&&(scoreInt <=30))
    {
        return [NSString stringWithFormat:@"SVIP%ld",scoreInt-20];
    }
    return @"";
}

NSString* NiBGetVipLevel(NSInteger scoreInt){
    if((scoreInt >=0)&&(scoreInt <=10))
    {
        return [NSString stringWithFormat:@" VIP%ld  ",scoreInt];
    }else if((scoreInt >10)&&(scoreInt <=20))
    {
        return [NSString stringWithFormat:@" VVIP%ld  ",scoreInt-10];
    }else if((scoreInt >20)&&(scoreInt <=30))
    {
        return [NSString stringWithFormat:@" SVIP%ld  ",scoreInt-20];
    }
    return @"";
}


//重定义图像尺寸
UIImage*  ImageResize(UIImage* image,CGSize size)
{
    if (image) {
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return scaledImage;
    }
    return nil;
}

//  解析josn 字符串  json格式字符串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        Dbg(@"json解析失败：%@",err);
        
        return nil;
    }
    return dic;
}

//+ (UIViewController *)currentViewController{
//    UIViewController vc = [UIApplication rootViewController];
//    
//    while (1) {
//        if ([vc isKindOfClass:[UITabBarController class]]) {
//            vc = ((UITabBarController*)vc).selectedViewController;
//        }
//        
//        if ([vc isKindOfClass:[UINavigationController class]]) {
//            vc = ((UINavigationController*)vc).visibleViewController;
//        }
//        
//        if (vc.presentedViewController) {
//            vc = vc.presentedViewController;
//        }else{
//            break;
//        }
//    }
//    
//    return vc;
//}


//  获取H5加载 URL 区分正式和审核
+ (NSString *)getH5Url:(NSString *)baseUrl
{
    NSString * strUrl = nil;
    if ([Utility isAuditEnvironment] == NO) {   // 非审核 就是正式服
        strUrl = [NSString stringWithFormat:@"%@%@",ThirdPartyShareURL,baseUrl];
    }else{
//         审核服
        strUrl = [NSString stringWithFormat:@"%@%@",Auditing,baseUrl];
    }
    return strUrl;
}
//字典转json格式字符串：
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    if (!dic) {
        return nil;
    }
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
//  设置nickName
+ (NSString *)setNickNameWithConversationId:(NSString *)conversationId {
    
    NSString * nickName = nil;
    
    //  昵称
    if ([conversationId isEqualToString:@"tingting1"]) {
        nickName = @"官方公告";
    } else if ([conversationId isEqualToString:@"tingting2"]) {
        nickName = @"收礼记录";
    } else if ([conversationId isEqualToString:@"tingting3"]) {
        nickName = @"订单消息";
    } else if ([conversationId isEqualToString:@"tingting4"]) {
        nickName = @"抢单中心";
    } else if ([conversationId isEqualToString:@"tingting5"]) {
        nickName = @"系统消息";
    } else if ([conversationId isEqualToString:@"tingting6"]) {
        nickName = @"求约申请";
    }else if ([conversationId isEqualToString:@"kefu1"]) {
        nickName = @"客服";
    }else if([conversationId isEqualToString:@"vtimetask"]){
        nickName = @"V任务";
    }
    return nickName;
}
@end
