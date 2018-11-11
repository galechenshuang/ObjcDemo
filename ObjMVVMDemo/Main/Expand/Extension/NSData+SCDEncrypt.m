//
//  NSData+SCDEncrypt.m
//  ObjMVVMDemo
//
//  Created by Simpletour on 2018/7/19.
//  Copyright © 2018年 Simpletour. All rights reserved.
//

#import "NSData+SCDAESEncrypt.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (SCDEncrypt)

/**
 *  AES128 + ECB + PKCS7
 *  @param data 要加密的原始数据
 *  @param key  加密 key
 *  @return  加密后数据
 */
+ (NSData *)encryptData:(NSData *)data key:(NSData *)key
{
    //判断解密的流数据是否存在
    if ((data == nil) || (data == NULL)) {
        return nil;
    } else if (![data isKindOfClass:[NSData class]]) {
        return nil;
    } else if ([data length] <= 0) {
        return nil;
    }
    
    //判断解密的Key是否存在
    if ((key == nil) || (key == NULL)) {
        return nil;
    } else if (![key isKindOfClass:[NSData class]]) {
        return nil;
    } else if ([key length] <= 0) {
        return nil;
    }
    
    //setup key
    NSData *result = nil;
    unsigned char cKey[kCCKeySizeAES128];
    bzero(cKey, sizeof(cKey));
    [key getBytes:cKey length:kCCKeySizeAES128];
    
    //setup output buffer
    size_t bufferSize = [data length] + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    //do encrypt
    size_t encryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionECBMode|kCCOptionPKCS7Padding,
                                          cKey,
                                          kCCKeySizeAES128,
                                          nil,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          bufferSize,
                                          &encryptedSize);
    if (cryptStatus == kCCSuccess) {
        result = [NSData dataWithBytesNoCopy:buffer length:encryptedSize];
    } else {
        free(buffer);
    }
    return result;
}


/**
 *  AES128 + ECB + PKCS7
 *  @param data 要解密的原始数据
 *  @param key  解密 key
 *  @return  解密后数据
 */
+ (NSData *)decryptData:(NSData *)data key:(NSData *)key
{
    //判断解密的流数据是否存在
    if ((data == nil) || (data == NULL)) {
        return nil;
    } else if (![data isKindOfClass:[NSData class]]) {
        return nil;
    } else if ([data length] <= 0) {
        return nil;
    }
    
    //判断解密的Key是否存在
    if ((key == nil) || (key == NULL)) {
        return nil;
    } else if (![key isKindOfClass:[NSData class]]) {
        return nil;
    } else if ([key length] <= 0) {
        return nil;
    }
    
    //setup key
    NSData *result = nil;
    unsigned char cKey[kCCKeySizeAES128];
    bzero(cKey, sizeof(cKey));
    [key getBytes:cKey length:kCCKeySizeAES128];
    
    //setup output buffer
    size_t bufferSize = [data length] + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    //do decrypt
    size_t decryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionECBMode|kCCOptionPKCS7Padding,
                                          cKey,
                                          kCCKeySizeAES128,
                                          nil,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          bufferSize,
                                          &decryptedSize);
    if (cryptStatus == kCCSuccess) {
        result = [NSData dataWithBytesNoCopy:buffer length:decryptedSize];
    } else {
        free(buffer);
    }
    return result;
}

@end
