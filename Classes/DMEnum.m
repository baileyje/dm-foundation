#import <objc/runtime.h>
#import "DMEnum.h"
#import "NSArray+Iterate.h"

@interface DMEnum ()
@property(nonatomic, strong) NSString* name;
@property(nonatomic) NSUInteger ordinal;
@end

@implementation DMEnum

static NSMutableDictionary* alls;

+ (void)initialize {
    @synchronized (alls) {
        if(!alls) {
            alls = [NSMutableDictionary dictionary];
        }
    }
    Class class = object_getClass(self.class);
    unsigned protoCount;
    Protocol *const* protocols = class_copyProtocolList(class, &protoCount);
    if(protocols) {
        NSMutableArray* labels = [NSMutableArray array];
        if(protoCount >= 1) {
            unsigned methodCount;
            struct objc_method_description* methods = protocol_copyMethodDescriptionList(protocols[0], YES, NO, &methodCount);
            if(methods) {
                for(unsigned i = 0; i < methodCount; i++) {
                    NSString* label = NSStringFromSelector(methods[i].name);
                    [labels addObject:label];
                }
                free(methods);
            }
        }
        [labels sortUsingSelector:@selector(localizedCompare:)];
        NSMutableArray* temp = [NSMutableArray array];
        for(NSString* label in labels) {
            DMEnum* it = [[self alloc] initWithName:[self nameFor:label] andOrdinal:temp.count];
            IMP accessor = imp_implementationWithBlock(^() {
                return it;
            });
            class_addMethod(object_getClass(self.class), NSSelectorFromString(label), accessor, "@#:");
            [temp addObject:it];
        }
        alls[NSStringFromClass(self.class)] = [NSArray arrayWithArray:temp];
        free((void*)protocols);
    }
}

+ (NSString*)nameFor:(NSString*)label {
    return [[label stringByReplacingOccurrencesOfString:@"_" withString:@" "] lowercaseString];
}

+ (NSArray*)all {
    return alls[NSStringFromClass(self.class)];
}

+ (void)each:(void (^)(id item))block {
    [self.all each:block];
}


+ (instancetype)at:(NSUInteger)ordinal {
    if(ordinal >= self.all.count) {
        return nil;
    }
    return self.all[ordinal];
}

+ (instancetype)for:(id)identifier {
    if([identifier isKindOfClass:DMEnum.class]) { return identifier; }
    if([identifier isKindOfClass:NSString.class]) {
        return [self.all find:^BOOL(DMEnum* it) {
           return [it.name isEqualToString:identifier];
        }];
    }
    return nil;
}

- (instancetype)initWithName:(NSString*)name andOrdinal:(NSUInteger)ordinal {
    if(self=[super init]) {
        self.name = name;
        self.ordinal = ordinal;
    }
    return self;
}

-(int)intValue {
    return (int)self.ordinal;
}

@end