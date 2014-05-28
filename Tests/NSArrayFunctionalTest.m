#import <XCTest/XCTest.h>
#import "Thing.h"
#import "NSArray+Functional.h"

@interface NSArrayFunctionalTest : XCTestCase
@end

@implementation NSArrayFunctionalTest

- (NSArray*)things {
    return @[
        [[Thing alloc] initWithName:@"thing1" andValue:@"value1"],
        [[Thing alloc] initWithName:@"thing2" andValue:@"value2"],
        [[Thing alloc] initWithName:@"thing3" andValue:@"value3"],
        [[Thing alloc] initWithName:@"thing4" andValue:@"value4"],
        [[Thing alloc] initWithName:@"thing5" andValue:@"value5"],
        [[Thing alloc] initWithName:@"thing6" andValue:@"value6"]
    ];
}

- (void)testHead {
    NSArray* things = self.things;
    XCTAssertEqualObjects(things[0], things.head);
}

- (void)testHeadOfEmpty {
    NSArray* things = [NSArray array];
    XCTAssertNil(things.head);
}

- (void)testTail {
    NSArray* things = self.things;
    NSArray* expected = @[things[1], things[2], things[3], things[4], things[5]];
    XCTAssertEqualObjects(expected, things.tail);
}

- (void)testTailOfSingle {
    NSArray* things = [NSArray arrayWithObject:@"thing"];
    XCTAssertEqualObjects(@[], things.tail);
}

- (void)testTailOfEmpty {
    NSArray* things = [NSArray array];
    XCTAssertEqualObjects(@[], things.tail);
}

@end