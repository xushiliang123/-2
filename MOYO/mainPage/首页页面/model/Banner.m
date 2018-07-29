//
//  Banner.m
//  SXtext
//
//  Created by i51Star on 15/9/28.
//  Copyright (c) 2015年 i51Star. All rights reserved.
//

#import "Banner.h"

@implementation Banner
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.bannerId = value;
    }
}
@end
