//
//  UILabel+caculateSize.h
//
//  Created by tom.sun on 16/5/20.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (caculateSize)
- (double)getTextHeight;
- (double)getTextWidth;
- (double)getAttributedTextHeight;
- (double)getTextHeightWithLineSpacing:(float)line paragraphSpacing:(float)paragraph;
- (void)setTextLineSpacing:(float)line paragraphSpacing:(float)paragraph;
@end
