#import "NSString+Digest.h"
#import "NSData+Encode.h"
#import "NSData+Digest.h"


@implementation NSString (Digest)

- (NSString*)md2 {
    return [self dataUsingEncoding:NSUTF8StringEncoding].md2.hex;
}

- (NSString*)md4 {
    return [self dataUsingEncoding:NSUTF8StringEncoding].md4.hex;
}

- (NSString*)md5 {
    return [self dataUsingEncoding:NSUTF8StringEncoding].md5.hex;
}

- (NSString*)sha1 {
    return [self dataUsingEncoding:NSUTF8StringEncoding].sha1.hex;
}

- (NSString*)sha224 {
    return [self dataUsingEncoding:NSUTF8StringEncoding].sha224.hex;
}

- (NSString*)sha256 {
    return [self dataUsingEncoding:NSUTF8StringEncoding].sha256.hex;
}

- (NSString*)sha384 {
    return [self dataUsingEncoding:NSUTF8StringEncoding].sha384.hex;
}

- (NSString*)sha512 {
    return [self dataUsingEncoding:NSUTF8StringEncoding].sha512.hex;
}

@end