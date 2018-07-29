//
//  CustomPickerView.h
//  TogetherLu
//
//  Created by Louie on 2017/5/24.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerModel.h"



typedef void(^DidSelectBlock)(PickerModel * model);


@interface CustomPickerView : UIView

//  头部按钮文字大小
@property (nonatomic) UIFont * buttonTextFont; //default [UIFont boldSystemFontOfSize:16];

//  头部按钮文字颜色
@property (nonatomic) UIColor * buttonTextColor; //default [Utility colorWithHexString:@"#333333" alpha:1.0];

//  头部提示文字大小
@property (nonatomic) UIFont * titleTextFont; //default [UIFont systemFontOfSize:14];

//  头部提示文字颜色
@property (nonatomic) UIColor * titleTextColor; //default [Utility colorWithHexString:@"#333333" alpha:1.0];

//  pickerView每行文字大小
@property (nonatomic) UIFont * pickerViewTextFont; //default [UIFont systemFontOfSize:16];

//  pickerView每行文字颜色
@property (nonatomic) UIColor * pickerViewTextColor; //default [UIColor blackColor];

//  是否显示图片
@property (nonatomic, assign) BOOL isShowImage; //default NO;

//  是否联动
@property (nonatomic, assign) BOOL isLinKage; //default NO;

//  联动的全部数据
@property (nonatomic, strong) NSArray<NSArray *> * linKageArray;


//  数据源数组
@property (nonatomic, strong) NSArray * pickerArray;


//  选择后回调
@property (nonatomic, strong) DidSelectBlock didSelectBlock;


//  初始化
-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray oldModel:(PickerModel *)oldModel;

//  显示
- (void)show;

@end
