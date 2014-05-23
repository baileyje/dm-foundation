#import "NSMutableArray+Queue.h"


@implementation NSMutableArray(Queue)

- (void)enqueue:(id)item {
    [self addObject:item];
}

- (id)dequeue {
    id item = [self firstObject];
    [self removeObjectAtIndex:0];
    return item;
}

- (id)poll {
    return [self firstObject];
}

@end