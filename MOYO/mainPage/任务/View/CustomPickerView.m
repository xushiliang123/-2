//
//  CustomPickerView.m
//  TogetherLu
//
//  Created by Louie on 2017/5/24.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "CustomPickerView.h"

#define kAlertWidth SCREEN_WIDTH
#define kAlertHeight 237 //数字和pch文件的高度统一修改

@interface CustomPickerView () <UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIButton      *     _btnBack;
    UIPickerView  *     _pickerView;
    UIButton      *     _cancelBtn;
    UIButton      *     _confirmBtn;
    PickerModel   *     _selectModel;
//    PickerModel   *     _oldModel;
    BOOL                _isMoreComponent;
    
    
    
}

@property (nonatomic, strong) UIView *backView;


@end



@implementation CustomPickerView

+ (void)initialize
{
    // UIAppearance Proxy Defaults
    CustomPickerView * pickerView = [self appearance];

    pickerView.buttonTextFont = [UIFont boldSystemFontOfSize:16];
    pickerView.buttonTextColor = [Utility colorWithHexString:@"#333333" alpha:1.0];
    
    pickerView.titleTextFont = [UIFont systemFontOfSize:14];
    pickerView.titleTextColor = [Utility colorWithHexString:@"#333333" alpha:1.0];
    
    pickerView.pickerViewTextFont = [UIFont systemFontOfSize:16];
    pickerView.pickerViewTextColor = [UIColor blackColor];

}


- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray oldModel:(PickerModel *)oldModel
{
    
    if (self = [super initWithFrame:frame])
    {
        _selectModel = oldModel;
        
        [self setUIWithTitleArray:titleArray];
    }
    return self;
}


- (void)dismissAlert
{
    [UIView animateWithDuration:0.2 animations:^{
        [self removeFromSuperview];
    }];
    
    
}

#pragma mark - UI处理
- (void)setUIWithTitleArray:(NSArray *)titleArray{
    
////  选择器和按钮的背景
//    _pickerBackView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 237)];
//    _pickerBackView.backgroundColor = [UIColor whiteColor];
//    [self.backView addSubview:_pickerBackView];
    
    self.backgroundColor = [UIColor whiteColor];
    
//  选择器上面的按钮
//    _cancelBtn = [Utility createButtonWithTitle:@"" titleColor:_buttonTextColor frame:CGRectMake(0, 0, 62, 46) setBackgroundImage:nil target:self action:@selector(hidePickerViewClick:)];
//    _cancelBtn.titleLabel.font = _buttonTextFont;
//    [self addSubview:_cancelBtn];
//
//    _confirmBtn = [Utility createButtonWithTitle:@"" titleColor:_buttonTextColor frame:CGRectMake(SCREEN_WIDTH - 62, 0, 62, 46) setBackgroundImage:nil target:self action:@selector(hidePickerViewClick:)];
//    _confirmBtn.titleLabel.font = _buttonTextFont;
//    [self addSubview:_confirmBtn];
    
    UIView *upView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 46)];
    upView.backgroundColor = [Utility colorWithHexString:@"#F5F5F5" alpha:1.0f];
    [self addSubview:upView];
    
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 46)];
    [leftBtn setImage:[UIImage imageNamed:@"叉号"] forState:0];
    [leftBtn addTarget:self action:@selector(hidePickerViewClick:) forControlEvents:UIControlEventTouchUpInside];
    [upView addSubview:leftBtn];
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60, 0, 60, 46)];
    [rightBtn setImage:[UIImage imageNamed:@"对号"] forState:0];
    [rightBtn addTarget:self action:@selector(hidePickerViewClick:) forControlEvents:UIControlEventTouchUpInside];
    [upView addSubview:rightBtn];

    CGFloat width = SCREEN_WIDTH / titleArray.count;
    
//  提示文字
    for (NSInteger i  = 0; i < titleArray.count; ++i) {
        
        UILabel * label = [[UILabel alloc] init];
        NSString * title = titleArray[i];
        label.frame = CGRectMake(i * width, 50, width, 16);
        label.text = title;
        label.font = self.titleTextFont;
        label.textColor = self.titleTextColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = 300 + i;
        [self addSubview:label];
    }
    
//  选择器
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 176)];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    [self addSubview:_pickerView];
}


- (void)show
{
    [UIView animateWithDuration:0.2 animations:^{
        UIViewController *topVC = [self appRootViewController];
        [topVC.view addSubview:self];
    }];
}

