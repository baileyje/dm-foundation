@interface Thing : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* value;
- (instancetype)initWithName:(NSString*)name andValue:(NSString*)value;
@end
