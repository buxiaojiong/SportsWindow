//
//  MemberCenterViewController.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/15.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "MemberCenterViewController.h"
#import "UserNameViewController.h"

@interface MemberCenterViewController ()

@end

@implementation MemberCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    self.title = @"账户设置";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backToMainVc:)];
    [self.navigationItem setLeftBarButtonItem:leftItem animated:YES];
    
    UIButton *leftDrawerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftDrawerButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftDrawerButton setImageEdgeInsets:UIEdgeInsetsMake(5, -10, -5, 10)];
    [leftDrawerButton addTarget:self action:@selector(backToMainVc:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backBtn = [[UIBarButtonItem alloc] initWithCustomView:leftDrawerButton];
    self.navigationItem.leftBarButtonItem = backBtn;
    
    UIScrollView *backGroundView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    backGroundView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [self.view addSubview:backGroundView];
    
    //个人信息
    UILabel *personInfo = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 40, 300, 41)];
    personInfo.layer.borderColor = [[UIColor grayColor] CGColor];
    personInfo.layer.borderWidth = 0.7;
    [backGroundView addSubview:personInfo];
    personInfo.backgroundColor = [UIColor whiteColor];
    personInfo.text = @"个人信息";
    personInfo.textColor = [UIColor grayColor];
    personInfo.textAlignment = NSTextAlignmentCenter;
    personInfo.font = [UIFont systemFontOfSize:14];
    
    UIView *nameLabel = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 40+40, 300, 50)];
    [backGroundView addSubview:nameLabel];
    nameLabel.backgroundColor = [UIColor whiteColor];
    nameLabel.layer.borderColor = [[UIColor grayColor] CGColor];
    nameLabel.layer.borderWidth = 0.7;
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 100, 30)];
    name.text = @"用户名";
    name.font = [UIFont systemFontOfSize:14];
    [nameLabel addSubview:name];

    
    UIButton *userName = [[UIButton alloc] initWithFrame:CGRectMake(300-100, 10, 100, 30)];
    [userName setTitle:@"张三张三" forState:UIControlStateNormal];
    userName.titleLabel.font = [UIFont systemFontOfSize:14];
    [userName setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [userName setTitleEdgeInsets:UIEdgeInsetsMake(0, 15, 0, -15)];
    [nameLabel addSubview:userName];
    [userName addTarget:self action:@selector(changeTheUserName:) forControlEvents:UIControlEventTouchUpInside];

    
    UIView *headImg = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 40+40+49, 300, 50)];
    [backGroundView addSubview:headImg];
    headImg.backgroundColor = [UIColor whiteColor];
    headImg.layer.borderColor = [[UIColor grayColor] CGColor];
    headImg.layer.borderWidth = 0.7;
    
    UILabel *heard = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 100, 30)];
    heard.text = @"头像";
    heard.font = [UIFont systemFontOfSize:14];
    [headImg addSubview:heard];
    
    UIImageView *headimage = [[UIImageView alloc] initWithFrame:CGRectMake(300-50, 5, 40, 40)];
    headimage.backgroundColor = [UIColor grayColor];
    [headImg addSubview:headimage];
    
    //登陆绑定
    UILabel *signIn = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 40+40+49+50+20, 300, 41)];
    signIn.layer.borderColor = [[UIColor grayColor] CGColor];
    signIn.layer.borderWidth = 0.7;
    [backGroundView addSubview:signIn];
    signIn.backgroundColor = [UIColor whiteColor];
    signIn.text = @"登陆绑定";
    signIn.textColor = [UIColor grayColor];
    signIn.textAlignment = NSTextAlignmentCenter;
    signIn.font = [UIFont systemFontOfSize:14];
    
    UIView *weiBoView = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 40+40+49+50+20+40, 300, 50)];
    [backGroundView addSubview:weiBoView];
    weiBoView.backgroundColor = [UIColor whiteColor];
    weiBoView.layer.borderColor = [[UIColor grayColor] CGColor];
    weiBoView.layer.borderWidth = 0.7;
    
    UILabel *weiboLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 100, 30)];
    weiboLabel.text = @"微博";
    weiboLabel.font = [UIFont systemFontOfSize:14];
    [weiBoView addSubview:weiboLabel];
    
    UIButton *weiboBtn = [[UIButton alloc] initWithFrame:CGRectMake(300-30, 15, 20, 20)];
    [weiboBtn setImage:[UIImage imageNamed:@"xukuang"] forState:UIControlStateNormal];
    [weiboBtn setImage:[UIImage imageNamed:@"xukaung_gou"] forState:UIControlStateSelected];
    [weiBoView addSubview:weiboBtn];
    
    UIView *weiXin = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 40+40+49+50+20+40+49, 300, 50)];
    [backGroundView addSubview:weiXin];
    weiXin.backgroundColor = [UIColor whiteColor];
    weiXin.layer.borderColor = [[UIColor grayColor] CGColor];
    weiXin.layer.borderWidth = 0.7;
    
    UILabel *weixinLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 100, 30)];
    weixinLabel.text = @"微信";
    weixinLabel.font = [UIFont systemFontOfSize:14];
    [weiXin addSubview:weixinLabel];
    
    UIButton *weixinBtn = [[UIButton alloc] initWithFrame:CGRectMake(300-30, 15, 20, 20)];
    [weixinBtn setImage:[UIImage imageNamed:@"xukuang"] forState:UIControlStateNormal];
    [weixinBtn setImage:[UIImage imageNamed:@"xukaung_gou"] forState:UIControlStateSelected];
    [weiXin addSubview:weixinBtn];
    
    UIView *Qq = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 40+40+49+50+20+40+49+49, 300, 50)];
    [backGroundView addSubview:Qq];
    Qq.backgroundColor = [UIColor whiteColor];
    Qq.layer.borderColor = [[UIColor grayColor] CGColor];
    Qq.layer.borderWidth = 0.7;
    
    UILabel *qqLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 100, 30)];
    qqLabel.text = @"QQ";
    qqLabel.font = [UIFont systemFontOfSize:14];
    [Qq addSubview:qqLabel];
    
    UIButton *qqBtn = [[UIButton alloc] initWithFrame:CGRectMake(300-30, 15, 20, 20)];
    [qqBtn setImage:[UIImage imageNamed:@"xukuang"] forState:UIControlStateNormal];
    [qqBtn setImage:[UIImage imageNamed:@"xukaung_gou"] forState:UIControlStateSelected];
    [Qq addSubview:qqBtn];
    
    UIButton *signOut = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 40+40+49+50+20+40+49+49+50+30, 300, 40)];
    [signOut setTitle:@"退出账号" forState:UIControlStateNormal];
    signOut.backgroundColor = [UIColor colorWithRed:183/255.0 green:7/255.0 blue:16/255.0 alpha:1.0];
    [backGroundView addSubview:signOut];
    
    backGroundView.contentSize = CGSizeMake(self.view.frame.size.width, 600);
    
    weixinBtn.selected = YES;
    qqBtn.selected = YES;
    
}

- (void)changeTheUserName:(UIButton *)sender
{
    UserNameViewController *nextVc = [[UserNameViewController alloc] init];
    nextVc.name = sender.titleLabel.text;
    [self.navigationController pushViewController:nextVc animated:YES];
}

-(void)backToMainVc:(id)sender{
    //    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //    MainViewController *mainVc = [[MainViewController alloc] init];
    //    [appDelegate.drawerController setCenterViewController:mainVc];
    
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
