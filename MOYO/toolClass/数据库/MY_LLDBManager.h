//
//  MY_LLDBManager.h
//  VTIME
//
//  Created by Louie on 2017/9/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ successBolck)(NSArray * dataArray);

@interface MY_LLDBManager : NSObject



+ (MY_LLDBManager *)sharedManager;


/** 添加数据
 @param model 添加数据model
 */
- (void)insertWithModel:(BaseModel *)model;



/** 更新数据
 @param model 更新的model
 @param where where 查找条件需要主键  例 userId = 123  &&  name = '北风'
 */
- (void)updateModel:(BaseModel *)model withWhere:(NSString *)where;



/**  查找数据  单条Or多条
 @param cls model的Class
 @param where 查找条件  例 userId = 123  &&  name = '北风'
 @param block 查成功 数据返回  数组
 */
- (void)selectClass:(Class)cls withWhere:(NSString *)where responseBlock:(successBolck)block;



/** 删除数据   单条Or多条
 @param cls model的Class
 @param where 查找条件  例 userId = 123  &&  name = '北风'
 */
- (void)deleteDataClass:(Class)cls WithWhere:(NSString *)where;



/** 删除表
 @param cls model的Class
 */
- (void)deleteTableWithClass:(Class)cls;

/**  查找数据  单条Or多条
 @param cls model的Class
 @param where 查找条件  例 userId = 123  &&  name = '北风'
 */
- (NSArray*)selectClass:(Class)cls withWhere:(NSString *)where;
- (NSArray*)selectClass:(Class)cls withWhere:(NSString *)where orderBy:(NSString*)orderBy offset:(NSInteger)offset count:(NSInteger)count;

@end
