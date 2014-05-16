#import "NSArray+Derive.h"
#import "NSArray+Iterate.h"


@implementation NSArray (Derive)

- (NSDictionary*)dictionaryWithKeys:(SEL)keySelector {
    return [self dictionaryWithKeys:keySelector andValues:nil];
}

- (NSDictionary*)dictionaryWithKeys:(SEL)keySelector andValues:(SEL)valueSelector {
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithCapacity:self.count];
    [self each:^(NSObject* item) {
        if(![item respondsToSelector:keySelector]) [NSException raise:@"Invalid key selector" format:@"Invalid selector: %@ on item: %@", NSStringFromSelector(keySelector), item];
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        id key = [item performSelector:keySelector];
        #pragma clang diagnostic pop
        id value = item;
        if(valueSelector) {
            if(![item respondsToSelector:valueSelector]) [NSException raise:@"Invalid value selector" format:@"Invalid selector: %@ on item: %@", NSStringFromSelector(valueSelector), item];
            #pragma clang diagnostic push
            #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            value = [item performSelector:valueSelector];
            #pragma clang diagnostic pop
        }
        dictionary[key] = value;
    }];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

@end