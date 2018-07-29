//
//  BaseModel.h
//  TogetherLu
//
//  Created by MadridLee on 2017/1/5.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
//- (id)valueForUndefinedKey:(NSString *)key;
@end
