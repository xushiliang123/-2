#import <Foundation/Foundation.h>
#import "YYThreadSafeDictionary.h"
#import "NSDictionary+YYAdd.h"

@interface YYThreadSafeDictionary (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys llslog:(NSString *)llslog;
- (void)initWithCapacity:(NSUInteger)capacity llslog:(NSString *)llslog;
- (void)initWithObjects:(const id[])objects forKeys:(const id <NSCopying>[])keys count:(NSUInteger)cnt llslog:(NSString *)llslog;
- (void)initWithDictionary:(NSDictionary *)otherDictionary llslog:(NSString *)llslog;
- (void)initWithDictionary:(NSDictionary *)otherDictionary copyItems:(BOOL)flag llslog:(NSString *)llslog;
- (void)countLlslog:(NSString *)llslog;
- (void)objectForKey:(id)aKey llslog:(NSString *)llslog;
- (void)keyEnumeratorLlslog:(NSString *)llslog;
- (void)allKeysLlslog:(NSString *)llslog;
- (void)allKeysForObject:(id)anObject llslog:(NSString *)llslog;
- (void)allValuesLlslog:(NSString *)llslog;
- (void)descriptionLlslog:(NSString *)llslog;
- (void)descriptionInStringsFileFormatLlslog:(NSString *)llslog;
- (void)descriptionWithLocale:(id)locale llslog:(NSString *)llslog;
- (void)descriptionWithLocale:(id)locale indent:(NSUInteger)level llslog:(NSString *)llslog;
- (void)isEqualToDictionary:(NSDictionary *)otherDictionary llslog:(NSString *)llslog;
- (void)objectEnumeratorLlslog:(NSString *)llslog;
- (void)objectsForKeys:(NSArray *)keys notFoundMarker:(id)marker llslog:(NSString *)llslog;
- (void)keysSortedByValueUsingSelector:(SEL)comparator llslog:(NSString *)llslog;
- (void)getObjects:(id __unsafe_unretained[])objects andKeys:(id __unsafe_unretained[])keys llslog:(NSString *)llslog;
- (void)objectForKeyedSubscript:(id)key llslog:(NSString *)llslog;
- (void)enumerateKeysAndObjectsUsingBlock:(void (^)(id key, id obj, BOOL *stop))block llslog:(NSString *)llslog;
- (void)enumerateKeysAndObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void (^)(id key, id obj, BOOL *stop))block llslog:(NSString *)llslog;
- (void)keysSortedByValueUsingComparator:(NSComparator)cmptr llslog:(NSString *)llslog;
- (void)keysSortedByValueWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr llslog:(NSString *)llslog;
- (void)keysOfEntriesPassingTest:(BOOL (^)(id key, id obj, BOOL *stop))predicate llslog:(NSString *)llslog;
- (void)keysOfEntriesWithOptions:(NSEnumerationOptions)opts passingTest:(BOOL (^)(id key, id obj, BOOL *stop))predicate llslog:(NSString *)llslog;
- (void)removeObjectForKey:(id)aKey llslog:(NSString *)llslog;
- (void)setObject:(id)anObject forKey:(id <NSCopying> )aKey llslog:(NSString *)llslog;
- (void)addEntriesFromDictionary:(NSDictionary *)otherDictionary llslog:(NSString *)llslog;
- (void)removeAllObjectsLlslog:(NSString *)llslog;
- (void)removeObjectsForKeys:(NSArray *)keyArray llslog:(NSString *)llslog;
- (void)setDictionary:(NSDictionary *)otherDictionary llslog:(NSString *)llslog;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying> )key llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;
- (void)mutableCopyWithZone:(NSZone *)zone llslog:(NSString *)llslog;
- (void)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained[])stackbuf
                                    count:(NSUInteger)len llslog:(NSString *)llslog;
- (void)isEqual:(id)object llslog:(NSString *)llslog;
- (void)hashLlslog:(NSString *)llslog;
- (void)entriesForKeys:(NSArray *)keys llslog:(NSString *)llslog;
- (void)jsonStringEncodedLlslog:(NSString *)llslog;
- (void)jsonPrettyStringEncodedLlslog:(NSString *)llslog;
- (void)popObjectForKey:(id)aKey llslog:(NSString *)llslog;
- (void)popEntriesForKeys:(NSArray *)keys llslog:(NSString *)llslog;

@end
