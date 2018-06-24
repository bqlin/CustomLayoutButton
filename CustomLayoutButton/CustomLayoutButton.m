//
//  CustomLayoutButton.m
//  CustomLayoutButton
//
//  Created by bqlin on 2018/6/23.
//  Copyright © 2018年 Bq. All rights reserved.
//

#import "CustomLayoutButton.h"

@interface CustomLayoutButton ()

@property (nonatomic, assign) CGSize imageSize;
@property (nonatomic, assign) CGSize labelSize;

@end

@implementation CustomLayoutButton

- (void)layoutSubviews {
	[super layoutSubviews];
	
	const CGSize imageSize = self.imageView.intrinsicContentSize;
	const CGSize labelSize = self.titleLabel.intrinsicContentSize;
	const CGFloat haftSpacing = _labelImageSpacing / 2;
	
	UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
	UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
	
	switch (_layoutType) {
		case CustomButtonLabelImageLayoutLeftToRight:{
			labelEdgeInsets = UIEdgeInsetsMake(0, haftSpacing, 0, -haftSpacing);
			imageEdgeInsets = UIEdgeInsetsMake(0, -haftSpacing, 0, haftSpacing);
		} break;
		case CustomButtonLabelImageLayoutRightToLeft:{
			const CGFloat labelLeftInset = -imageSize.width - haftSpacing;
			labelEdgeInsets = UIEdgeInsetsMake(0, labelLeftInset, 0, -labelLeftInset);
			const CGFloat imageLeftInset = labelSize.width + haftSpacing;
			imageEdgeInsets = UIEdgeInsetsMake(0, imageLeftInset, 0, -imageLeftInset);
		} break;
		case CustomButtonLabelImageLayoutTopToBottom:{
			labelEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, -imageSize.height - haftSpacing, 0);
			imageEdgeInsets = UIEdgeInsetsMake(-labelSize.height - haftSpacing, 0, 0, -labelSize.width);
		} break;
		case CustomButtonLabelImageLayoutBottomToTop:{
			labelEdgeInsets = UIEdgeInsetsMake(-imageSize.height - haftSpacing, -imageSize.width, 0, 0);
			imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelSize.height - haftSpacing, -labelSize.width);
		} break;
	}
	self.titleEdgeInsets = labelEdgeInsets;
	self.imageEdgeInsets = imageEdgeInsets;
}

- (CGSize)intrinsicContentSize {
	CGSize contentSize = CGSizeZero;
	
	const CGSize imageSize = self.imageView.intrinsicContentSize;
	const CGSize labelSize = self.titleLabel.intrinsicContentSize;
	
    switch (self.layoutType) {
        case CustomButtonLabelImageLayoutLeftToRight:
        case CustomButtonLabelImageLayoutRightToLeft:{
			contentSize.height = MAX(imageSize.height, labelSize.height);
			contentSize.width = imageSize.width + labelSize.width + _labelImageSpacing;
        } break;
        case CustomButtonLabelImageLayoutTopToBottom:
        case CustomButtonLabelImageLayoutBottomToTop:{
			contentSize.height = imageSize.height + labelSize.height + _labelImageSpacing;
			contentSize.width = MAX(imageSize.width, labelSize.width);
        } break;
    }
	contentSize.width += self.contentEdgeInsets.left + self.contentEdgeInsets.right;
	contentSize.height += self.contentEdgeInsets.top + self.contentEdgeInsets.bottom;
	
    return contentSize;
}

@end
