//
//  TimePickerView.m
//  VTIME
//
//  Created by Allen on 2018/1/26.
//  Copyright © 2018年 MadridLee. All rights reserved.
//

#import "TimePickerView.h"

@interface TimePickerView () <UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIButton      *     _btnBack;
    UIPickerView  *     _pickerView;
    UIButton      *     _cancelBtn;
    
    NSString      *     _dayString;
    NSString      *     _hourString;
    NSString      *     _minuteString;
    
}

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) NSMutableArray *dayArray;
@property (nonatomic, strong) NSMutableArray *hourArray;
@property (nonatomic, strong) NSMutableArray *minuteArray;
@property (nonatomic, strong) NSMutableArray *newHourArray;
@property (nonatomic, strong) NSMutableArray *newMinuteArray;
@property (nonatomic, strong) NSMutableArray *nowHourArray;
@property (nonatomic, strong) NSMutableArray *nowMinuteArray;
@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) NSString *nowString;
@property (nonatomic, strong) NSString *tomorrowString;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end


@implementation TimePickerView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    // 2.设置自身的属性
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [self addGestureRecognizer: tapGesture];
    [self addSubview:self.contentView];
    
    UIView *upView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 46)];
    upView.backgroundColor = [Utility colorWithHexString:@"#F5F5F5" alpha:1.0f];
    [self.contentView addSubview:upView];
    
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 46)];
    [leftBtn setImage:[UIImage imageNamed:@"叉号"] forState:0];
    [leftBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [upView addSubview:leftBtn];
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60, 0, 60, 46)];
    [rightBtn setImage:[UIImage imageNamed:@"对号"] forState:0];
    [rightBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [upView addSubview:rightBtn];
    CGFloat width = SCREEN_WIDTH / self.titleArray.count;
    //  提示文字
    for (NSInteger i  = 0; i < self.titleArray.count; ++i) {
        UILabel * label = [[UILabel alloc] init];
        NSString * title = self.titleArray[i];
        label.frame = CGRectMake(i * width, 50, width, 16);
        label.text = title;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [Utility colorWithHexString:@"#333333" alpha:1.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = 300 + i;
        [self.contentView addSubview:label];
    }
    
    //  选择器
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 176)];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    [self.contentView addSubview:_pickerView];
    
    [self getNowDateFormatter];
    self.hourArray = [NSMutableArray arrayWithArray:self.nowHourArray];
    self.minuteArray = [NSMutableArray arrayWithArray:self.nowMinuteArray];
    _dayString = self.dayArray[0];
    _hourString = self.hourArray[0];
    _minuteString = self.minuteArray[0];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.dayArray.count;
    }else if (component == 1) {
        return self.hourArray.count;
    }else{
        return self.minuteArray.count;
    }
}
// returns width of column and height of row for each component.
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component __TVOS_PROHIBITED
{
    return SCREEN_WIDTH/3;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component __TVOS_PROHIBITED
{
    return 40;
}

//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED // attributed title is favored if both methods are implemented
//{
//    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"11111111"];
//    return str;
//}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view __TVOS_PROHIBITED
{
    UILabel *label = [[UILabel alloc] init];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont systemFontOfSize:14]];
    switch (component) {
        case 0:
            [label setText:self.dayArray[row]];
            break;
        case 1:
            [label setText:self.hourArray[row]];
            break;
        case 2:
            [label setText:self.minuteArray[row]];
            break;
            
        default:
            break;
    }
    
    return label;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED
{
    if (component == 0) {
        if (row == 0) {
            self.hourArray = [NSMutableArray arrayWithArray:self.nowHourArray];
            self.minuteArray = [NSMutableArray arrayWithArray:self.nowMinuteArray];
        }else{
            self.hourArray = [NSMutableArray arrayWithArray:self.newHourArray];
            self.minuteArray = [NSMutableArray arrayWithArray:self.newMinuteArray];
        }
        _dayString = self.dayArray[row];
        _hourString = self.hourArray[0];
        _minuteString = self.minuteArray[0];
        [pickerView reloadComponent:1];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }else if(component == 1){
        if (row == 0 && [_dayString isEqualToString:self.dayArray[0]]) {
            self.minuteArray = [NSMutableArray arrayWithArray:self.nowMinuteArray];
        }else{
            self.minuteArray = [NSMutableArray arrayWithArray:self.newMinuteArray];
        }
        _hourString = self.hourArray[row];
        _minuteString = self.minuteArray[0];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }else{
        _minuteString = self.minuteArray[row];
    }
}

