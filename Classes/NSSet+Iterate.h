#import "DMBlocks.h"

@interface NSSet (Iterate)
- (void)each:(DMTask)task;
- (NSArray*)map:(DMTransform)transform;
- (id)find:(DMPredicate)predicate;
- (NSSet*)select:(DMPredicate)predicate;
- (NSSet*)reject:(DMPredicate)predicate;
- (BOOL)any:(DMPredicate)predicate;
- (BOOL)all:(DMPredicate)predicate;
@end