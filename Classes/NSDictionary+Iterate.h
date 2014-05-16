#import <Foundation/Foundation.h>
#import "DMBlocks.h"

@interface NSDictionary (Iterate)
- (void)each:(DMKeyedTask)task;
- (NSDictionary*)map:(DMTransform)transform;
@end