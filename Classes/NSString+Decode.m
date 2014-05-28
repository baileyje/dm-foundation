#import "NSString+Decode.h"


@implementation NSString (Decode)

- (NSData*)hexDecode {
    static const unsigned char values[128] = {
        16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
        16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
        16, 16, 16, 16, 16, 16, 16, 10, 11, 12, 13, 14, 15, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
        16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 10, 11, 12, 13, 14, 15, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
        16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
    };
    unsigned const char* chars = [self dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES].bytes;
    unsigned char* decoded = malloc(sizeof(unsigned char) * self.length / 2);
    NSUInteger decodedPosition = 0;
    unsigned char buffer[2];
    NSUInteger bufferPosition = 0;
    for(NSUInteger i = 0; i < self.length; i++) {
        unsigned char value = values[chars[i]];
        if(value < 16) buffer[bufferPosition++] = value;
        if(bufferPosition == 2) {
            bufferPosition = 0;
            decoded[decodedPosition++] = (buffer[0] << 4) + buffer[1];
        }
    }
    return [NSData dataWithBytesNoCopy:decoded length:decodedPosition freeWhenDone:YES];
}

- (NSData*)b64Decode {
    static const unsigned char values[128] = {
        64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
        64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 62, 64, 64, 64, 63, 52, 53, 54, 55, 56, 57, 58, 59,
        60, 61, 64, 64, 64, 64, 64, 64, 64, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
        21, 22, 23, 24, 25, 64, 64, 64, 64, 64, 64, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42,
        43, 44, 45, 46, 47, 48, 49, 50, 51, 64, 64, 64, 64, 64
    };
    unsigned const char* chars = [self dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES].bytes;
    unsigned char* decoded = malloc(sizeof(unsigned char) * self.length * 3/4);
    NSUInteger decodedPosition = 0;
    unsigned char buffer[4];
    NSUInteger bufferPosition = 0;
    for(NSUInteger i = 0; i < self.length; i++) {
        unsigned char value = values[chars[i]];
        if(value < 64) buffer[bufferPosition++] = value;
        if(bufferPosition == 4) {
            bufferPosition = 0;
            decoded[decodedPosition++] = (buffer[0] << 2) + (buffer[1] >> 4);
            decoded[decodedPosition++] = (buffer[1] << 4) + (buffer[2] >> 2);
            decoded[decodedPosition++] = (buffer[2] << 6) + buffer[3];
        }
    }
    if(bufferPosition > 1) {
        decoded[decodedPosition++] = (buffer[0] << 2) + (buffer[1] >> 4);
    }
    if(bufferPosition > 2) {
        decoded[decodedPosition++] = (buffer[1] << 4) + (buffer[2] >> 2);
    }
    return [NSData dataWithBytesNoCopy:decoded length:decodedPosition freeWhenDone:YES];
}

@end