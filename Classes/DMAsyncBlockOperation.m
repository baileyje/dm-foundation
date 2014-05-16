#import "DMAsyncBlockOperation.h"


@interface DMAsyncBlockOperation ()
@property(nonatomic, copy) DMAsyncTask task;
@property(nonatomic, copy) DMCallback cancelHandle;
@property(assign) BOOL isCanceled;
@property(assign) BOOL isExecuting;
@property(assign) BOOL isFinished;
@end


@implementation DMAsyncBlockOperation

-(id)init {
    self = [super init];
    self.isCanceled = NO;
    self.isExecuting = NO;
    self.isFinished = NO;
    return self;
}

+ (DMAsyncBlockOperation*)operationWith:(DMAsyncTask)task {
    return [self operationWith:task cancelHandle:nil];
}

+ (DMAsyncBlockOperation*)operationWith:(DMAsyncTask)task cancelHandle:(DMCallback)cancelHandle {
    DMAsyncBlockOperation*operation = [DMAsyncBlockOperation new];
    operation.task = task;
    operation.cancelHandle = cancelHandle;
    return operation;
}

- (void)start {
    if (self.isCancelled) {
        self.isFinished = YES;
        self.isExecuting = NO;
        return;
    }
    self.isExecuting = YES;
    self.isFinished = NO;
    __weak DMAsyncBlockOperation* _self = self;
    self.task(^ {
        [_self setIsExecuting:NO];
        [_self setIsFinished:YES];
        _self.cancelHandle = nil;
    });
}

- (BOOL)isConcurrent {
    return YES;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    return YES;
}

- (void)cancel {
    if (self.cancelHandle) {
        self.cancelHandle();
    }
    self.isCanceled = YES;
}


@end