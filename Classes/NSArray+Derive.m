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
        id key = [item performSelector:keySelector];
        id value = item;
        if(valueSelector) {
            if(![item respondsToSelector:valueSelector]) [NSException raise:@"Invalid value selector" format:@"Invalid selector: %@ on item: %@", NSStringFromSelector(valueSelector), item];
            value = [item performSelector:valueSelector];
        }
        dictionary[key] = value;
    }];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

@end