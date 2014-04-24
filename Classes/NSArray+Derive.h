#import <Foundation/Foundation.h>

@interface NSArray (Derive)
- (NSDictionary*)dictionaryWithKeys:(SEL)keySelector;
- (NSDictionary*)dictionaryWithKeys:(SEL)keySelector andValues:(SEL)valueSelector;
@end