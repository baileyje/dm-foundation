#import <XCTest/XCTest.h>
#import "NSArray+Derive.h"
#import "Thing.h"


@interface NSArrayDeriveTest : XCTestCase
@end

@implementation NSArrayDeriveTest

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

- (void)testDeriveWithKey {
    NSArray* things = self.things;
    NSDictionary* derived = [things dictionaryWithKeys:@selector(name)];
    XCTAssertNotNil(derived);
    XCTAssertEqual(things.count, derived.count);
    XCTAssertEqualObjects(things[0], derived[@"thing1"]);
    XCTAssertEqualObjects(things[1], derived[@"thing2"]);
    XCTAssertEqualObjects(things[2], derived[@"thing3"]);
    XCTAssertEqualObjects(things[3], derived[@"thing4"]);
    XCTAssertEqualObjects(things[4], derived[@"thing5"]);
    XCTAssertEqualObjects(things[5], derived[@"thing6"]);
}

- (void)testDeriveWithKeyAndValue {
    NSArray* things = self.things;
    NSDictionary* derived = [things dictionaryWithKeys:@selector(name) andValues:@selector(value)];
    XCTAssertNotNil(derived);
    XCTAssertEqual(things.count, derived.count);
    XCTAssertEqualObjects(@"value1", derived[@"thing1"]);
    XCTAssertEqualObjects(@"value2", derived[@"thing2"]);
    XCTAssertEqualObjects(@"value3", derived[@"thing3"]);
    XCTAssertEqualObjects(@"value4", derived[@"thing4"]);
    XCTAssertEqualObjects(@"value5", derived[@"thing5"]);
    XCTAssertEqualObjects(@"value6", derived[@"thing6"]);
}

@end
