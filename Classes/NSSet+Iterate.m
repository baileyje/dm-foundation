#import "NSSet+Iterate.h"


@implementation NSSet (Iterate)

- (void)each:(DMTask)task {
    for(id item in self) task(item);
}

- (NSArray*)map:(DMTransform)transform {
    NSMutableArray* results = [NSMutableArray arrayWithCapacity:self.count];
    for(id value in self) [results addObject:transform(value)];
    return [NSArray arrayWithArray:results];
}

- (id)find:(DMPredicate)predicate {
    for(id value in self) if(predicate(value)) return value;
    return nil;
}

- (NSSet*)select:(DMPredicate)predicate {
    NSMutableSet* results = [NSMutableSet setWithCapacity:self.count];
    for(id value in self) if(predicate(value)) [results addObject:value];
    return [NSSet setWithSet:results];
}

- (NSSet*)reject:(DMPredicate)predicate {
    NSMutableSet* results = [NSMutableSet setWithCapacity:self.count];
    for(id value in self) if(!predicate(value)) [results addObject:value];
    return [NSSet setWithSet:results];
}

- (BOOL)any:(DMPredicate)predicate {
    for(id value in self) if(predicate(value)) return YES;
    return NO;
}

- (BOOL)all:(DMPredicate)predicate {
    for(id value in self) if(!predicate(value)) return NO;
    return YES;
}

@end