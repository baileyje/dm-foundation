#import <Foundation/Foundation.h>

@interface NSDate (Format)
+ (instancetype)fromLastModified:(NSString*)formattedDate;
- (NSString*)toLastModified;
@end