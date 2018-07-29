//
//  MY_GLShareView.h
//  VTIME
//
//  Created by gll on 2017/11/20.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_GLShareView : UIView

@property(nonatomic,assign)NSInteger sharetype;

//array0,标题 array1：详情 array2：url
-(instancetype)initWithFrame:(CGRect)frame withDic:(NSDictionary *)bodyDic type:(NSInteger)type typeId:(NSNumber *)typeId sharetype:(NSInteger) sharetype;


- (void)show;


@end
