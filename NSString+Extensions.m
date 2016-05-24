//
//  NSString+Extensions.m
//  button
//
//  Created by tom.sun on 16/5/24.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)
/*!
 *  @brief  判断字符串是否空
 *
 *  @return yes or no
 */
- (BOOL)isEmpty {
    if ([self length] == 0 || self == (id)[NSNull null] || self == nil) {
        return YES;
    }
    return NO;
}

/*!
 *  @brief  判断字符串是否包含某个字符串
 *
 *  @param subString 某个字符串
 *
 *  @return yes or no
 */
- (BOOL)stringContainsSubString:(NSString *)subString {
    NSRange aRange = [self rangeOfString:subString];
    if (aRange.location == NSNotFound) {
        return NO;
    }
    return YES;
}

/*!
 *  @brief  正则表达式验证邮箱
 *
 *  @return  yes or no
 */
- (BOOL)isValidEmail
{
    NSString *emailRegex = @"^\\w+([-.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

/*!
 *  @brief  正则表达式验证手机号码
 *
 *  @return yes or no
 */
- (BOOL)isValidPhoneNum
{
    NSString *phoneRegex = @"^1+[3578]+\\d{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

/*!
 *  @brief  正则表达式验证url
 *
 *  @return yes or no
 */
- (BOOL)isValidUrl
{
    NSString *regex = @"^((http)|(https))+:[^\\s]+\\.[^\\s]*$";
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regexTest evaluateWithObject:self];
}
@end
