//
//  NSData+SCDEncrypt.h
//  ObjMVVMDemo
//
//  Created by Simpletour on 2018/7/19.
//  Copyright © 2018年 Simpletour. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (SCDEncrypt)

/**
 *  AES128 + ECB + PKCS7
 *  @param data 要加密的原始数据
 *  @param key  加密 key
 *  @return  加密后数据
 */
+ (NSData *)encryptData:(NSData *)data key:(NSData *)key;
/**
 *  AES128 + ECB + PKCS7
 *  @param data 要解密的原始数据
 *  @param key  解密 key
 *  @return  解密后数据
 */
+ (NSData *)decryptData:(NSData *)data key:(NSData *)key;

@end
