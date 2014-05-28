#import <XCTest/XCTest.h>
#import "DMDefaults.h"

@interface DMDefaultsTest : XCTestCase
@end

@implementation DMDefaultsTest

- (void)setUp {
    [super setUp];
    [NSUserDefaults.standardUserDefaults removeObjectForKey:@"@SomeProp"];
}

- (void)tearDown {
    [NSUserDefaults.standardUserDefaults removeObjectForKey:@"@SomeProp"];
    [super tearDown];
}

- (void)testStandard {
    DMDefaults* defaults = DMDefaults.standard;
    XCTAssertNotNil(defaults);
}

- (void)testIdempotent {
    DMDefaults* defaults1 = DMDefaults.standard;
    DMDefaults* defaults2 = DMDefaults.standard;
    XCTAssertEqual(defaults1, defaults2);
}

- (void)testSetAndGetDefault {
    DMDefaults.standard[@"SomeProp"] = @"SomeValue";
    XCTAssertEqualObjects(@"SomeValue", DMDefaults.standard[@"SomeProp"]);
    XCTAssertEqualObjects([NSUserDefaults.standardUserDefaults objectForKey:@"SomeProp"], DMDefaults.standard[@"SomeProp"]);
}

- (void)testInt {
    [DMDefaults.standard setInteger:101 forKey:@"SomeProp"];
    XCTAssertEqual(101, [DMDefaults.standard integerForKey:@"SomeProp"]);
    XCTAssertEqual([NSUserDefaults.standardUserDefaults integerForKey:@"SomeProp"], [DMDefaults.standard integerForKey:@"SomeProp"]);
}

- (void)testFloat {
    [DMDefaults.standard setFloat:101.f forKey:@"SomeProp"];
    XCTAssertEqual(101.f, [DMDefaults.standard floatForKey:@"SomeProp"]);
    XCTAssertEqual([NSUserDefaults.standardUserDefaults floatForKey:@"SomeProp"], [DMDefaults.standard floatForKey:@"SomeProp"]);
}

- (void)testDouble {
    [DMDefaults.standard setDouble:101.0 forKey:@"SomeProp"];
    XCTAssertEqual(101.0, [DMDefaults.standard doubleForKey:@"SomeProp"]);
    XCTAssertEqual([NSUserDefaults.standardUserDefaults doubleForKey:@"SomeProp"], [DMDefaults.standard doubleForKey:@"SomeProp"]);
}

- (void)testBool {
    [DMDefaults.standard setBool:YES forKey:@"SomeProp"];
    XCTAssertEqual(YES, [DMDefaults.standard boolForKey:@"SomeProp"]);
    XCTAssertEqual([NSUserDefaults.standardUserDefaults boolForKey:@"SomeProp"], [DMDefaults.standard boolForKey:@"SomeProp"]);
}

@end