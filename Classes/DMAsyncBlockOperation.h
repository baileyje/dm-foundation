#import "DMBlocks.h"

@interface DMAsyncBlockOperation : NSOperation

+(DMAsyncBlockOperation*)operationWith:(DMAsyncTask)task;

+(DMAsyncBlockOperation*)operationWith:(DMAsyncTask)task cancelHandle:(DMCallback)cancelHandle;

@end