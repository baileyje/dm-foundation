#import <CommonCrypto/CommonDigest.h>
#import "NSData+Digest.h"


@implementation NSData (Digest)

static NSData* digest(NSData *data, unsigned char* (*algorithm)(const void*, CC_LONG, unsigned char*), CC_LONG length) {
    unsigned char digest[length];
    algorithm(data.bytes, (CC_LONG)data.length, digest);
    return [NSData dataWithBytes:digest length:length];
}

- (NSData*)md2 {
    return digest(self, CC_MD2, CC_MD2_DIGEST_LENGTH);
}

- (NSData*)md4 {
    return digest(self, CC_MD4, CC_MD4_DIGEST_LENGTH);
}

- (NSData*)md5 {
    return digest(self, CC_MD5, CC_MD5_DIGEST_LENGTH);
}

- (NSData*)sha1 {
    return digest(self, CC_SHA1, CC_SHA1_DIGEST_LENGTH);
}

- (NSData*)sha224 {
    return digest(self, CC_SHA224, CC_SHA224_DIGEST_LENGTH);
}

- (NSData*)sha256 {
    return digest(self, CC_SHA256, CC_SHA256_DIGEST_LENGTH);
}

- (NSData*)sha384 {
    return digest(self, CC_SHA384, CC_SHA384_DIGEST_LENGTH);
}

- (NSData*)sha512 {
    return digest(self, CC_SHA512, CC_SHA512_DIGEST_LENGTH);
}

@end