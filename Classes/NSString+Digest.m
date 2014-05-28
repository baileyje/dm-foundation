#import "NSString+Digest.h"
#import "NSData+Encode.h"
#import "NSData+Digest.h"


@implementation NSString (Digest)

- (NSString*)md2 {
    return [[[self dataUsingEncoding:NSUTF8StringEncoding] md2] hexEncode];
}

- (NSString*)md4 {
    return [[[self dataUsingEncoding:NSUTF8StringEncoding] md4] hexEncode];
}

- (NSString*)md5 {
    return [[[self dataUsingEncoding:NSUTF8StringEncoding] md5] hexEncode];
}

- (NSString*)sha1 {
    return [[[self dataUsingEncoding:NSUTF8StringEncoding] sha1] hexEncode];
}

- (NSString*)sha224 {
    return [[[self dataUsingEncoding:NSUTF8StringEncoding] sha224] hexEncode];
}

- (NSString*)sha256 {
    return [[[self dataUsingEncoding:NSUTF8StringEncoding] sha256] hexEncode];
}

- (NSString*)sha384 {
    return [[[self dataUsingEncoding:NSUTF8StringEncoding] sha384] hexEncode];
}

- (NSString*)sha512 {
    return [[[self dataUsingEncoding:NSUTF8StringEncoding] sha512] hexEncode];
}

@end