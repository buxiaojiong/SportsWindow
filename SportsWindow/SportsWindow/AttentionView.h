//
//  AttentionView.h
//  SportsWindow
//
//  Created by sourcecode on 16/1/21.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol attentionDelegate <NSObject>

- (void)junmToAddKeyWordView;

@end

@interface AttentionView : UIView

@property (nonatomic ,assign) id<attentionDelegate> delegate;

@end
