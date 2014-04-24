#import "NSDate+Format.h"


@implementation NSDate (Format)

+ (instancetype)fromLastModified:(NSString*)formatted {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    formatter.dateFormat = @"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'";
    return [formatter dateFromString:formatted];
}

- (NSString*)toLastModified {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    formatter.dateFormat = @"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'";
    return [formatter stringFromDate:self];
}

@end