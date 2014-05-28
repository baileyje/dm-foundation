#import <Foundation/Foundation.h>


@interface DMConfig : NSObject

+ (DMConfig*)shared;

- (instancetype)initWithName:(NSString*)name;

- (id)objectForKeyedSubscript:(id <NSCopying>)key;

@end