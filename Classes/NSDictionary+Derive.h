#import <Foundation/Foundation.h>

@interface NSDictionary (Derive)
- (NSDictionary*)omit:(NSArray*)keys;
- (NSDictionary*)pick:(NSArray*)keys;
@end