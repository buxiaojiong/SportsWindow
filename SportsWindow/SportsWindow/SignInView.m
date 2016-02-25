//
//  SignInView.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/19.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "SignInView.h"
#import "AppDelegate.h"

@implementation SignInView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    // add subviews
        NSArray *dashArray = [NSArray arrayWithObjects:@2,@2,nil];
        
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        _lineLayer = [[CAShapeLayer alloc] init];
        _lineLayer.lineCap = kCALineCapRound;
        [_lineLayer setLineDashPattern:dashArray];
        _lineLayer.strokeColor = [UIColor grayColor].CGColor;
        _lineLayer.lineWidth = 1;
        [self.layer addSublayer:_lineLayer];
        [linePath moveToPoint:CGPointMake(20, 20)];
        [linePath addLineToPoint:CGPointMake(self.frame.size.width-20, 20)];
        _lineLayer.path = linePath.CGPath;
        
        UIBezierPath *linePath2 = [UIBezierPath bezierPath];
        _lineLayer2 = [[CAShapeLayer alloc] init];
        _lineLayer2.lineCap = kCALineCapRound;
        [_lineLayer2 setLineDashPattern:dashArray];
        _lineLayer2.strokeColor = [UIColor grayColor].CGColor;
        _lineLayer2.lineWidth = 1;
        [self.layer addSublayer:_lineLayer2];
        [linePath2 moveToPoint:CGPointMake(20, self.frame.size.height-30)];
        [linePath2 addLineToPoint:CGPointMake(self.frame.size.width-20, self.frame.size.height-30)];
        _lineLayer2.path = linePath2.CGPath;
        
        _title = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.frame.size.width, 20)];
        _title.text = @"登陆";
        _title.textColor = [UIColor colorWithRed:178/255.0 green:178/255.0 blue:178/255.0 alpha:1.0];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.font = [UIFont systemFontOfSize:17];
        [self addSubview:_title];
        
        _weichart = [[UIButton alloc] initWithFrame:CGRectMake(20, 70, 67, 70)];
        [_weichart setImage:[UIImage imageNamed:@"weiChart"] forState:UIControlStateNormal];
        [_weichart setBackgroundColor:[UIColor colorWithRed:66/255.0 green:66/255.0 blue:66/255.0 alpha:1.0]];
        [_weichart addTarget: self action:@selector(weichartSignIn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_weichart];
        
        _weibo = [[UIButton alloc] initWithFrame:CGRectMake(20+67+5, 70, 67, 70)];
        [_weibo setImage:[UIImage imageNamed:@"weiBo"] forState:UIControlStateNormal];
        [_weibo setBackgroundColor:[UIColor colorWithRed:66/255.0 green:66/255.0 blue:66/255.0 alpha:1.0]];
        [_weibo addTarget: self action:@selector(weiboSignIn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_weibo];
        
        _qq = [[UIButton alloc] initWithFrame:CGRectMake(20+67+5+67+5, 70, 67, 70)];
        [_qq setImage:[UIImage imageNamed:@"qqImage"] forState:UIControlStateNormal];
        [_qq setBackgroundColor:[UIColor colorWithRed:66/255.0 green:66/255.0 blue:66/255.0 alpha:1.0]];
        [_qq addTarget: self action:@selector(qqtSignIn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_qq];
        
        
        
        
    }
    return self;
}

- (void)weichartSignIn:(id)sender
{
    [self.lineLayer removeFromSuperlayer];
    [self.lineLayer2 removeFromSuperlayer];
    [self.title removeFromSuperview];
    [self.weichart removeFromSuperview];
    [self.weibo removeFromSuperview];
    [self.qq removeFromSuperview];
    
    UIButton *headImage = [[UIButton alloc] initWithFrame:CGRectMake((self.frame.size.width-100)/2, (self.frame.size.height-100)/2, 100, 100)];
    headImage.backgroundColor = [UIColor grayColor];
    [headImage addTarget:self action:@selector(jumpToMemberCenter) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:headImage];
}

- (void)weiboSignIn:(id)sender
{
    
}

- (void)qqtSignIn:(id)sender
{
    
}

- (void)jumpToMemberCenter
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate.drawerController closeDrawerAnimated:YES completion:nil];
    NSNotification * notice = [NSNotification notificationWithName:memberVC object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notice];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
   

    
    
}


@end
