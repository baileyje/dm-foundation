#import <XCTest/XCTest.h>
#import "DMEnum.h"

@class Type;

@protocol Types
+ (Type*)TYPE1;
+ (Type*)TYPE2;
+ (Type*)TYPE3;
+ (Type*)TYPE4;
@end

@interface Type : DMEnum<Types>
@end

@interface DMEnumTest : XCTestCase
@end

@implementation DMEnumTest

- (void)testAll {
    NSArray* all = Type.all;
    XCTAssertEqual(4, all.count);
    NSArray* expected = @[Type.TYPE1, Type.TYPE2, Type.TYPE3, Type.TYPE4];
    XCTAssertEqualObjects(expected, all);
}

- (void)testName {
    XCTAssertEqualObjects(@"Type1", Type.TYPE1.name);
    XCTAssertEqualObjects(@"Type2", Type.TYPE2.name);
    XCTAssertEqualObjects(@"Type3", Type.TYPE3.name);
    XCTAssertEqualObjects(@"Type4", Type.TYPE4.name);
}

- (void)testOrdinal {
    XCTAssertEqual(0, Type.TYPE1.ordinal);
    XCTAssertEqual(1, Type.TYPE2.ordinal);
    XCTAssertEqual(2, Type.TYPE3.ordinal);
    XCTAssertEqual(3, Type.TYPE4.ordinal);

}

- (void)testAt {
    XCTAssertEqualObjects(Type.TYPE1, [Type at:0]);
    XCTAssertEqualObjects(Type.TYPE3, [Type at:2]);
}

- (void)testAtBadOrdinal {
    XCTAssertNil([Type at:99]);
}


- (void)testFor {
    XCTAssertEqualObjects(Type.TYPE1, [Type for:@"Type1"]);
    XCTAssertEqualObjects(Type.TYPE3, [Type for:@"Type3"]);
}

- (void)testAtBadName {
    XCTAssertNil([Type for:@"SomeNonTypeName"]);
}

- (void)testEach {
    NSMutableArray* types = [NSMutableArray array];
    [Type each:^ (Type* type) {
        [types addObject:type];
    }];
    XCTAssertEqualObjects(Type.all, types);
}

@end

@implementation Type

+ (NSString*)nameFor:(NSString*)label {
    return label.capitalizedString;
}

@end