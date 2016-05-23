//
//  UIView+border.m
//
//  Created by tom.sun on 16/5/20.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import "UIView+border.h"

@implementation UIView (border)

/*!
 *  @brief  画圆
 */
- (void)circular
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width/2;
}

/*!
 *  @brief  画指定高度和颜色的边框
 *
 *  @param width 边框高度
 *  @param color 边框颜色
 */
- (void)drawBorder:(float)width color:(UIColor*)color
{
    self.layer.borderWidth = width;
    self.layer.borderColor = [color CGColor];
}

/*!
 *  @brief  画指定弧度
 *
 *  @param cornerRadius 弧度
 */
- (void)drawRadius:(float)cornerRadius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
}

/*!
 *  @brief  画指定高度颜色弧度的边框
 *
 *  @param width        边框高度
 *  @param color        边框颜色
 *  @param cornerRadius 边框弧度
 */
- (void)drawBoarder:(float)width color:(UIColor*)color radius:(float)cornerRadius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = width;
    self.layer.borderColor = [color CGColor];
}

/*!
 *  @brief  画右边边框
 *
 *  @param width 边框高度
 *  @param color 边框颜色
 */
- (void)drawRightBorder:(float)width color:(UIColor*)color
{
    CALayer *rightBorder = [CALayer layer];
    rightBorder.frame = CGRectMake(self.frame.size.width - width, 0.0f, width, self.frame.size.height);
    rightBorder.backgroundColor = [color CGColor];
    [self.layer addSublayer:rightBorder];
}

/*!
 *  @brief  画左边边框
 *
 *  @param width 边框高度
 *  @param color 边框颜色
 */
- (void)drawLeftBorder:(float)width color:(UIColor*)color
{
    CALayer *leftBorder = [CALayer layer];
    leftBorder.frame = CGRectMake(0.0f, 0.0f, width, self.frame.size.height);
    leftBorder.backgroundColor = [color CGColor];
    [self.layer addSublayer:leftBorder];
}

/*!
 *  @brief  画底部边边框
 *
 *  @param width 边框高度
 *  @param color 边框颜色
 */
- (void)bottomBorder:(float)width color:(UIColor*)color
{
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, self.frame.size.height - width, self.frame.size.width, width);
    bottomBorder.backgroundColor = [color CGColor];
    [self.layer addSublayer:bottomBorder];
}

/*!
 *  @brief  画顶部边边框
 *
 *  @param width 边框高度
 *  @param color 边框颜色
 */
- (void)topBorder:(float)width color:(UIColor*)color
{
    CALayer *topBorder = [CALayer layer];
    topBorder.frame = CGRectMake(0.0f, 0.0f, self.frame.size.width, width);
    topBorder.backgroundColor = [color CGColor];
    [self.layer addSublayer:topBorder];
}
@end
