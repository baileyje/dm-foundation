#import <XCTest/XCTest.h>
#import "NSMutableArray+Stack.h"

@interface NSMutableArrayStack : XCTestCase
@end

@implementation NSMutableArrayStack

- (void)testPush {
    NSMutableArray* array = [NSMutableArray array];
    [array push:@"Item1"];
    XCTAssertEqual(1, array.count);
    XCTAssertEqualObjects(@"Item1", array[0]);
    [array push:@"Item2"];
    XCTAssertEqual(2, array.count);
    XCTAssertEqualObjects(@"Item2", array[1]);
}

- (void)testPop {
    NSMutableArray* array = [NSMutableArray array];
    [array push:@"Item1"];
    [array push:@"Item2"];
    NSString* popped = [array pop];
    XCTAssertEqual(1, array.count);
    XCTAssertEqualObjects(@"Item2", popped);
    popped = [array pop];
    XCTAssertEqual(0, array.count);
    XCTAssertEqualObjects(@"Item1", popped);
}

- (void)testPopEmpty {
    NSMutableArray* array = [NSMutableArray array];
    XCTAssertNil([array pop]);
}

- (void)testPeek {
    NSMutableArray* array = [NSMutableArray array];
    [array push:@"Item1"];
    [array push:@"Item2"];
    NSString* peeked = [array peek];
    XCTAssertEqual(2, array.count);
    XCTAssertEqualObjects(@"Item2", peeked);
}

- (void)testPeekEmpty {
    NSMutableArray* array = [NSMutableArray array];
    XCTAssertNil([array peek]);
}

@end