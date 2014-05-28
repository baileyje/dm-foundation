#import "DMDefaults.h"

@interface DMDefaults()
@property (nonatomic, strong) NSUserDefaults* defaults;
@end


@implementation DMDefaults

+ (DMDefaults*)standard {
    static DMDefaults* standard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        standard = [[DMDefaults alloc] initWith:NSUserDefaults.standardUserDefaults];
    });
    return standard;
}

- (instancetype)initWith:(NSUserDefaults*)defaults {
    if(self = [super init]) {
        self.defaults = defaults;
    }
    return self;
}

- (id)objectForKeyedSubscript:(id)key {
    return [self.defaults objectForKey:key];
}

- (void)setObject:(id)object forKeyedSubscript:(id)key {
    if(object != nil) {
        [self.defaults setObject:object forKey:key];
    } else {
        [self.defaults removeObjectForKey:key];
    }
    [self.defaults synchronize];
}

- (NSInteger)integerForKey:(NSString*)key {
    return [self.defaults integerForKey:key];
}

- (float)floatForKey:(NSString*)key {
    return [self.defaults floatForKey:key];
}

- (double)doubleForKey:(NSString*)key {
    return [self.defaults doubleForKey:key];
}

- (BOOL)boolForKey:(NSString*)key {
    return [self.defaults boolForKey:key];
}

- (void)setInteger:(NSInteger)value forKey:(NSString*)key {
    [self.defaults setInteger:value forKey:key];
    [self.defaults synchronize];
}

- (void)setFloat:(float)value forKey:(NSString*)key {
    [self.defaults setFloat:value forKey:key];
    [self.defaults synchronize];
}

- (void)setDouble:(double)value forKey:(NSString*)key {
    [self.defaults setDouble:value forKey:key];
    [self.defaults synchronize];
}

- (void)setBool:(BOOL)value forKey:(NSString*)key {
    [self.defaults setBool:value forKey:key];
    [self.defaults synchronize];
}

@end