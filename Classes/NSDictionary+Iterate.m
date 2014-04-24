#import "NSDictionary+Iterate.h"


@implementation NSDictionary (Iterate)

- (void)each:(DMKeyedTask)task {
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
        task(key, value);
    }];
}

- (NSDictionary*)map:(DMTransform)transform {
    NSMutableDictionary* results = [NSMutableDictionary dictionaryWithCapacity:self.count];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
        results[key] = transform(value);
    }];
    return [NSDictionary dictionaryWithDictionary:results];
}

@end