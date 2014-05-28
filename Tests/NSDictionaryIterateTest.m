#import <XCTest/XCTest.h>
#import "NSDictionary+Iterate.h"

@interface NSDictionaryIterateTest : XCTestCase
@end

@implementation NSDictionaryIterateTest

- (void)testEach {
    NSDictionary* expected = @{
        @"key1": @"value1",
        @"key2": @"value2",
        @"key3": @"value3",
        @"key4": @"value4"
    };
    NSMutableDictionary* actual = [NSMutableDictionary dictionaryWithCapacity:expected.count];
    [expected each:^(NSString* key, NSString* value) {
        actual[key] = value;
    }];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testEachEmpty {
    __block BOOL called = NO;
    [@{} each:^(NSString* key, NSString* value) {
        called = YES;
    }];
    XCTAssertFalse(called);
}

- (void)testMap {
    NSDictionary* items = @{
        @"key1": @"value1",
        @"key2": @"value2",
        @"key3": @"value3",
        @"key4": @"value4"
    };
    NSDictionary* expected = @{
        @"key1": @"VALUE1",
        @"key2": @"VALUE2",
        @"key3": @"VALUE3",
        @"key4": @"VALUE4"
    };
    XCTAssertEqualObjects(expected, [items map:^NSString*(NSString* value) {
        return value.uppercaseString;
    }]);
}

- (void)testMapEmpty {
    __block BOOL called = NO;
    XCTAssertEqualObjects(@{}, [@{} map:^NSString*(NSString* value) {
        called = YES;
        return value.uppercaseString;
    }]);
    XCTAssertFalse(called);
}

@end