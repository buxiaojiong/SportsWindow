//
//  UserNameViewController.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/19.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "UserNameViewController.h"

@interface UserNameViewController ()

@end

@implementation UserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"用户名";
    
    UIButton *leftDrawerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftDrawerButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftDrawerButton setImageEdgeInsets:UIEdgeInsetsMake(5, -10, -5, 10)];
    [leftDrawerButton addTarget:self action:@selector(backToMainVc:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backBtn = [[UIBarButtonItem alloc] initWithCustomView:leftDrawerButton];
    self.navigationItem.leftBarButtonItem = backBtn;
    
    UIButton *rightDrawerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [rightDrawerButton setImage:[UIImage imageNamed:@"gou"] forState:UIControlStateNormal];
    [rightDrawerButton setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    [rightDrawerButton addTarget:self action:@selector(saveNewUsername:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:rightDrawerButton];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    UITextField *nameView = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 30, 300, 60)];
    [self.view addSubview:nameView];
    nameView.text = self.name;
    nameView.layer.borderColor = [[UIColor grayColor] CGColor];
    nameView.layer.borderWidth = 0.7;
    nameView.font = [UIFont systemFontOfSize:20];
    nameView.backgroundColor = [UIColor whiteColor];
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 20)];
    nameView.leftView = paddingView;
    nameView.leftViewMode = UITextFieldViewModeAlways;
    
    UILabel *test = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 100, 300, 41)];
    [self.view addSubview:test];
    test.backgroundColor = [UIColor clearColor];
    test.text = @"用户名中可以包含英文，中文，数字，以及下划线_。用户名长度在4-30个字符内";
    test.textColor = [UIColor grayColor];
    test.textAlignment = NSTextAlignmentLeft;
    test.numberOfLines = 0;
    test.font = [UIFont systemFontOfSize:14];
}

-(void)backToMainVc:(id)sender{
    //    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //    MainViewController *mainVc = [[MainViewController alloc] init];
    //    [appDelegate.drawerController setCenterViewController:mainVc];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveNewUsername:(id)sender
{
    
}

- (void)dealloc
{
    
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
