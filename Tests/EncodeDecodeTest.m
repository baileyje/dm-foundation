#import <XCTest/XCTest.h>
#import "NSData+Encode.h"
#import "NSString+Decode.h"
#import "NSDictionary+Iterate.h"

@interface EncodeDecodeTest : XCTestCase
@end

@implementation EncodeDecodeTest

- (NSDictionary*)messages {
    return @{
        @"": @{
            @"b64": @"",
            @"hex": @""
        },
        @"a": @{
            @"b64": @"YQ==",
            @"hex": @"61"
        },
        @"ab": @{
            @"b64" : @"YWI=",
            @"hex": @"6162"
        },
        @"abc": @{
            @"b64" : @"YWJj",
            @"hex": @"616263"
        },
        @"abcd": @{
            @"b64" : @"YWJjZA==",
            @"hex": @"61626364"
        },
        @"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefgfghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefgfghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefgfghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz": @{
            @"b64" : @"YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2Rl\r\n"
                "ZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlq\r\n"
                "a2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5v\r\n"
                "cHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0\r\n"
                "dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5\r\n"
                "emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNk\r\n"
                "ZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hp\r\n"
                "amtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1u\r\n"
                "b3BxcnN0dXZ3eHl6YWJjZGVmZ2ZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3Bx\r\n"
                "cnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2\r\n"
                "d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXph\r\n"
                "YmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVm\r\n"
                "Z2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hp\r\n"
                "amtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1u\r\n"
                "b3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJz\r\n"
                "dHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4\r\n"
                "eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdmZ2hpamtsbW5vcHFyc3R1dnd4eXph\r\n"
                "YmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVm\r\n"
                "Z2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWpr\r\n"
                "bG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9w\r\n"
                "cXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1\r\n"
                "dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6\r\n"
                "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2Rl\r\n"
                "ZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlq\r\n"
                "a2xtbm9wcXJzdHV2d3h5eg==",
            @"hex": @"6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A61626364656667666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A61626364656667666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A61626364656667666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A"
        },
        @"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefgfghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefgfghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefgfghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzA": @{
            @"b64" : @"YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2Rl\r\n"
                "ZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlq\r\n"
                "a2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5v\r\n"
                "cHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0\r\n"
                "dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5\r\n"
                "emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNk\r\n"
                "ZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hp\r\n"
                "amtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1u\r\n"
                "b3BxcnN0dXZ3eHl6YWJjZGVmZ2ZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3Bx\r\n"
                "cnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2\r\n"
                "d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXph\r\n"
                "YmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVm\r\n"
                "Z2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hp\r\n"
                "amtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1u\r\n"
                "b3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJz\r\n"
                "dHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4\r\n"
                "eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdmZ2hpamtsbW5vcHFyc3R1dnd4eXph\r\n"
                "YmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVm\r\n"
                "Z2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWpr\r\n"
                "bG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9w\r\n"
                "cXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1\r\n"
                "dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6\r\n"
                "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2Rl\r\n"
                "ZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlq\r\n"
                "a2xtbm9wcXJzdHV2d3h5ekE=",
            @"hex": @"6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A61626364656667666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A61626364656667666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A61626364656667666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A41"
        },
        @"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefgfghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefgfghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefgfghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzAB": @{
            @"b64" : @"YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2Rl\r\n"
                "ZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlq\r\n"
                "a2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5v\r\n"
                "cHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0\r\n"
                "dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5\r\n"
                "emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNk\r\n"
                "ZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hp\r\n"
                "amtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1u\r\n"
                "b3BxcnN0dXZ3eHl6YWJjZGVmZ2ZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3Bx\r\n"
                "cnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2\r\n"
                "d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXph\r\n"
                "YmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVm\r\n"
                "Z2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hp\r\n"
                "amtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1u\r\n"
                "b3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJz\r\n"
                "dHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4\r\n"
                "eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdmZ2hpamtsbW5vcHFyc3R1dnd4eXph\r\n"
                "YmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVm\r\n"
                "Z2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWpr\r\n"
                "bG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9w\r\n"
                "cXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1\r\n"
                "dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6\r\n"
                "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5emFiY2Rl\r\n"
                "ZmdoaWprbG1ub3BxcnN0dXZ3eHl6YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXphYmNkZWZnaGlq\r\n"
                "a2xtbm9wcXJzdHV2d3h5ekFC",
            @"hex": @"6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A61626364656667666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A61626364656667666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A61626364656667666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A6162636465666768696A6B6C6D6E6F707172737475767778797A4142"
        }
    };
}


