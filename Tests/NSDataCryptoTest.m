#import <XCTest/XCTest.h>
#import "NSData+Crypto.h"

@interface NSDataCryptoTest : XCTestCase
@end

@implementation NSDataCryptoTest

- (void)testAes {
    NSString* key = @"SomeKey";
    NSData* keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSString* plainText = @"This is the thing that we are going to attempt to encrypt and decrypte.....";
    NSData* plainData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData* encryptedData = [plainData aesEncrypt:keyData];
    NSData* decryptedData = [encryptedData aesDecrypt:keyData];
    XCTAssertEqualObjects(plainData, decryptedData);
}

- (void)testAesLargeKey {
    NSString* key = @"SomeKey12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890";
    NSData* keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSString* plainText = @"This is the thing that we are going to attempt to encrypt and decrypte.....";
    NSData* plainData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData* encryptedData = [plainData aesEncrypt:keyData];
    NSData* decryptedData = [encryptedData aesDecrypt:keyData];
    XCTAssertEqualObjects(plainData, decryptedData);
}

- (void)testAesLargeData {
    NSString* key = @"SomeKey";
    NSData* keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableString* plainText = [[NSMutableString alloc] init];
    for(NSUInteger i = 0; i < 10000; i++) {
        [plainText appendString:@"12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"];
    }
    NSData* plainData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData* encryptedData = [plainData aesEncrypt:keyData];
    NSData* decryptedData = [encryptedData aesDecrypt:keyData];
    XCTAssertEqualObjects(plainData, decryptedData);
}

@end