//
//  CustomLayoutButton.h
//  CustomLayoutButton
//
//  Created by bqlin on 2018/6/23.
//  Copyright © 2018年 Bq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CustomButtonLabelImageLayout) {
    CustomButtonLabelImageLayoutLeftToRight = 0,
    CustomButtonLabelImageLayoutRightToLeft,
    CustomButtonLabelImageLayoutTopToBottom,
    CustomButtonLabelImageLayoutBottomToTop
};

@interface CustomLayoutButton : UIButton

/// 布局类型
@property (nonatomic, assign) IBInspectable NSInteger layoutType;

/// 标签与图片间隔
@property (nonatomic, assign) IBInspectable CGFloat labelImageSpacing;

@end
