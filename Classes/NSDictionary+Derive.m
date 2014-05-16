#import "NSDictionary+Derive.h"

@implementation NSDictionary (Derive)

- (NSDictionary*)omit:(NSArray*)keys {
    NSMutableDictionary* results = [NSMutableDictionary dictionaryWithCapacity:self.count];
    for(id key in keys) [results removeObjectForKey:key];
    return [NSDictionary dictionaryWithDictionary:results];
}

- (NSDictionary*)pick:(NSArray*)keys {
    NSMutableDictionary* results = [NSMutableDictionary dictionaryWithCapacity:keys.count];
    for(id key in keys) if(self[key]) {
        results[key] = self[key];
    }
    return [NSDictionary dictionaryWithDictionary:results];
}

@end