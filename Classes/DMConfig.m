#import "DMConfig.h"
#import "NSArray+Iterate.h"

@interface DMConfig()
@property (nonatomic, strong) NSDictionary* config;
@end

@implementation DMConfig

+ (DMConfig*)shared {
    static DMConfig* shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] initWithName:@"Config"];
    });
    return shared;
}


- (instancetype)initWithName:(NSString*)name {
    if(self = [super init]) {
        NSString* path = [[NSBundle bundleForClass:self.class] pathForResource:name ofType:@"plist"];
        if(path) {
            self.config = [[NSDictionary alloc] initWithContentsOfFile:path];
        }
    }
    return self;
}

- (id)forKeys:(NSArray*)keys {
    return [keys inject:self.config into:^(NSDictionary* context, NSString* key) {
        return context[key];
    }];
}

- (id)objectForKeyedSubscript:(NSString*)key {
    if(!key) return nil;
    return [self forKeys:@[key]] ?: [self forKeys:[key componentsSeparatedByString:@"."]];
}

@end