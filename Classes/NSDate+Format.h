#import <Foundation/Foundation.h>

@interface NSDate (Format)
+ (instancetype)fromLastModified:(NSString*)formattedDate;
- (NSString*)toLastModified;
+ (instancetype)fromIso8601:(NSString*)formattedDate;
- (NSString*)toIso8601;
@end