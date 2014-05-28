#import <Foundation/Foundation.h>


@interface DMDefaults : NSObject

+ (DMDefaults*)standard;

- (id)objectForKeyedSubscript:(id)key;

- (void)setObject:(id)obj forKeyedSubscript:(id)key;

- (NSInteger)integerForKey:(NSString*)key;

- (float)floatForKey:(NSString*)key;

- (double)doubleForKey:(NSString*)key;

- (BOOL)boolForKey:(NSString*)key;

- (void)setInteger:(NSInteger)value forKey:(NSString*)key;

- (void)setFloat:(float)value forKey:(NSString*)key;

- (void)setDouble:(double)value forKey:(NSString*)key;

- (void)setBool:(BOOL)value forKey:(NSString*)key;

@end