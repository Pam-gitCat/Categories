//
//  UILabel+caculateSize.m
//
//  Created by tom.sun on 16/5/20.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import "UILabel+caculateSize.h"

@implementation UILabel (caculateSize)
/*!
 *  @brief  获取根据文字计算label高度
 *
 *  @return label高度
 */
- (double)getTextHeight
{
    double height = 0.0;
    NSDictionary *attributes = @{NSFontAttributeName:self.font};
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:attributes
                                          context:nil];
    
    height = ceil(rect.size.height);
    return height;
}

/*!
 *  @brief  根据文字计算label宽度
 *
 *  @return label宽度
 */
- (double)getTextWidth
{
    double width = 0.0;
    NSDictionary *attributes = @{NSFontAttributeName:self.font};
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.frame.size.height)
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:attributes
                                          context:nil];
    
    width = ceil(rect.size.width);
    return width;
}

/*!
 *  @brief  富文本类型label高度
 *
 *  @return label高度
 */
- (double)getAttributedTextHeight
{
    double height = 0.0;
    CGRect rect = [self.attributedText boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    height = ceil(rect.size.height);
    return height;
}

/*!
 *  @brief  根据label文字的行间距段间距计算label高度
 *
 *  @param line      行间距
 *  @param paragraph 段间距
 *
 *  @return label高度
 */
- (double)getTextHeightWithLineSpacing:(float)line paragraphSpacing:(float)paragraph
{
    double height = 0.0;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:self.font forKey:NSFontAttributeName];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:line];
    [paragraphStyle setParagraphSpacing:paragraph];
    [dic setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:dic
                                          context:nil];
    
    height = ceil(rect.size.height);
    return height;
}

/*!
 *  @brief  设置label文字的行间距段间距
 *
 *  @param line      行间距
 *  @param paragraph 段间距
 */
- (void)setTextLineSpacing:(float)line paragraphSpacing:(float)paragraph
{
    if (self.text != nil)
    {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:line];
        [paragraphStyle setParagraphSpacing:paragraph];
        
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
        [self setAttributedText:attributedString];
    }
}
@end
