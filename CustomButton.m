//
//  CustomButton.m
//  ss
//
//  Created by tom.sun on 16/5/20.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import "CustomButton.h"

#define btnWidth self.bounds.size.width
#define btnHeight self.bounds.size.height
#define labelWidth self.titleLabel.bounds.size.width
#define labelHeight self.titleLabel.bounds.size.height
#define imageWidth self.imageView.bounds.size.width
#define imageHeight self.imageView.bounds.size.height
#define space 4

@implementation CustomButton
- (id)initWithFrame:(CGRect)frame alignmentStatus:(ButtonAlignmentStatus)status
{
    self = [super initWithFrame:frame];
    if (self) {
        _status = status;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    // 判断
    if (_status == ButtonAlignmentStatusBottom) {
        [self alignmentBottom];
    }
    else if (_status == ButtonAlignmentStatusTop){
        [self alignmentTop];
    }
    else if (_status == ButtonAlignmentStatusLeft){
        [self alignmentLeft];
    }
    else if (_status == ButtonAlignmentStatusRight){
        [self alignmentRight];
    }
}

- (void)alignmentTop{
    // 计算文本的的宽度
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = self.titleLabel.font;
    CGRect frame = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dictM context:nil];
    
    CGFloat imageX = (btnWidth - imageWidth) * 0.5;
    self.imageView.frame = CGRectMake(imageX, btnHeight * 0.5 - (imageHeight + labelHeight + space) * 0.5, imageWidth, imageHeight);
    self.titleLabel.frame = CGRectMake((self.center.x - frame.size.width) * 0.5, self.imageView.frame.origin.y + imageHeight + space, labelWidth, labelHeight);
    CGPoint labelCenter = self.titleLabel.center;
    labelCenter.x = self.imageView.center.x;
    self.titleLabel.center = labelCenter;
}

#pragma mark - 图标在下，文本在上(居中)
- (void)alignmentBottom{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    // 计算文本的的宽度
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = self.titleLabel.font;
    CGRect frame = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dictM context:nil];
    
    CGFloat imageX = (btnWidth - imageWidth) * 0.5;
    self.titleLabel.frame = CGRectMake((self.center.x - frame.size.width) * 0.5, btnHeight * 0.5 - (imageHeight + labelHeight + space) * 0.5, labelWidth, labelHeight);
    self.imageView.frame = CGRectMake(imageX,  self.titleLabel.frame.origin.y + labelHeight + space, imageWidth,imageHeight);
    CGPoint labelCenter = self.titleLabel.center;
    labelCenter.x = self.imageView.center.x;
    self.titleLabel.center = labelCenter;
}

#pragma mark - 图标在左，文本在右(居中)
- (void)alignmentLeft
{
    CGFloat imageX = (btnWidth - labelWidth - imageWidth - space) / 2;
    CGRect imageFrame = self.imageView.frame;
    CGRect labelFrame = self.titleLabel.frame;
    imageFrame.origin.x = imageX;
    CGFloat labelX = imageX + imageFrame.size.width + space;
    labelFrame.origin.x = labelX;
    self.titleLabel.frame = labelFrame;
    self.imageView.frame = imageFrame;
}

#pragma mark - 图标在右，文本在左(居中)
- (void)alignmentRight
{
    CGFloat labelX = (btnWidth - labelWidth - imageWidth - space) / 2;
    CGRect imageFrame = self.imageView.frame;
    CGRect labelFrame = self.titleLabel.frame;
    labelFrame.origin.x = labelX;
    CGFloat imageX = labelX + imageFrame.size.width + space;
    labelFrame.origin.x = imageX;
    self.titleLabel.frame = labelFrame;
    self.imageView.frame = imageFrame;
}

@end
