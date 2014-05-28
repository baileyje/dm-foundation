#import <Foundation/Foundation.h>

@interface NSData (Encode)
- (NSString*)hexEncode;
- (NSString*)b64Encode;
@end