- (UIViewController *)appRootViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}


- (void)removeFromSuperview
{
    [self.backView removeFromSuperview];
    self.backView = nil;
    UIViewController *topVC = [self appRootViewController];
    
    CGRect afterFrame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kAlertWidth) * 0.5, CGRectGetHeight(topVC.view.bounds), kAlertWidth, kAlertHeight);
    
    self.frame=afterFrame;
    [super removeFromSuperview];
    //    [UIView animateWithDuration:0.5f delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
    //        self.frame = afterFrame;
    //        [super removeFromSuperview];
    //    } completion:^(BOOL finished) {
    //
    //    }];
}


- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview == nil) {
        return;
    }
    UIViewController *topVC = [self appRootViewController];
    
    if (!self.backView) {
        
        self.backView = [[UIView alloc] initWithFrame:topVC.view.bounds];
        self.backView.backgroundColor = [UIColor blackColor];
        self.backView.alpha = 0;
        self.backView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        _btnBack = [UIButton buttonWithType:UIButtonTypeSystem];
        _btnBack.frame = self.backView.bounds;
        _btnBack.backgroundColor = [UIColor clearColor];
        [self addSubview:_btnBack];
        [_btnBack addTarget:self action:@selector(hidePickerViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [topVC.view addSubview:self.backView];
    [self.backView addSubview:_btnBack];
    CGRect afterFrame = CGRectMake(0, SCREEN_HEIGHT-kAlertHeight, SCREEN_WIDTH, kAlertHeight);
    self.frame = afterFrame;
    
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        //self.transform = CGAffineTransformMakeRotation(0);
        self.backView.alpha = 0.4f;
        self.frame = afterFrame;
    } completion:^(BOOL finished) {
    }];
    [super willMoveToSuperview:newSuperview];
}


-(void)hidePickerViewClick:(UIButton *)btn
{
    NSMutableString * selectString = [[NSMutableString alloc] init];
    if (_isMoreComponent) {
        
        for (NSInteger i = 0; i < _pickerArray.count; ++i) {
            
            id obj = self.pickerArray[i];
            
            if ([obj isKindOfClass:[NSArray class]]) {
                
                switch (i) {
                    case 0:
                        [selectString appendString:obj[_selectModel.oneRow.integerValue]];
                        break;
                    case 1:
                        [selectString appendString:@" "];
                        [selectString appendString:obj[_selectModel.twoRow.integerValue]];
                        break;
                    case 2:
                        [selectString appendString:@" "];
                        [selectString appendString:obj[_selectModel.threeRow.integerValue]];
                        break;
                    case 3:
                        [selectString appendString:@" "];
                        [selectString appendString:obj[_selectModel.fiveRow.integerValue]];
                        break;
                }
            }
        }
    }
    else
    {
        selectString = [NSMutableString stringWithFormat:@"%@", self.pickerArray[_selectModel.oneRow.integerValue]];
    }
    
    _selectModel.selectContent = selectString;
    if (self.didSelectBlock) {
        self.didSelectBlock(_selectModel);
    }
    [self dismissAlert];
}


#pragma mark - 数据处理
- (void)setPickerArray:(NSArray *)pickerArray{
    _pickerArray = pickerArray;
    
    if (_pickerArray.count) {
        
        if ([_pickerArray.firstObject isKindOfClass:[NSArray class]]) {
            
            _isMoreComponent = YES;
        }
        else {
            _isMoreComponent = NO;
        }
        
        [_pickerView reloadAllComponents];
        
        if (_selectModel.oneComponent) {
            [_pickerView selectRow:_selectModel.oneRow.integerValue inComponent:_selectModel.oneComponent.integerValue animated:YES];
        }
        if (_selectModel.twoComponent) {
            [_pickerView selectRow:_selectModel.twoRow.integerValue inComponent:_selectModel.twoComponent.integerValue animated:YES];
        }
        if (_selectModel.threeComponent) {
            
            [_pickerView selectRow:_selectModel.threeRow.integerValue inComponent:_selectModel.threeComponent.integerValue animated:YES];
        }
        if (_selectModel.fiveComponent) {
            [_pickerView selectRow:_selectModel.fiveRow.integerValue inComponent:_selectModel.fiveComponent.integerValue animated:YES];
        }
    }
}



#pragma mark - pickView
//  UIPickerViewDataSource代理
//  设置有几列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    if (_isMoreComponent) {
        
        return self.pickerArray.count;
    }
    else {
        return 1;
    }
}

