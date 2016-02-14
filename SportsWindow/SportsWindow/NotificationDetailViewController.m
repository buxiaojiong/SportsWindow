//
//  NotificationDetailViewController.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/18.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "NotificationDetailViewController.h"

@interface NotificationDetailViewController ()

@end

@implementation NotificationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIButton *leftDrawerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftDrawerButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftDrawerButton setImageEdgeInsets:UIEdgeInsetsMake(5, -10, -5, 10)];
    [leftDrawerButton addTarget:self action:@selector(backToNotificationView:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backBtn = [[UIBarButtonItem alloc] initWithCustomView:leftDrawerButton];
    self.navigationItem.leftBarButtonItem = backBtn;
    
    UILabel *nociafTitle = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 10, 300, 40)];
    nociafTitle.backgroundColor = [UIColor clearColor];
    [self.view addSubview:nociafTitle];
    nociafTitle.text = @"通知标题通知标题";
    nociafTitle.textAlignment = NSTextAlignmentCenter;
    nociafTitle.font = [UIFont systemFontOfSize:16];
    
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 30, 300, 40)];
    timeLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:timeLabel];
    timeLabel.text = @"2014.04.04";
    timeLabel.textColor = [UIColor grayColor];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.font = [UIFont systemFontOfSize:10];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 90, 300, 0)];
    [self.view addSubview:contentLabel];
    contentLabel.numberOfLines = 0;
    contentLabel.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    contentLabel.backgroundColor = [UIColor clearColor];
    contentLabel.font = [UIFont systemFontOfSize:14];
    [contentLabel sizeToFit];
    
}

- (void)backToNotificationView:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
