#import "Thing.h"


@implementation Thing
- (instancetype)initWithName:(NSString*)name andValue:(NSString*)value {
    if(self = [super init]) {
        self.name = name;
        self.value = value;
    }
    return self;
}
@end