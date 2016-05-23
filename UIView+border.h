//
//  UIView+border.h
//
//  Created by tom.sun on 16/5/20.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (border)
- (void)circular;
- (void)drawBorder:(float)width color:(UIColor*)color;
- (void)drawRadius:(float)cornerRadius;
- (void)drawBoarder:(float)width color:(UIColor*)color radius:(float)cornerRadius;
- (void)drawRightBorder:(float)width color:(UIColor*)color;
- (void)drawLeftBorder:(float)width color:(UIColor*)color;
- (void)bottomBorder:(float)width color:(UIColor*)color;
- (void)topBorder:(float)width color:(UIColor*)color;
@end
