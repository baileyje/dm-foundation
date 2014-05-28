#import <Foundation/Foundation.h>

@interface NSString (Decode)
- (NSData*)hexDecode;
- (NSData*)b64Decode;
@end