//获取当前时间
- (void)getNowDateFormatter
{
    NSDate * date = [NSDate date];
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd HH:mm";
    self.nowString = [NSMutableString stringWithFormat:@"%@", [format stringFromDate:date]];
}
//传入今天的时间，返回明天的时间
- (NSString *)GetTomorrowDay {
    NSDate * date = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    [components setDay:([components day]+1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"yyyy-MM-dd"];
    return [dateday stringFromDate:beginningOfWeek];
}
- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    CGRect frameContent =  self.contentView.frame;
    frameContent.origin.y -= self.contentView.frame.size.height;
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        self.contentView.frame = frameContent;
    } completion:^(BOOL finished) {
    }];
}

- (void)hide
{
    CGRect frameContent =  self.contentView.frame;
    frameContent.origin.y += self.contentView.frame.size.height;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        self.contentView.frame = frameContent;
    } completion:^(BOOL finished) {
        NSString *time ;
        if ([_dayString isEqualToString:self.dayArray[0]]) {
            time = [self.nowString substringToIndex:11];
        }else{
            time = [self GetTomorrowDay];
        }
        NSString *nowTime = [NSString stringWithFormat:@"%@ %@:%@",time,_hourString,_minuteString];
        NSString *showTime = [NSString stringWithFormat:@"%@ %@:%@",_dayString,_hourString,_minuteString];
        if (self.timeBlbck) {
            self.timeBlbck(nowTime, showTime);
        }
        [self removeFromSuperview];
    }];
}

#pragma mark --  数据 --

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 237)];
        [_contentView setBackgroundColor:[UIColor whiteColor]];
    }
    return _contentView;
}


- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"日期",@"时",@"分"];
    }
    return _titleArray;
}

- (NSMutableArray *)dayArray
{
    if (!_dayArray) {
        _dayArray = [NSMutableArray array];
        [_dayArray addObject:@"今天"];
        [_dayArray addObject:@"明天"];
    }
    return _dayArray;
}
- (NSMutableArray *)newHourArray
{
    if (!_newHourArray) {
        _newHourArray = [NSMutableArray array];
        NSInteger hour = 0;
        while (hour++ < 24) {
            [_newHourArray addObject:[NSString stringWithFormat:@"%02ld", (long)hour - 1]];
        }
    }
    return _newHourArray;
}
- (NSMutableArray *)newMinuteArray
{
    if (!_newMinuteArray) {
        _newMinuteArray = [NSMutableArray array];
        NSInteger minute = 0;
        while (minute++ < 60) {
            [_newMinuteArray addObject:[NSString stringWithFormat:@"%02ld", (long)minute - 1]];
        }
    }
    return _newMinuteArray;
}

- (NSMutableArray *)nowHourArray
{
    if (!_nowHourArray) {
        _nowHourArray = [NSMutableArray array];
        NSRange hourRange = {11, 2};
        NSString * hourStr = [self.nowString substringWithRange:hourRange];
        NSRange minuteRange = {14, 2};
        NSString * minuteStr = [self.nowString substringWithRange:minuteRange];
        NSInteger hourString = [hourStr integerValue];
        NSInteger minuteString = [minuteStr integerValue] + 10;
        if (minuteString >=60) {
            minuteString -= 60;
            hourString += 1;
        }
        if (hourString == 24) {
            hourString = 0;
        }
        while (hourString++ < 24) {
            [_nowHourArray addObject:[NSString stringWithFormat:@"%02ld", (long)hourString - 1]];
        }
    }
    return _nowHourArray;
}
- (NSMutableArray *)nowMinuteArray
{
    if (!_nowMinuteArray) {
        _nowMinuteArray = [NSMutableArray array];
        NSRange minuteRange = {14, 2};
        NSString * minuteStr = [self.nowString substringWithRange:minuteRange];
        NSInteger minuteString = [minuteStr integerValue] + 10;
        if (minuteString >=60) {
            minuteString -= 60;
        }
        while (minuteString++ < 60) {
            [_nowMinuteArray addObject:[NSString stringWithFormat:@"%02ld", (long)minuteString - 1]];
        }
    }
    return _nowMinuteArray;
}

@end
