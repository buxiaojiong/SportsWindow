//
//  BXButton.h
//  SportsWindow
//
//  Created by jojojiong on 16/1/19.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, BXBtnSide) {
    BXBtnSideLeft  = 1 << 0,
    BXBtnSideRight = 1 << 1,
};

@interface BXButton : UIButton

@property (nonatomic, assign) int side;

@end
