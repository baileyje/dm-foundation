#import "DMConfig.h"

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
        NSString* path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
        if(path) {
            self.config = [[NSDictionary alloc] initWithContentsOfFile:path];
        }
    }
    return self;
}

- (id)objectForKeyedSubscript:(id <NSCopying>)key {
    return self.config ?  self.config[key] : nil;
}

@end