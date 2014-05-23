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

+ (instancetype)fromIso8601:(NSString*)formattedDate {
    NSDateFormatter* formatter = [NSDateFormatter new];
    for(NSString* format in @[
        @"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ",
        @"yyyy-MM-dd'T'HH:mm:ss.SSSZ",
        @"yyyy-MM-dd'T'HH:mm:ss.SSS",
        @"yyyy-MM-dd'T'HH:mm:ssZZZZZ",
        @"yyyy-MM-dd'T'HH:mm:ssZ",
        @"yyyy-MM-dd'T'HH:mm:ss",
        @"yyyy-MM-dd'T'HH:mmZZZZZ",
        @"yyyy-MM-dd'T'HH:mmZ",
        @"yyyy-MM-dd'T'HH:mm",
        @"yyyy-MM-dd"]
    ) {
        formatter.dateFormat = format;
        NSDate* date = [formatter dateFromString:formattedDate];
        if(date) return date;
    }
    return nil;
}

- (NSString*)toIso8601 {
    NSDateFormatter* formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ";
    return [formatter stringFromDate:self];
}

@end