//
//  NSString+Extensions.h
//  button
//
//  Created by tom.sun on 16/5/24.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extensions)
- (BOOL)isEmpty;
- (BOOL)stringContainsSubString:(NSString *)subString;
- (BOOL)isValidEmail;
- (BOOL)isValidPhoneNum;
- (BOOL)isValidUrl;
@end
