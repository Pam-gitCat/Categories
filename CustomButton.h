//
//  CustomButton.h
//  ss
//
//  Created by tom.sun on 16/5/20.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    ButtonAlignmentStatusBottom,// 图标在下，文本在上(居中)
    ButtonAlignmentStatusTop,// 图标在上，文本在下(居中)
    ButtonAlignmentStatusLeft,//图标在左，文本在右(居中)
    ButtonAlignmentStatusRight//图标在右，文本在左(居中)
}ButtonAlignmentStatus;

@interface CustomButton : UIButton
@property (nonatomic,assign)ButtonAlignmentStatus status;

- (id)initWithFrame:(CGRect)frame alignmentStatus:(ButtonAlignmentStatus)status;
@end
