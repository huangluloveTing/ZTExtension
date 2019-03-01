//
//  ZTDESUtil.h
//  ZTExtension
//
//  Created by 黄露 on 2019/3/1.
//  Copyright © 2019 huanglu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZTEncryUtil : NSObject

/**
 DES3 加密
 @param plainText 加密内容
 @param key 秘钥
 @param iv 初始向量
 @return 加密后的数据
 */
+ (NSData *) DES3Encrypt:(NSString*)plainText
          secret_key:(NSString *)key
      initial_vector:(NSString *)iv;
// 解密方法
    
/**
 DES3 解谜
 @param encryptData 带解密的数据
 @param key 秘钥
 @param iv 初始向量
 @return 原始数据
 */
+ (NSString *)DES3Decrypt:(NSData *)encryptData
           secret_key:(NSString *)key
       initail_sector:(NSString *)iv;
    
@end

NS_ASSUME_NONNULL_END
