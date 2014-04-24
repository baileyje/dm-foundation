@interface DMEnum : NSObject
+(NSString*)nameFor:(NSString*)label;
+(NSArray*)all;
+(instancetype)at:(int)ordinal;
+(instancetype)for:(id)name;
+(void)each:(void (^)(id item))block;
@property(nonatomic, readonly) NSString* name;
@property(nonatomic, readonly) int ordinal;
@end