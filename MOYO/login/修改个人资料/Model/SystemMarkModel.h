//
//  SystemMarkModel.h
//  TogetherLu
//
//  Created by gll on 2017/6/15.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "BaseModel.h"



@class MarkModel;

// cp标签
@interface SystemMarkModel : BaseModel

@property (nonatomic, strong) NSNumber *maxNum;//最多可选数量
@property (nonatomic, strong) NSString *name;//title
@property (nonatomic, strong) NSMutableArray<MarkModel * > *tagList;//男标签

@end



@interface MarkModel : BaseModel

@property (nonatomic, strong) NSNumber *status;//选中状态
@property (nonatomic, strong) NSString *name;//标签名

@end



