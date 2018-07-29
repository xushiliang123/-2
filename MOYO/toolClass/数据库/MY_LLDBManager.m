//
//  MY_LLDBManager.m
//  VTIME
//
//  Created by Louie on 2017/9/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLDBManager.h"
#import <LKDBHelper.h>


@interface MY_LLDBManager()

@property (nonatomic, strong) NSString * filePath;
@property (nonatomic, strong) LKDBHelper * dbHelper;

@end


@implementation MY_LLDBManager



+ (MY_LLDBManager *)sharedManager
{
    static MY_LLDBManager * manager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[MY_LLDBManager alloc] init];
    });
    
    return manager;
}



/** 添加数据
 @param model 添加数据model
 */
- (void)insertWithModel:(BaseModel *)model
{
    BOOL result = [self.dbHelper insertToDB:model];

    if (result)
    {
        NSLog(@"插入数据成功");
    }
    else
    {
        NSLog(@"插入数据失败");
    }
}


/** 更新数据
 @param model 更新的model
 @param where where 查找条件需要主键  例 userId = 123  &&  name = '北风'
 */
- (void)updateModel:(BaseModel *)model withWhere:(NSString *)where
{
    BOOL result = [self.dbHelper updateToDB:model where:where];
    
    if (result)
    {
//        NSLog(@"更新数据成功");
    }
    else
    {
//        NSLog(@"更新数据失败");
    }
}
- (NSArray*)selectClass:(Class)cls withWhere:(NSString *)where{
    NSArray *array = [self selectClass:cls withWhere:where orderBy:nil offset:0 count:1000];
    return array;
}
- (NSArray*)selectClass:(Class)cls withWhere:(NSString *)where orderBy:(NSString*)orderBy offset:(NSInteger)offset count:(NSInteger)count{
   NSArray *array = [self.dbHelper search:cls column:nil where:where orderBy:orderBy offset:offset count:count];
    return array;
}
/**  查找数据  单条Or多条
 @param cls model的Class
 @param where 查找条件  例 userId = 123  &&  name = '北风'
 @param block 查成功 数据返回  数组
 */
- (void)selectClass:(Class)cls withWhere:(NSString *)where responseBlock:(successBolck)block
{
    // 查找条件
    NSString *orderBy = nil; // @"company asc"; // "namedesc""
    [self.dbHelper search:cls where:where orderBy:orderBy offset:0 count:100 callback:^(NSMutableArray *array) {
        if (array && 0 != array.count)
        {

            block(array);
        }
        else
        {
            block(array);
        }
    }];
}


/** 删除数据   单条Or多条
 @param cls model的Class
 @param where 查找条件  例 userId = 123  &&  name = '北风'
 */
- (void)deleteDataClass:(Class)cls WithWhere:(NSString *)where
{

    [self selectClass:cls withWhere:where responseBlock:^(NSArray *dataArray) {
        
        for (BaseModel * model in dataArray) {
            
            [self.dbHelper deleteToDB:model callback:^(BOOL result) {
                if (result)
                {
                    NSLog(@"删除数据成功");
                }
                else
                {
                    NSLog(@"删除数据失败");
                }
            }];
        }
    }];
}


/** 删除表
  @param cls model的Class
 */
- (void)deleteTableWithClass:(Class)cls
{
    
    BOOL result = [self.dbHelper dropTableWithClass:cls];
    if (result)
    {
        NSLog(@"删除表成功");
    }
    else
    {
        NSLog(@"删除表失败");
    }
}




#pragma mark - 懒加载
- (NSString *)filePath
{
    if (!_filePath)
    {
        // document目录下
        NSArray *documentArray =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
        NSString *document = [documentArray objectAtIndex:0];
        _filePath = [document stringByAppendingPathComponent:@"VTIME.db"];
        
        
        NSLog(@"filePath %@", _filePath);
    }
    return _filePath;
}


- (LKDBHelper *)dbHelper
{
    if (!_dbHelper)
    {
        _dbHelper = [[LKDBHelper alloc] initWithDBPath:self.filePath];
    }
    
    return _dbHelper;
}

@end
