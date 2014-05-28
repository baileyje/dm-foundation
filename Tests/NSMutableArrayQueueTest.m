#import <XCTest/XCTest.h>
#import "NSMutableArray+Queue.h"

@interface NSMutableArrayQueueTest : XCTestCase
@end

@implementation NSMutableArrayQueueTest

- (void)testEnqueue {
    NSMutableArray* array = [NSMutableArray array];
    [array enqueue:@"Item1"];
    XCTAssertEqual(1, array.count);
    XCTAssertEqualObjects(@"Item1", array[0]);
    [array enqueue:@"Item2"];
    XCTAssertEqual(2, array.count);
    XCTAssertEqualObjects(@"Item2", array[1]);
}

- (void)testDequeue {
    NSMutableArray* array = [NSMutableArray array];
    [array enqueue:@"Item1"];
    [array enqueue:@"Item2"];
    NSString* dequeued = [array dequeue];
    XCTAssertEqual(1, array.count);
    XCTAssertEqualObjects(@"Item1", dequeued);
    dequeued = [array dequeue];
    XCTAssertEqual(0, array.count);
    XCTAssertEqualObjects(@"Item2", dequeued);
}

- (void)testDequeueEmpty {
    NSMutableArray* array = [NSMutableArray array];
    XCTAssertNil([array dequeue]);
}

- (void)testPoll {
    NSMutableArray* array = [NSMutableArray array];
    [array enqueue:@"Item1"];
    [array enqueue:@"Item2"];
    NSString* polled = array.poll;
    XCTAssertEqual(2, array.count);
    XCTAssertEqualObjects(@"Item1", polled);
}

- (void)testPollEmpty {
    NSMutableArray* array = [NSMutableArray array];
    XCTAssertNil(array.poll);
}


@end