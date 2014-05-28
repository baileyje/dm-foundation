#import <XCTest/XCTest.h>
#import "DMConfig.h"

@interface DMConfigTest : XCTestCase
@end

@implementation DMConfigTest

- (void)testSimple {
    XCTAssertEqualObjects(@"value1", DMConfig.shared[@"section1"]);
}

- (void)testSection {
    XCTAssertTrue([DMConfig.shared[@"section2"] isKindOfClass:NSDictionary.class]);
}

- (void)testStringValue {
    XCTAssertEqualObjects(@"value1", DMConfig.shared[@"section2"][@"key1"]);
    XCTAssertEqualObjects(@"value1", DMConfig.shared[@"section2.key1"]);
}

- (void)testNumberValue {
    XCTAssertEqualObjects(@1001, DMConfig.shared[@"section2"][@"key2"]);
    XCTAssertEqualObjects(@1001, DMConfig.shared[@"section2.key2"]);
}

- (void)testBoolValue {
    XCTAssertEqualObjects(@YES, DMConfig.shared[@"section2"][@"key3"]);
    XCTAssertEqualObjects(@YES, DMConfig.shared[@"section2.key3"]);
}

- (void)testNested {
    XCTAssertTrue([DMConfig.shared[@"section2"][@"key4"] isKindOfClass:NSDictionary.class]);
    XCTAssertEqualObjects(@"nestedValue1", DMConfig.shared[@"section2"][@"key4"][@"nested1"]);
    XCTAssertEqualObjects(@"nestedValue1", DMConfig.shared[@"section2.key4.nested1"]);
}

- (void)testArrayValue {
    XCTAssertTrue([DMConfig.shared[@"section2"][@"key4"][@"array"] isKindOfClass:NSArray.class]);
    NSArray* expected = @[@"entry1", @"entry2", @"entry3", @"entry4"];
    XCTAssertEqualObjects(expected, DMConfig.shared[@"section2"][@"key4"][@"array"]);
    XCTAssertEqualObjects(expected, DMConfig.shared[@"section2.key4.array"]);
}

- (void)testEmptyKey {
    XCTAssertNil(DMConfig.shared[@""]);
}

- (void)testNilKey {
    XCTAssertNil(DMConfig.shared[(id)nil]);
}

- (void)testInvalidPath {
    XCTAssertNil(DMConfig.shared[@"not"][@"a"][@"valid"][@"path"]);
    XCTAssertNil(DMConfig.shared[@"not.a.valid.path"]);
}

- (void)testWithNoConfig {
    DMConfig* config = [[DMConfig alloc] initWithName:@"BOGUS"];
    XCTAssertNil(config[@"someThing"]);
}

@end