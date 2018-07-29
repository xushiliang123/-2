//
//  MY_XTPickTimeView.m
//  VTIME
//
//  Created by tingting on 2017/11/9.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTPickTimeView.h"
#import "MLPickerScrollView.h"
#import "MLDemoItem.h"
#import "MLDemoModel.h"
#import "MY_XTItem.h"

@interface MY_XTPickTimeView()<MLPickerScrollViewDataSource,MLPickerScrollViewDelegate>
{
    UIView *_contentView;
    
    MLPickerScrollView *_pickerScollView;
    MLPickerScrollView *_pickerScollView2;
    NSMutableArray *data;
    NSMutableArray *datatime;
    NSMutableArray *Year;
    NSMutableArray *Month;
    NSMutableArray *Day;
    NSMutableArray *datariqi;
}

@property (nonatomic, strong) ButtonBlock block;

@end

@implementation MY_XTPickTimeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame])
    {
        [self initContent];
    }
    
    return self;
}

- (void)initContent
{
    datariqi = [NSMutableArray array];
    datatime = [NSMutableArray array];
    data = [NSMutableArray array];
    
    Year = [NSMutableArray array];
    Month = [NSMutableArray array];
    Day = [NSMutableArray array];
    
    [self latelyEightTime];
    
    NSArray *timeArray = @[@"06:00",@"07:00",@"08:00",@"09:00",@"10:00",@"11:00",@"12:00",@"13:00",@"14:00",@"15:00",@"16:00",@"17:00",@"18:00",@"19:00",@"20:00",@"21:00",@"22:00",@"23:00",@"24:00",@"01:00",@"02:00",@"03:00",@"04:00",@"05:00"];
    
    for (int i = 0; i < Year.count; i++) {
        MLDemoModel *model = [[MLDemoModel alloc] init];
        model.dicountTitle = [data objectAtIndex:i];
        model.dicountMonth = [Month objectAtIndex:i];
        model.dicountDay = [Day objectAtIndex:i];
        model.dicountYear = [Year objectAtIndex:i];
        [datariqi addObject:model];
    }
    
    for (int i = 0; i < timeArray.count; i++) {
        MLDemoModel *model = [[MLDemoModel alloc] init];
        model.dicountTitle = [timeArray objectAtIndex:i];
        [datatime addObject:model];
    }
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    //alpha 0.0  白色   alpha 1 ：黑色   alpha 0～1 ：遮罩颜色，逐渐
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];
    
    if (_contentView == nil)
    {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 247 -64, SCREEN_WIDTH, 247)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 47)];
        view.backgroundColor = [Utility colorWithHexString:@"#F5F5F5" alpha:1.0f];
        [_contentView addSubview:view];
        
        UIButton *_missButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 14, 18, 18)];
        [_missButton setImage:[UIImage imageNamed:@"false"] forState:UIControlStateNormal];
        [_missButton addTarget:self action:@selector(disMissView) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:_missButton];
        
        UIButton *_yesButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 38, 14, 24, 18)];
        [_yesButton setImage:[UIImage imageNamed:@"true"] forState:UIControlStateNormal];
        [_yesButton addTarget:self action:@selector(yesbtn) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:_yesButton];
        
        _pickerScollView = [[MLPickerScrollView alloc] initWithFrame:CGRectMake(0, 47, SCREEN_WIDTH, 100)];
        _pickerScollView.backgroundColor = [UIColor whiteColor];
        _pickerScollView.itemWidth = SCREEN_WIDTH/7;
        _pickerScollView.itemHeight = 100;
        _pickerScollView.firstItemX = (_pickerScollView.frame.size.width - _pickerScollView.itemWidth) * 0.5;
        _pickerScollView.dataSource = self;
        _pickerScollView.delegate = self;
        _pickerScollView.view.backgroundColor = [Utility colorWithHexString:@"#FFD732" alpha:1.0f];
        _pickerScollView.tag = 1;
        [_contentView addSubview:_pickerScollView];
        [_pickerScollView reloadData];
        
        _pickerScollView.seletedIndex = 3;
        [_pickerScollView scollToSelectdIndex:3];
        
        _pickerScollView2 = [[MLPickerScrollView alloc] initWithFrame:CGRectMake(0, 147, SCREEN_WIDTH, 100)];
        _pickerScollView2.backgroundColor = [UIColor whiteColor];
        _pickerScollView2.itemWidth = SCREEN_WIDTH/7;
        _pickerScollView2.itemHeight = 100;
        _pickerScollView2.firstItemX = (_pickerScollView2.frame.size.width - _pickerScollView2.itemWidth) * 0.5;
        _pickerScollView2.dataSource = self;
        _pickerScollView2.delegate = self;
        _pickerScollView2.view.backgroundColor = [Utility colorWithHexString:@"#F9E594" alpha:1.0f];
        _pickerScollView2.tag = 2;
        [_contentView addSubview:_pickerScollView2];
        [_pickerScollView2 reloadData];
        
        _pickerScollView2.seletedIndex = 3;
        [_pickerScollView2 scollToSelectdIndex:3];
    }
}

- (void)showInView:(UIView *)view
{
    if (!view)
    {
        return;
    }
    
    [view addSubview:self];
    [view addSubview:_contentView];
    
    [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 247)];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 1.0;
        
        [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT - 247-64 , SCREEN_WIDTH, 247)];
        
    } completion:nil];
}

