#import "NSData+Encode.h"


@implementation NSData (Encode)
- (NSString*)hex {
    NSMutableString* hex = [NSMutableString stringWithCapacity:self.length];
    const unsigned char* data = (const unsigned char *)[self bytes];
    for(int i = 0; i < self.length; i++) {
        [hex appendFormat:@"%02lx", data[i]];
    }
    return [NSString stringWithString:hex];
}
@end