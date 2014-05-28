#import <XCTest/XCTest.h>
#import "NSArray+Iterate.h"
#import "Thing.h"

@interface NSArrayIterateTest : XCTestCase
@end

@implementation NSArrayIterateTest

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

- (void)testEach {
    NSArray* expected = self.things;
    NSMutableArray* actual = [NSMutableArray array];
    [expected each:^(Thing* thing) {
        [actual addObject:thing];
    }];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testEachEmpty {
    __block BOOL called = NO;
    [@[] each:^(Thing* thing) {
        called = YES;
    }];
    XCTAssertFalse(called);
}

- (void)testEachWithIndex {
    NSArray* expected = self.things;
    NSMutableArray* actual = [NSMutableArray arrayWithCapacity:expected.count];
    [expected eachWithIndex:^(NSUInteger idx, Thing* thing) {
        actual[idx] = thing;
    }];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testEachWithIndexEmpty {
    NSArray* expected = @[];
    __block BOOL called = NO;
    [expected eachWithIndex:^(NSUInteger idx, NSString* thing) {
        called = YES;
    }];
    XCTAssertFalse(called);
}

- (void)testMap {
    NSArray* expected = @[@"thing1", @"thing2", @"thing3", @"thing4", @"thing5", @"thing6"];
    XCTAssertEqualObjects(expected, [self.things map:^NSString*(Thing* thing) {
        return thing.name;
    }]);
}

- (void)testMapEmpty {
    __block BOOL called = NO;
    XCTAssertEqualObjects(@[], [@[] map:^id(id thing) {
        called = YES;
        return thing;
    }]);
    XCTAssertFalse(called);
}

- (void)testInject {
    NSArray* nums = @[@1, @2, @5, @8];
    XCTAssertEqualObjects(@16, [nums inject:^NSNumber*(NSNumber* sum, NSNumber* it) {
        return [NSNumber numberWithInt:sum.intValue + it.intValue];
    }]);
}

- (void)testInjectEmpty {
    __block BOOL called = NO;
    XCTAssertNil([@[] inject:^NSNumber*(NSNumber* sum, NSNumber* it) {
        called = YES;
        return [NSNumber numberWithInt:sum.intValue + it.intValue];
    }]);
    XCTAssertFalse(called);
}

- (void)testInjectInto {
    XCTAssertEqualObjects(@"thing1thing2thing3thing4thing5thing6", [self.things inject:@"" into:^NSString*(NSString* memo, Thing* thing) {
        return [memo stringByAppendingString:thing.name];
    }]);
}

- (void)testInjectIntoEmpty {
    __block BOOL called = NO;
    XCTAssertEqualObjects(@0, [@[@0] inject:^NSNumber*(NSNumber* sum, NSNumber* it) {
        called = YES;
        return [NSNumber numberWithInt:sum.intValue + it.intValue];
    }]);
    XCTAssertFalse(called);
}

- (void)testFind {
    NSArray* things = self.things;
    NSMutableArray* traversed = [NSMutableArray array];
    XCTAssertEqualObjects(things[2], [things find:^BOOL(Thing* thing) {
        [traversed addObject:thing];
        return [@"thing3" isEqualToString:thing.name];
    }]);
    NSArray* expected = [things subarrayWithRange:NSMakeRange(0, 3)];
    XCTAssertEqualObjects(expected, traversed);
}

- (void)testFindNotFound {
    NSArray* things = self.things;
    NSMutableArray* traversed = [NSMutableArray array];
    XCTAssertNil([things find:^BOOL(Thing* thing) {
        [traversed addObject:thing];
        return NO;
    }]);
    XCTAssertEqualObjects(things, traversed);
}

 - (void)testFindEmpty {
     NSMutableArray* traversed = [NSMutableArray array];
     XCTAssertNil([@[] find:^BOOL(Thing* thing) {
         [traversed addObject:thing];
         return YES;
     }]);
     XCTAssertEqualObjects(@[], traversed);
 }

- (void)testSelect {
    NSArray* nums = @[@1, @2, @3, @4, @5, @6];
    NSArray* expected = @[@2, @4, @6];
    XCTAssertEqualObjects(expected, [nums select:^BOOL(NSNumber* it) {
        return it.intValue %2 == 0;
    }]);
}

- (void)testSelectAllMatch {
    NSArray* nums = @[@1, @2, @3, @4, @5, @6];
    XCTAssertEqualObjects(nums, [nums select:^BOOL(NSNumber* it) {
        return YES;
    }]);
}

- (void)testSelectNoMatch {
    NSArray* nums = @[@1, @2, @3, @4, @5, @6];
    XCTAssertEqualObjects(@[], [nums select:^BOOL(NSNumber* it) {
        return NO;
    }]);
}

- (void)testSelectEmpty {
    __block BOOL called = NO;
    XCTAssertEqualObjects(@[], [@[] select:^BOOL(NSNumber* it) {
        return called = YES;
    }]);
    XCTAssertFalse(called);
}

- (void)testReject {
    NSArray* nums = @[@1, @2, @3, @4, @5, @6];
    NSArray* exptected = @[@1, @3, @5];
    XCTAssertEqualObjects(exptected, [nums reject:^BOOL(NSNumber* it) {
        return it.intValue %2 == 0;
    }]);
}

- (void)testRejectAllMatch {
    NSArray* nums = @[@1, @2, @3, @4, @5, @6];
    XCTAssertEqualObjects(@[], [nums reject:^BOOL(NSNumber* it) {
        return YES;
    }]);
}

- (void)testRejectNoMatch {
    NSArray* nums = @[@1, @2, @3, @4, @5, @6];
    XCTAssertEqualObjects(nums, [nums reject:^BOOL(NSNumber* it) {
        return NO;
    }]);
}

- (void)testRejectEmpty {
    __block BOOL called = NO;
    XCTAssertEqualObjects(@[], [@[] reject:^BOOL(NSNumber* it) {
        called = YES;
        return NO;
    }]);
    XCTAssertFalse(called);
}

- (void)testAny {
    NSArray* things = self.things;
    NSMutableArray* traversed = [NSMutableArray array];
    XCTAssertTrue([things any:^BOOL(Thing* thing) {
        [traversed addObject:thing];
        return [@"thing3" isEqualToString:thing.name];
    }]);
    NSArray* expected = [things subarrayWithRange:NSMakeRange(0, 3)];
    XCTAssertEqualObjects(expected, traversed);
}

- (void)testAnyNoMatch {
    NSArray* things = self.things;
    NSMutableArray* traversed = [NSMutableArray array];
    XCTAssertFalse([things any:^BOOL(Thing* thing) {
        [traversed addObject:thing];
        return NO;
    }]);
    XCTAssertEqualObjects(things, traversed);
}

- (void)testAnyEmpty {
    NSMutableArray* traversed = [NSMutableArray array];
    XCTAssertFalse([@[] any:^BOOL(Thing* thing) {
        [traversed addObject:thing];
        return YES;
    }]);
    XCTAssertEqualObjects(@[], traversed);
}

- (void)testAll {
    NSArray* things = self.things;
    XCTAssertTrue([things all:^BOOL(Thing* thing) {
        return [thing.name hasPrefix:@"thing"];
    }]);
}

- (void)testNotAll {
    NSArray* things = self.things;
    NSMutableArray* traversed = [NSMutableArray array];
    XCTAssertFalse([things all:^BOOL(Thing* thing) {
        [traversed addObject:thing];
        return ![@"thing3" isEqualToString:thing.name];
    }]);
    NSArray* expected = [things subarrayWithRange:NSMakeRange(0, 3)];
    XCTAssertEqualObjects(expected, traversed);
}

- (void)testAllEmpty {
    XCTAssertTrue([@[] all:^BOOL(Thing* thing) {
        return YES;
    }]);
}

@end