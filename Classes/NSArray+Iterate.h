#import <Foundation/Foundation.h>
#import "DMBlocks.h"

@interface NSArray (Iterate)
- (void)each:(DMTask)task;
- (void)eachWithIndex:(DMIndexedTask)task;
- (NSArray*)map:(DMTransform)transform;
- (id)inject:(DMMemoizedTransform)transform;
- (id)inject:(id)memo into:(DMMemoizedTransform)transform;
- (id)find:(DMPredicate)predicate;
- (NSArray*)select:(DMPredicate)predicate;
- (NSArray*)reject:(DMPredicate)predicate;
- (BOOL)any:(DMPredicate)predicate;
- (BOOL)all:(DMPredicate)predicate;
@end