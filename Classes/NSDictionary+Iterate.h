#import <Foundation/Foundation.h>
#import "DMBlocks.h"

@interface NSDictionary (Iterate)
- (void)each:(DMKeyedTask)task;
- (void)map:(DMTransform)transform;
@end