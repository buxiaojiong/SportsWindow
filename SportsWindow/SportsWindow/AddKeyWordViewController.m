//
//  AddKeyWordViewController.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/21.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "AddKeyWordViewController.h"

@interface AddKeyWordViewController ()
{
    UIButton *rightDrawerButton;
}

@end

@implementation AddKeyWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"添加关键词";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIButton *leftDrawerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftDrawerButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftDrawerButton setImageEdgeInsets:UIEdgeInsetsMake(5, -10, -5, 10)];
    [leftDrawerButton addTarget:self action:@selector(backToMainVc:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backBtn = [[UIBarButtonItem alloc] initWithCustomView:leftDrawerButton];
    self.navigationItem.leftBarButtonItem = backBtn;
    
    rightDrawerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [rightDrawerButton setImage:[UIImage imageNamed:@"collectLeft"] forState:UIControlStateNormal];
    [rightDrawerButton setImage:[UIImage imageNamed:@"gou"] forState:UIControlStateSelected];
    [rightDrawerButton setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    [rightDrawerButton addTarget:self action:@selector(collectionList:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:rightDrawerButton];
    rightBtn.style = UIBarButtonItemStylePlain;
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    UITextField *keywordView = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 30, 300, 60)];
    [self.view addSubview:keywordView];
    keywordView.layer.borderColor = [[UIColor grayColor] CGColor];
    keywordView.layer.borderWidth = 0.7;
    keywordView.font = [UIFont systemFontOfSize:20];
    keywordView.backgroundColor = [UIColor whiteColor];
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 20)];
    keywordView.leftView = paddingView;
    keywordView.leftViewMode = UITextFieldViewModeAlways;
}

-(void)backToMainVc:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)collectionList:(UIBarButtonItem *)sender
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
