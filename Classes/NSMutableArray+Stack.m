#import "NSMutableArray+Stack.h"


@implementation NSMutableArray (Stack)

- (void)push:(id)value {
    [self addObject:value];
}

- (id)pop {
    id value = self.peek;
    if(self.count) [self removeLastObject];
    return value;
}

- (id)peek {
    return self.lastObject;
}

@end