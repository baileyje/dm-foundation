#import <CommonCrypto/CommonCrypto.h>
#import "NSData+Crypto.h"


@implementation NSData(Crypto)

- (NSData*)aes:(NSUInteger)operation with:(NSData*)key {
    char keyBytes[kCCKeySizeAES256 + 1];
    bzero(keyBytes, sizeof(keyBytes));
    [key getBytes:keyBytes length:sizeof(keyBytes)];
    size_t bufferSize = self.length + kCCBlockSizeAES128;
    void* buffer = malloc(bufferSize);
    size_t bytesTransformed = 0;
    CCCryptorStatus cryptStatus = CCCrypt(operation, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
        keyBytes, kCCKeySizeAES256, NULL, self.bytes, self.length, buffer, bufferSize, &bytesTransformed);
    if(cryptStatus != kCCSuccess) {
        free(buffer);
        return nil;
    }
    return [NSData dataWithBytesNoCopy:buffer length:bytesTransformed freeWhenDone:YES];
}

- (NSData*)aesEncrypt:(NSData*)key {
    return [self aes:kCCEncrypt with:key];
}

- (NSData*)aesDecrypt:(NSData*)key {
    return [self aes:kCCDecrypt with:key];
}


@end