//
//  CustomLayoutButton.h
//  CustomLayoutButton
//
//  Created by bqlin on 2018/6/23.
//  Copyright © 2018年 Bq. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 自定义布局类型
 */
typedef NS_ENUM(NSInteger, CustomButtonLabelImageLayout) {
    // 标签、图片从左到右布局
    CustomButtonLabelImageLayoutLeftToRight = 0,
    // 标签、图片从右到左布局
    CustomButtonLabelImageLayoutRightToLeft,
    // 标签、图片从上到下布局
    CustomButtonLabelImageLayoutTopToBottom,
    // 标签、图片从下到上布局
    CustomButtonLabelImageLayoutBottomToTop
};

@interface CustomLayoutButton : UIButton

/**
 布局类型
 */
@property (nonatomic, assign) IBInspectable NSInteger layoutType;

/**
 标签与图片间隔
 */
@property (nonatomic, assign) IBInspectable CGFloat labelImageSpacing;

@end
