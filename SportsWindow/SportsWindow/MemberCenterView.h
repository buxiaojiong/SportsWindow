//
//  MemberCenterView.h
//  SportsWindow
//
//  Created by sourcecode on 16/2/19.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UserNameBtnBlock)(NSString *name);

@interface MemberCenterView : UIScrollView

@property (nonatomic, copy) UserNameBtnBlock userNameBtnBlock;

@end