//移除从上向底部弹下去的UIView（包含遮罩）
- (void)disMissView
{
    [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT - 247-64 , SCREEN_WIDTH, 247)];
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.alpha = 0.0;
                         
                         [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 247)];
                     }
                     completion:^(BOOL finished){
                         
                         [self removeFromSuperview];
                         [_contentView removeFromSuperview];
                         
                     }];
    
}

-(void)latelyEightTime
{
    
    for (int i = 0; i < 15; i ++) {
        //从现在开始的24小时
        NSTimeInterval secondsPerDay = i * 24*60*60;
        NSDate *curDate = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
        
        
        
        NSDateFormatter *dateFormatterYear = [[NSDateFormatter alloc] init];
        [dateFormatterYear setDateFormat:@"Y"];
        NSString *dateStrYear = [dateFormatterYear stringFromDate:curDate];
        [Year addObject:dateStrYear];
        
        NSDateFormatter *dateFormatterMonth = [[NSDateFormatter alloc] init];
        [dateFormatterMonth setDateFormat:@"M"];
        NSString *dateStrMonth = [dateFormatterMonth stringFromDate:curDate];
        [Month addObject:dateStrMonth];
        
        NSDateFormatter *dateFormatterDay = [[NSDateFormatter alloc] init];
        [dateFormatterDay setDateFormat:@"d"];
        NSString *dateStrDay = [dateFormatterDay stringFromDate:curDate];
        [Day addObject:dateStrDay];
        
        NSDateFormatter *weekFormatter = [[NSDateFormatter alloc] init];
        [weekFormatter setDateFormat:@"EEEE"];//星期几 @"HH:mm 'on' EEEE MMMM d"];
        NSString *weekStr = [weekFormatter stringFromDate:curDate];
        [data addObject:weekStr];
        
        //转换英文为中文
//        NSString *chinaStr = [self cTransformFromE:weekStr];
        
        //组合时间
    }
}

////转换英文为中文
//-(NSString *)cTransformFromE:(NSString *)theWeek{
//    NSString *chinaStr;
//    if(theWeek){
//        if([theWeek isEqualToString:@"Monday"]){
//            chinaStr = @"一";
//        }else if([theWeek isEqualToString:@"Tuesday"]){
//            chinaStr = @"二";
//        }else if([theWeek isEqualToString:@"Wednesday"]){
//            chinaStr = @"三";
//        }else if([theWeek isEqualToString:@"Thursday"]){
//            chinaStr = @"四";
//        }else if([theWeek isEqualToString:@"Friday"]){
//            chinaStr = @"五";
//        }else if([theWeek isEqualToString:@"Saturday"]){
//            chinaStr = @"六";
//        }else if([theWeek isEqualToString:@"Sunday"]){
//            chinaStr = @"七";
//        }
//    }
//    return chinaStr;
//}

-(void)yesbtn
{
    
    NSString *dat;
    for (int i = 0; i < datariqi.count; i++) {
        MLDemoModel *model = [datariqi objectAtIndex:i];
        if (model.dicountIndex == _pickerScollView.seletedIndex) {
            dat = [NSString stringWithFormat:@"%@-%@-%@",model.dicountYear,model.dicountMonth,model.dicountDay];
        }
    }
    NSString *datim;
    for (int i = 0; i < datatime.count; i++) {
        MLDemoModel *model = [datatime objectAtIndex:i];
        if (model.dicountIndex == _pickerScollView2.seletedIndex) {
            datim = model.dicountTitle;
        }
    }
    
    NSDictionary *dic = @{@"日期":dat,@"时间":datim};
    
    if (self.returnValueBlock) {
        self.returnValueBlock(dic);
    }
}

//- (void)addButtonAction:(ButtonBlock)block {
//    self.block = block;
//}

#pragma mark - dataSource
- (NSInteger)numberOfItemAtPickerScrollView:(MLPickerScrollView *)pickerScrollView
{
    if(pickerScrollView.tag == 1)
    {
        return datariqi.count;
    }else
    
    return datatime.count;
    
}

- (MLPickerItem *)pickerScrollView:(MLPickerScrollView *)pickerScrollView itemAtIndex:(NSInteger)index
{
    if(pickerScrollView.tag == 1)
    {
        // creat
        MLDemoItem *item = [[MLDemoItem alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/7, 101)];
        
        // assignment
        MLDemoModel *model = [datariqi objectAtIndex:index];
        model.dicountIndex = index;
        item.title = model.dicountTitle;
        item.dayss = model.dicountDay;
        item.monthss = model.dicountMonth;
        [item setGrayTitle];
        
        // tap
        item.PickerItemSelectBlock = ^(NSInteger d){
            [_pickerScollView scollToSelectdIndex:d];
        };
        
        return item;
    }
    else
    {
        // creat
        MY_XTItem *item = [[MY_XTItem alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/7, 100)];
        
        // assignment
        MLDemoModel *model = [datatime objectAtIndex:index];
        model.dicountIndex = index;
        item.title = model.dicountTitle;
        [item setGrayTitle];
        
        // tap
        item.PickerItemSelectBlock = ^(NSInteger d){
            [_pickerScollView2 scollToSelectdIndex:d];
        };
        
        return item;
    }
    
}

#pragma mark - delegate
- (void)itemForIndexChange:(MLPickerItem *)item
{
    [item changeSizeOfItem];
}

- (void)itemForIndexBack:(MLPickerItem *)item
{
    [item backSizeOfItem];
}


@end