//  设置有某列有几行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (_isMoreComponent) {
        
        return [self.pickerArray[component] count];
    } else {
        
        return [self.pickerArray count];
    }
}


//  UIPickerViewDelegate代理
//  某列的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}

//  设置某行的内容
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSString * str = nil;
    if (_isMoreComponent) {
        
        str = self.pickerArray[component][row];
    } else {
        
        str = self.pickerArray[row];
    }
    if (self.isShowImage) {
        
//        NSMutableAttributedString * att = [NSString numberChangeAttributedStringWith:str];
        
        return str;
        
    }else{
        
        
        NSMutableAttributedString * att = [[NSMutableAttributedString alloc] initWithString:str];
        
        [att addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, str.length)];
        
        [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, str.length)];
        
        return att;
    }
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *lalTitle=(UILabel *)view;
    if (!lalTitle) {
        lalTitle=[[UILabel alloc] init];
        //        lalTitle.minimumScaleFactor=8;//设置最小字体，与minimumFontSize相同，minimumFontSize在IOS 6后不能使用。
        lalTitle.adjustsFontSizeToFitWidth=YES;//设置字体大小是否适应lalbel宽度
        lalTitle.textAlignment=NSTextAlignmentCenter;//文字居中显示
        [lalTitle setTextColor:self.pickerViewTextColor];
        [lalTitle setFont:self.pickerViewTextFont];
    }
    
    lalTitle.attributedText = [self pickerView:pickerView attributedTitleForRow:row forComponent:component];
    return lalTitle;
}

//  选中某行、某列，调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED{
    
    switch (component) {
        case 0:
            _selectModel.oneComponent = @0;
            _selectModel.oneRow = @(row);
            break;
        case 1:
            _selectModel.twoComponent = @1;
            _selectModel.twoRow = @(row);
            break;
        case 2:
            _selectModel.threeComponent = @2;
            _selectModel.threeRow = @(row);
            break;
        case 3:
            _selectModel.fiveComponent = @3;
            _selectModel.fiveRow = @(row);
            break;
    }
    
    if (self.isLinKage) {
        
        if (component == 0) {
            
            NSMutableArray * tempArr = [NSMutableArray arrayWithArray:_pickerArray];
            NSArray * serArr = self.linKageArray[row];
            [tempArr replaceObjectAtIndex:1 withObject:serArr];
            _pickerArray = tempArr;
            [_pickerView reloadAllComponents];
            
            _selectModel.twoComponent = @1;
            _selectModel.twoRow = @0;
            [_pickerView selectRow:_selectModel.twoRow.integerValue inComponent:_selectModel.twoComponent.integerValue animated:YES];
            
        }
    }
}


#pragma mark - 控件文字颜色or字体
- (void)setButtonTextFont:(UIFont *)buttonTextFont
{
    _buttonTextFont = buttonTextFont;
    if (_cancelBtn) {
        _cancelBtn.titleLabel.font = buttonTextFont;
    }
    if (_confirmBtn) {
        _confirmBtn.titleLabel.font = buttonTextFont;
    }
}


- (void)setButtonTextColor:(UIColor *)buttonTextColor
{
    _buttonTextColor = buttonTextColor;
    if (_cancelBtn) {
        [_cancelBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    }
    if (_confirmBtn) {
        [_confirmBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    }
}


- (void)setTitleTextFont:(UIFont *)titleTextFont
{
    _titleTextFont = titleTextFont;
    for (UILabel * label in self.subviews) {
        if (label.tag >= 300 && label.tag <= 303) {
            
            label.font = titleTextFont;
        }
    }
}


- (void)setTitleTextColor:(UIColor *)titleTextColor
{
    _titleTextColor = titleTextColor;
    for (UILabel * label in self.subviews) {
        if (label.tag >= 300 && label.tag <= 303) {
            
            label.textColor = titleTextColor;
        }
    }
}


- (void)setPickerViewTextFont:(UIFont *)pickerViewTextFont
{
    _pickerViewTextFont = pickerViewTextFont;
    if (_pickerView) {
        [_pickerView reloadAllComponents];
    }
}

- (void)setPickerViewTextColor:(UIColor *)pickerViewTextColor
{
    _pickerViewTextColor = pickerViewTextColor;
    if (_pickerView) {
        [_pickerView reloadAllComponents];
    }
}


@end

@implementation UIImage (colorful)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
