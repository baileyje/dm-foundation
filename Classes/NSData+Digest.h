#import <Foundation/Foundation.h>

@interface NSData (Digest)
- (NSData*)md2;
- (NSData*)md4;
- (NSData*)md5;
- (NSData*)sha1;
- (NSData*)sha224;
- (NSData*)sha256;
- (NSData*)sha384;
- (NSData*)sha512;
@end