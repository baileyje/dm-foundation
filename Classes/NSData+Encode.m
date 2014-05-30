#import "NSData+Encode.h"


@implementation NSData (Encode)

- (NSString*)hex {
    return self.hexEncode;
}

- (NSString*)hexEncode {
    static const unsigned char* alphabet = "0123456789ABCDEF";
    unsigned char* encoded = malloc(sizeof(unsigned char*) * self.length * 2);
    const unsigned char* bytes = self.bytes;
    for(NSUInteger i = 0; i < self.length; i++) {
        encoded[i * 2] = alphabet[bytes[i] >> 4];
        encoded[i * 2 + 1] = alphabet[bytes[i] & 15];
    }
    return [[NSString alloc] initWithBytesNoCopy:encoded length:self.length * 2 encoding:NSASCIIStringEncoding freeWhenDone:YES];
}

- (NSString*)b64 {
    return self.b64Encode;
}

- (NSString*)b64Encode {
    static const unsigned char* alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    const unsigned char* data = [self bytes];
    unsigned char* encoding = malloc(sizeof(char) * (NSUInteger)ceil(self.length / 3.0) * 4 + self.length / 76 * 2);
    NSUInteger position = 0;
    for(NSUInteger i = 2; i < self.length; i += 3) {
        encoding[position++] = alphabet[data[i - 2] >> 2];
        encoding[position++] = alphabet[((data[i - 2] << 4) & 63) + (data[i - 1] >> 4)];
        encoding[position++] = alphabet[((data[i - 1] << 2) & 63) + (data[i] >> 6)];
        encoding[position++] = alphabet[data[i] & 63];
        if((position + 2) % 78 == 0) {
            encoding[position++] = '\r';
            encoding[position++] = '\n';
        }
    }
    if(self.length % 3 == 1) {
        encoding[position++] = alphabet[data[self.length - 1] >> 2];
        encoding[position++] = alphabet[(data[self.length - 1] << 4) & 63];
        encoding[position++] = '=';
        encoding[position++] = '=';
    } else if(self.length % 3 == 2) {
        encoding[position++] = alphabet[data[self.length - 2] >> 2];
        encoding[position++] = alphabet[((data[self.length - 2] << 4) & 63) + (data[self.length - 1] >> 4)];
        encoding[position++] = alphabet[(data[self.length  - 1] << 2) & 63];
        encoding[position++] = '=';
    }
    return [[NSString alloc] initWithBytesNoCopy:encoding length:position encoding:NSASCIIStringEncoding freeWhenDone:YES];
}

@end