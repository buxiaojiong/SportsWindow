

//
//  BXButton.m
//  SportsWindow
//
//  Created by jojojiong on 16/1/19.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXButton.h"

@implementation BXButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath *maskPath;
    if (self.side == BXBtnSideLeft) {
        maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                        byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft
                                                              cornerRadii:CGSizeMake(7, 7)];
    }
    else if (self.side == BXBtnSideRight){
        maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                         byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight
                                               cornerRadii:CGSizeMake(7, 7)];
    }

    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;

}


@end
