//
//  MessageInfoModel.m
//  TogetherLu
//
//  Created by Louie on 17/3/28.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_LYMessageInfoModel.h"
#define PersonalModelPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"personModelyy.data"]
@implementation MY_LYMessageInfoModel
static MY_LYMessageInfoModel * messageModel = nil;
+ (MY_LYMessageInfoModel *)sharedManager
{
    
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        messageModel = [[MY_LYMessageInfoModel alloc] init];
        
    });
    
    return messageModel;
}



- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}


- (void)addDictionaryWithValue:(id)value key:(NSString *)key{

}


//NSMutableDictionary * msgDict;
#pragma mark - 数据
- (NSMutableDictionary *)msgDict{
    if (nil == _msgDict) {
        _msgDict = [[NSMutableDictionary alloc] init];
    }
    return _msgDict;
}
- (void)setPersonModelArray:(NSArray *)modelArray{
    [NSKeyedArchiver archiveRootObject:modelArray toFile:PersonalModelPath];
}

- (NSArray *)modelArray{
    _modelArray = (NSArray*)[NSKeyedUnarchiver unarchiveObjectWithFile:PersonalModelPath];
    return _modelArray;
}
- (MY_LYPersonInfoModel*)loadPersonModelWithID:(NSInteger)userId{
    for (MY_LYPersonInfoModel *model in self.modelArray) {
        if (userId == model.userId) {
            return model;
        }
    }
    return nil;
}
- (void)insertModelWith:(MY_LYPersonInfoModel*)pinfmodel{
    if (!pinfmodel || pinfmodel == nil) {
        return;
    }
    NSArray *arr = (NSArray*)[NSKeyedUnarchiver unarchiveObjectWithFile:PersonalModelPath];
    __block BOOL isHasModel = NO;
    __block NSUInteger ind = 0;
    NSMutableArray *marry = [NSMutableArray arrayWithArray:arr];
    if (marry.count>0) {
        [marry enumerateObjectsUsingBlock:^(MY_LYPersonInfoModel *Pmodel, NSUInteger idx, BOOL * _Nonnull stop) {
            if (pinfmodel.userId == Pmodel.userId) {
                isHasModel = YES;
                ind = idx;
            }
        }];
        if (isHasModel) {
            [marry replaceObjectAtIndex:ind withObject:pinfmodel];
        }else{
            [marry addObject:pinfmodel];
        }
    }else{
         [marry addObject:pinfmodel];
    }
    [NSKeyedArchiver archiveRootObject:marry toFile:PersonalModelPath];
}

@end
