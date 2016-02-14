//
//  LeftTableViewCell.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/15.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "LeftTableViewCell.h"

@implementation LeftTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
//    CGRect frame = CGRectMake(100, 0, 10, 10);
//    /*画填充圆
//     */
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    [[UIColor whiteColor] set];
//    CGContextFillRect(context, rect);
//    
//    CGContextAddEllipseInRect(context, frame);
//    [[UIColor orangeColor] set];
//    CGContextFillPath(context);
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
