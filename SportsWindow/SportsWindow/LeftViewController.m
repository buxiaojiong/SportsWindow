//
//  LeftViewController.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/15.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "LeftViewController.h"
#import "AppDelegate.h"
#import "NotificationViewController.h"
#import "CollectViewController.h"
#import "CommentViewController.h"
#import "OffLineReadViewController.h"
#import <MMPlaceHolder.h>
#import "LeftTableViewCell.h"
#import "SignInView.h"


@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *headView;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:29/255.0 green:29/255.0 blue:29/255.0 alpha:1.0];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.scrollEnabled = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 200)];
    SignInView *signInView = [[SignInView alloc] initWithFrame:CGRectMake(0, 20, 250, 200)];
    signInView.backgroundColor = [UIColor clearColor];
    [_headView addSubview:signInView];
    _tableView.tableHeaderView = _headView;
    
    _tableView.tableHeaderView.backgroundColor = [UIColor clearColor];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section) {
        case 1:
            return 3;
        case 2:
            return 1;
        default:
            return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[LeftTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        cell.contentView.backgroundColor = [UIColor colorWithRed:29/255.0 green:29/255.0 blue:29/255.0 alpha:1.0];
        
        UIView *backGround = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 58)];
        backGround.backgroundColor = [UIColor colorWithRed:66/255.0 green:66/255.0 blue:66/255.0 alpha:1.0];
        [cell.contentView addSubview:backGround];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 60, 59)];
        imgView.backgroundColor = [UIColor colorWithRed:29/255.0 green:29/255.0 blue:29/255.0 alpha:0.6];
        [backGround addSubview:imgView];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(100, (60-30)/2, 120, 30)];
        title.backgroundColor = [UIColor clearColor];
        title.textColor = [UIColor colorWithRed:178/255.0 green:178/255.0 blue:178/255.0 alpha:1.0];
        [backGround addSubview:title];
        
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                title.text = @"通知";
                imgView.image = [UIImage imageNamed:@"notification"];
                
                CGPoint center = CGPointMake(220, 30);
                UIBezierPath *linePath = [UIBezierPath bezierPath];
                CAShapeLayer *lineLayer = [[CAShapeLayer alloc] init];
                lineLayer.strokeColor = [UIColor redColor].CGColor;
                lineLayer.fillColor = [UIColor redColor].CGColor;
                [backGround.layer addSublayer:lineLayer];
                [linePath moveToPoint:center];
                [linePath addArcWithCenter:center radius:9 startAngle:0.0 endAngle:M_PI * 2 clockwise:YES];
                lineLayer.path = linePath.CGPath;
                
                UILabel *num = [[UILabel alloc] initWithFrame:CGRectMake(213.5, 23.5, 0, 0)];
                num.text = @"22";
                num.font = [UIFont systemFontOfSize:10];
                num.textColor = [UIColor whiteColor];
                [num sizeToFit];
                [backGround addSubview:num];
                
            }
            else if (indexPath.row == 1){
                title.text = @"我的收藏";
                imgView.image = [UIImage imageNamed:@"collection"];
                
            }
            else if (indexPath.row == 2){
                title.text = @"我的评论";
                imgView.image = [UIImage imageNamed:@"comment"];
            }
        }
        else if (indexPath.section == 2){
            title.text = @"离线阅读";
            imgView.image = [UIImage imageNamed:@"offlineread"];
        }
    }
    

    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    switch (section) {
        case 1:
            return 3;
        case 2:
            return 0;
        default:
            return 0;
    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate.drawerController closeDrawerAnimated:YES completion:nil];
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            NSNotification * notice = [NSNotification notificationWithName:noticeVC object:nil userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:notice];
        }
        else if (indexPath.row == 1){
            NSNotification * notice = [NSNotification notificationWithName:collectVC object:nil userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:notice];
        }
        else if (indexPath.row == 2){
            NSNotification * notice = [NSNotification notificationWithName:commentVC object:nil userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:notice];
        }
    }
    else if (indexPath.section == 2){
        NSNotification * notice = [NSNotification notificationWithName:offLineVC object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notice];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
