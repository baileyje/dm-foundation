@interface NSData(Crypto)
-(NSData*)aesEncrypt:(NSData*)key;
-(NSData*)aesDecrypt:(NSData*)key;
@end