//
//  MessageInfoModel.h
//  TogetherLu
//
//  Created by Louie on 17/3/28.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "BaseModel.h"
#import "MY_LYPersonInfoModel.h"
@interface MY_LYMessageInfoModel : BaseModel

+ (MY_LYMessageInfoModel *)sharedManager;

- (void)addDictionaryWithValue:(id)value key:(NSString *)key;

@property (nonatomic, strong) NSMutableDictionary * msgDict;
//@property (nonatomic, strong) MY_LLPersonInfoModel * personModel;
@property (nonatomic, strong)NSArray * modelArray;     //获取所有model
- (void)setPersonModelArray:(NSArray *)modelArray;
- (MY_LYPersonInfoModel*)loadPersonModelWithID:(NSInteger)userId;   //根据userId 获取model
- (void)insertModelWith:(MY_LYPersonInfoModel*)pinfmodel;     //存储model
@end
