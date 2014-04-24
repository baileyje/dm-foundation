#import "NSArray+Functional.h"


@implementation NSArray (Functional)

- (id)head {
    return self.count ? self[0] : nil;
}

- (NSArray*)tail {
    return self.count > 1 ? [self subarrayWithRange:NSMakeRange(1, self.count - 1)] : @[];
}

@end