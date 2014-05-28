#import <Foundation/Foundation.h>

@interface NSData (Encode)
- (NSString*)hex;
- (NSString*)hexEncode;
- (NSString*)b64;
- (NSString*)b64Encode;
@end