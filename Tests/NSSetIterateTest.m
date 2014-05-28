#import <XCTest/XCTest.h>
#import "NSSet+Iterate.h"

@interface NSSetIterateTest : XCTestCase
@end

@implementation NSSetIterateTest

- (void)assert:(NSArray*)expected equal:(NSArray*)actual {
    XCTAssertEqualObjects([expected sortedArrayUsingSelector:@selector(compare:)], [actual sortedArrayUsingSelector:@selector(compare:)]);
}

- (void)testEach {
    NSSet* items = [NSSet setWithArray:@[@"thing1", @"thing2", @"thing3", @"thing4"]];
    NSMutableArray* actual = [NSMutableArray array];
    [items each:^(NSString* thing) {
        [actual addObject:thing];
    }];
    [self assert:items.allObjects equal:actual];
}

- (void)testEachEmpty {
    __block BOOL called = NO;
    [NSSet.set each:^(NSString* thing) {
        called = YES;
    }];
    XCTAssertFalse(called);
}

- (void)testMap {
    NSSet* items = [NSSet setWithArray:@[@"thing1", @"thing2", @"thing3", @"thing4"]];
    NSArray* expected = @[@"THING1", @"THING2", @"THING3", @"THING4"];
    [self assert:expected equal:[items map:^NSString*(NSString* it) {
        return it.uppercaseString;
    }]];
}

- (void)testMapEmpty {
    __block BOOL called = NO;
    XCTAssertEqualObjects(@[], [NSSet.set map:^id(id thing) {
        called = YES;
        return thing;
    }]);
    XCTAssertFalse(called);
}

- (void)testFind {
    NSSet* items = [NSSet setWithArray:@[@"thing1", @"thing2", @"thing3", @"thing4"]];
    XCTAssertEqualObjects(@"thing2", [items find:^BOOL(NSString* it) {
        return [@"thing2" isEqualToString:it];
    }]);
}

- (void)testFindNotFound {
    NSSet* items = [NSSet setWithArray:@[@"thing1", @"thing2", @"thing3", @"thing4"]];
    XCTAssertNil([items find:^BOOL(NSString* it) {
        return NO;
    }]);
}

- (void)testFindEmpty {
    XCTAssertNil([NSSet.set find:^BOOL(NSString* it) {
        return YES;
    }]);
}

- (void)testSelect {
    NSSet* nums = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    [self assert:@[@2, @4, @6] equal:[nums select:^BOOL(NSNumber* it) {
        return it.intValue %2 == 0;
    }].allObjects];
}

- (void)testSelectAllMatch {
    NSSet* nums = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    [self assert:nums.allObjects equal:[nums select:^BOOL(NSNumber*it) {
        return YES;
    }].allObjects];
}

- (void)testSelectNoMatch {
    NSSet* nums = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    [self assert:@[] equal:[nums select:^BOOL(NSNumber* it) {
        return NO;
    }].allObjects];
}

- (void)testSelectEmpty {
    __block BOOL called = NO;
    [self assert:@[] equal:[NSSet.set select:^BOOL(NSNumber* it) {
        return called = YES;
    }].allObjects];
    XCTAssertFalse(called);
}

- (void)testReject {
    NSSet* nums = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    [self assert:@[@1, @3, @5] equal:[nums reject:^BOOL(NSNumber* it) {
        return it.intValue %2 == 0;
    }].allObjects];
}

- (void)testRejectAllMatch {
    NSSet* nums = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    [self assert:@[] equal:[nums reject:^BOOL(NSNumber* it) {
        return YES;
    }].allObjects];
}

- (void)testRejectNoMatch {
    NSSet* nums = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    [self assert:nums.allObjects equal:[nums reject:^BOOL(NSNumber*it) {
        return NO;
    }].allObjects];
}

- (void)testRejectEmpty {
    __block BOOL called = NO;
    [self assert:@[] equal:[NSSet.set reject:^BOOL(NSNumber* it) {
        called = YES;
        return NO;
    }].allObjects];
    XCTAssertFalse(called);
}

- (void)testAny {
    NSSet* nums = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    XCTAssertTrue([nums any:^BOOL(NSNumber* it) {
        return it.intValue == 3;
    }]);
}

- (void)testAnyNoMatch {
    NSSet* nums = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    XCTAssertFalse([nums any:^BOOL(NSNumber* it) {
        return NO;
    }]);
}

- (void)testAnyEmpty {
    XCTAssertFalse([NSSet.set any:^BOOL(NSNumber* it) {
        return YES;
    }]);
}

- (void)testAll {
    NSSet* nums = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    XCTAssertTrue([nums all:^BOOL(NSNumber* it) {
        return it.intValue < 7;
    }]);
}

- (void)testNotAll {
    NSSet* nums = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    XCTAssertFalse([nums all:^BOOL(NSNumber* it) {
        return it.intValue < 4;
    }]);
}

- (void)testAllEmpty {
    XCTAssertTrue([NSSet.set all:^BOOL(NSNumber* it) {
        return YES;
    }]);
}

@end