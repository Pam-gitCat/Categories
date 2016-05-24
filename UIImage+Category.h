//
//  UIImage+Category.h
//  button
//
//  Created by tom.sun on 16/5/24.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)
- (UIImage *) imageWithWaterMask:(UIImage*)mask inRect:(CGRect)rect;
- (UIImage*) imageWithScaledToSize:(CGSize)newSize;
- (UIImage*)imageRotatedByDegrees:(CGFloat)degrees;
- (UIImage*)imageWithMaxImagePix:(CGFloat)maxImagePix compressionQuality:(CGFloat)compressionQuality;
- (UIImage*)imageWithProportion:(CGSize)ProportionSize percent:(CGFloat)percent;
- (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;
@end
