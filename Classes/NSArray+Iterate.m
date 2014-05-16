#import "NSArray+Iterate.h"
#import "NSArray+Functional.h"


@implementation NSArray (Iterate)

- (void)each:(DMTask)task {
    for(id item in self) task(item);
}

- (void)eachWithIndex:(DMIndexedTask)task {
    NSUInteger index = 0;
    for(id value in self) task(index++, value);
}

- (NSArray*)map:(DMTransform)transform {
    NSMutableArray* results = [NSMutableArray arrayWithCapacity:self.count];
    for(id value in self) [results addObject:transform(value)];
    return [NSArray arrayWithArray:results];
}

- (id)inject:(DMMemoizedTransform)transform {
    return [self.tail inject:self.head into:transform];
}

- (id)inject:(id)memo into:(DMMemoizedTransform)transform {
    for(id value in self) memo = transform(memo, value);
    return memo;
}

- (id)find:(DMPredicate)predicate {
    for(id value in self) if(predicate(value)) return value;
    return nil;
}

- (NSArray*)select:(DMPredicate)predicate {
    NSMutableArray* results = [NSMutableArray arrayWithCapacity:self.count];
    for(id value in self) if(predicate(value)) [results addObject:value];
    return [NSArray arrayWithArray:results];
}

- (NSArray*)reject:(DMPredicate)predicate {
    NSMutableArray* results = [NSMutableArray arrayWithCapacity:self.count];
    for(id value in self) if(!predicate(value)) [results addObject:value];
    return [NSArray arrayWithArray:results];
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