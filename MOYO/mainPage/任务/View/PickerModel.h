//
//  PickerModel.h
//  TogetherLu
//
//  Created by Louie on 2017/5/25.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "BaseModel.h"

@interface PickerModel : BaseModel

@property (nonatomic, strong) NSString * selectContent;

@property (nonatomic, strong) NSNumber * oneComponent;
@property (nonatomic, strong) NSNumber * oneRow;

@property (nonatomic, strong) NSNumber * twoComponent;
@property (nonatomic, strong) NSNumber * twoRow;

@property (nonatomic, strong) NSNumber * threeComponent;
@property (nonatomic, strong) NSNumber * threeRow;

@property (nonatomic, strong) NSNumber * fiveComponent;
@property (nonatomic, strong) NSNumber * fiveRow;


@end
