//
//  BXAlterView.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/19.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXAlterView.h"

@implementation BXAlterView


- (void)drawRect:(CGRect)rect {
    NSArray *dashArray = [NSArray arrayWithObjects:@2,@2,nil];
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    CAShapeLayer *lineLayer = [[CAShapeLayer alloc] init];
    lineLayer.lineCap = kCALineCapRound;
    [lineLayer setLineDashPattern:dashArray];
    lineLayer.strokeColor = [UIColor grayColor].CGColor;
    lineLayer.lineWidth = 1;
    [self.layer addSublayer:lineLayer];
    [linePath moveToPoint:CGPointMake(20, 20)];
    [linePath addLineToPoint:CGPointMake(self.frame.size.width-20, 20)];
    lineLayer.path = linePath.CGPath;
    
    UIBezierPath *linePath2 = [UIBezierPath bezierPath];
    CAShapeLayer *lineLayer2 = [[CAShapeLayer alloc] init];
    lineLayer2.lineCap = kCALineCapRound;
    [lineLayer2 setLineDashPattern:dashArray];
    lineLayer2.strokeColor = [UIColor grayColor].CGColor;
    lineLayer2.lineWidth = 1;
    [self.layer addSublayer:lineLayer2];
    [linePath2 moveToPoint:CGPointMake(20, self.frame.size.height-20)];
    [linePath2 addLineToPoint:CGPointMake(self.frame.size.width-20, self.frame.size.height-20)];
    lineLayer2.path = linePath2.CGPath;
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
}


@end
