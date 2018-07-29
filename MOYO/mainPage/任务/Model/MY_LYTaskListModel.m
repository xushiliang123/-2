//
//  TaskListModel.m
//  VTIME
//
//  Created by gll on 2017/12/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LYTaskListModel.h"

@implementation MY_LYTaskListModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"tag"]) {
        self.tagNum = value;
    }
    
}

@end
