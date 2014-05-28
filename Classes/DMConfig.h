#import <Foundation/Foundation.h>


@interface DMConfig : NSObject

+ (DMConfig*)shared;

- (instancetype)initWithName:(NSString*)name;

- (id)objectForKeyedSubscript:(NSString*)key;

@end