- (void)testHexEncode {
    NSDictionary* messages = self.messages;
    [messages each:^(NSString* message, NSDictionary* expected) {
        XCTAssertEqualObjects(expected[@"hex"], [message dataUsingEncoding:NSUTF8StringEncoding].hex);
    }];
}

- (void)testHexDecode {
    NSDictionary* messages = self.messages;
    [messages each:^(NSString* message, NSDictionary* expected) {
        XCTAssertEqualObjects([message dataUsingEncoding:NSUTF8StringEncoding], [expected[@"hex"] hexDecode]);
    }];
}

- (void)testHexDecodeOddLength {
    XCTAssertEqualObjects(@"6162".hexDecode, @"61626".hexDecode);
}

- (void)testHexDecodeWithSpaces {
    XCTAssertEqualObjects(@"6162".hexDecode, @"61 62".hexDecode);
}

- (void)testHexDecodeWithInvalid {
    XCTAssertEqualObjects(@"6162".hexDecode, @"61Z62".hexDecode);
}

- (void)testHexDecodeWithInvalidEncoding {
    XCTAssertEqualObjects(@"6162".hexDecode, @"61\u261062".hexDecode);
}

- (void)testHexDecodeHotMess {
    XCTAssertEqualObjects(@"6162".hexDecode, @"6Z1\u26106 2 a".hexDecode);
}

- (void)testHexRepeatable {
    NSString* plainText = @"This is the thing that we are going to attempt to encode.....";
    NSData* plainData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSString* encoded1 = plainData.hex;
    NSString* encoded2 = plainData.hex;
    NSString* encoded3 = plainData.hex;
    XCTAssertEqualObjects(encoded1, encoded2);
    XCTAssertEqualObjects(encoded1, encoded3);
}

- (void)testB64Encode {
    NSDictionary* messages = self.messages;
    [messages each:^(NSString* message, NSDictionary* expected) {
        XCTAssertEqualObjects(expected[@"b64"], [message dataUsingEncoding:NSUTF8StringEncoding].b64);
    }];
}

- (void)testB64Decode {
    NSDictionary* messages = self.messages;
    [messages each:^(NSString* message, NSDictionary* expected) {
        XCTAssertEqualObjects([message dataUsingEncoding:NSUTF8StringEncoding], [expected[@"b64"] b64Decode]);
    }];
}

- (void)testB64DecodeNoWrap {
    NSDictionary* messages = self.messages;
    [messages each:^(NSString* message, NSDictionary* expected) {
        XCTAssertEqualObjects([message dataUsingEncoding:NSUTF8StringEncoding], [[expected[@"b64"] stringByReplacingOccurrencesOfString:@"\r\n" withString:@""] b64Decode]);
    }];
}

- (void)testB64DecodeOddLength {
    XCTAssertEqualObjects(@"YWJjZA==".b64Decode, @"YWJjZA=".b64Decode);
}

- (void)testB64DecodeWithSpaces {
    XCTAssertEqualObjects(@"YWJjZA==".b64Decode, @"YWJ jZA==".b64Decode);
}

- (void)testB64DecodeWithInvalid {
    XCTAssertEqualObjects(@"YWJjZA==".b64Decode, @"YWJj,ZA=".b64Decode);
}

- (void)testB64DecodeWithInvalidEncoding {
    XCTAssertEqualObjects(@"YWJjZA==".b64Decode, @"YWJ\u2610jZA==".b64Decode);
}

- (void)testB64DecodeHotMess {
    XCTAssertEqualObjects(@"YWJjZA==".b64Decode, @"Y,WJ\u2610jZ A".b64Decode);
}

- (void)testB64Repeatable {
    NSString* plainText = @"This is the thing that we are going to attempt to encode.....";
    NSData* plainData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSString* encoded1 = plainData.b64;
    NSString* encoded2 = plainData.b64;
    NSString* encoded3 = plainData.b64;
    XCTAssertEqualObjects(encoded1, encoded2);
    XCTAssertEqualObjects(encoded1, encoded3);
}

@end