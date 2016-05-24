//
//  UIImage+Category.m
//  button
//
//  Created by tom.sun on 16/5/24.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)

/*!
 *  @brief  图片水印
 *
 *  @param mask 水印图
 *  @param rect rect
 *
 *  @return 新图
 */
- (UIImage *) imageWithWaterMask:(UIImage*)mask inRect:(CGRect)rect
{
    UIGraphicsBeginImageContextWithOptions([self size], NO, [UIScreen mainScreen].scale);
    //原图
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    //水印图
    [mask drawInRect:rect];
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newPic;
}

/*!
 *  @brief  压缩图片
 *
 *  @param newSize 指定尺寸
 *
 *  @return 压缩后的图
 */
-(UIImage*) imageWithScaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/*!
 *  @brief  图片旋转
 *
 *  @param degrees 旋转角度
 *
 *  @return 新图
 */
- (UIImage*)imageRotatedByDegrees:(CGFloat)degrees
{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    CGSize rotatedSize;
    rotatedSize.width = width;
    rotatedSize.height = height;
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    CGContextRotateCTM(bitmap, degrees * M_PI / 180);
    CGContextRotateCTM(bitmap, M_PI);
    CGContextScaleCTM(bitmap, -1.0, 1.0);
    CGContextDrawImage(bitmap, CGRectMake(-rotatedSize.width/2, -rotatedSize.height/2, rotatedSize.width, rotatedSize.height), self.CGImage);
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/*!
 *  @brief  图片压缩
 *
 *  @param maxImagePix        压缩的像素
 *  @param compressionQuality 压缩的比例
 *
 *  @return 新图
 */
- (UIImage*)imageWithMaxImagePix:(CGFloat)maxImagePix compressionQuality:(CGFloat)compressionQuality
{
    CGFloat width = 0.0;
    CGFloat height = 0.0;
    if (self.size.width >= self.size.height) {
        width = maxImagePix;
        height = self.size.height*maxImagePix/self.size.width;
    }else{
        height = maxImagePix;
        width = self.size.width*maxImagePix/self.size.height;
    }
    CGSize sizeImageSmall = CGSizeMake(width, height);
    UIGraphicsBeginImageContext(sizeImageSmall);
    CGRect smallImageRect = CGRectMake(0, 0, sizeImageSmall.width, sizeImageSmall.height);
    [self drawInRect:smallImageRect];
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *dataImage = UIImageJPEGRepresentation(smallImage, compressionQuality);
    return [UIImage imageWithData:dataImage];
}

/*!
 *  @brief  图片按尺寸比例缩小
 *
 *  @param ProportionSize 最大尺寸
 *  @param percent        压缩比例
 *
 *  @return 新图
 */
- (UIImage*)imageWithProportion:(CGSize)ProportionSize percent:(CGFloat)percent
{
    CGSize imageSize = self.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat scaleFactor = 0.0;
    CGPoint thumbPoint = CGPointMake(0.0,0.0);
    CGFloat widthFactor = ProportionSize.width / width;
    CGFloat heightFactor = ProportionSize.height / height;
    if (widthFactor > heightFactor)  {
        scaleFactor = widthFactor;
    }else {
        scaleFactor = heightFactor;
    }
    CGFloat scaledWidth  = width * scaleFactor;
    CGFloat scaledHeight = height * scaleFactor;
    if (widthFactor > heightFactor) {
        thumbPoint.y = (ProportionSize.height - scaledHeight) * 0.5;
    }else if (widthFactor < heightFactor) {
        thumbPoint.x = (ProportionSize.width - scaledWidth) * 0.5;
    }
    UIGraphicsBeginImageContext(ProportionSize);
    CGRect thumbRect = CGRectZero;
    thumbRect.origin = thumbPoint;
    thumbRect.size.width  = scaledWidth;
    thumbRect.size.height = scaledHeight;
    [self drawInRect:thumbRect];
    
    UIImage *thumbImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *thumbImageData = UIImageJPEGRepresentation(thumbImage, percent);
    return [UIImage imageWithData:thumbImageData];
}

/*!
 *  @brief  创建纯色图片
 *
 *  @param color 颜色
 *  @param size  大小
 *
 *  @return 新图
 */
- (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
