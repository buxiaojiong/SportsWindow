//
//  MainViewController.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/15.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "MainViewController.h"
#import <MMDrawerBarButtonItem.h>
#import <UIViewController+MMDrawerController.h>

#import "NotificationViewController.h"
#import "CollectViewController.h"
#import "CommentViewController.h"
#import "OffLineReadViewController.h"
#import "MemberCenterViewController.h"

#import "HeadlinesViewController.h"
#import "AttentionViewController.h"
#import "ColumnViewController.h"

#import <Masonry.h>

@interface MainViewController ()
{
    UIButton *toutiao;
    UIButton *guanzhu;
    UIButton *lanmu;
}

@property (nonatomic,strong) HeadlinesViewController *headlineVc;
@property (nonatomic,strong) AttentionViewController *attentionVc;
@property (nonatomic,strong) ColumnViewController *columnVc;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [self setupLeftMenuButton];
    [self setupRightMenuButtons];

    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(notice:) name:noticeVC object:nil];
    [center addObserver:self selector:@selector(collect:) name:collectVC object:nil];
    [center addObserver:self selector:@selector(comment:) name:commentVC object:nil];
    [center addObserver:self selector:@selector(offLine:) name:offLineVC object:nil];
    [center addObserver:self selector:@selector(memberCt:) name:memberVC object:nil];



}

- (void)viewWillAppear:(BOOL)animated
{

}

- (void)changeTotoutiao
{
    toutiao.selected = YES;
    guanzhu.selected = NO;
    lanmu.selected = NO;
    
    if ([self.view.subviews containsObject:self.attentionVc.view]) {
        [self.attentionVc removeFromParentViewController];
        [self.attentionVc.view removeFromSuperview];
    }
    
    if ([self.view.subviews containsObject:self.columnVc.view]) {
        [self.columnVc removeFromParentViewController];
        [self.columnVc.view removeFromSuperview];
    }
    
    [self addChildViewController:self.headlineVc];
    if (![self.view.subviews containsObject:self.headlineVc.view]) {
        [self.view addSubview:self.headlineVc.view];
        [self.headlineVc.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }

}

- (void)changeToguanzhu
{
    toutiao.selected = NO;
    guanzhu.selected = YES;
    lanmu.selected = NO;
    
    if ([self.view.subviews containsObject:self.headlineVc.view]) {
        [self.headlineVc removeFromParentViewController];
        [self.headlineVc.view removeFromSuperview];
    }
    
    if ([self.view.subviews containsObject:self.columnVc.view]) {
        [self.columnVc removeFromParentViewController];
        [self.columnVc.view removeFromSuperview];
    }

       [self addChildViewController:self.attentionVc];
    if (![self.view.subviews containsObject:self.attentionVc.view]) {
        [self.view addSubview:self.attentionVc.view];
        [self.attentionVc.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }


}

- (void)changeTolanmu
{
    toutiao.selected = NO;
    guanzhu.selected = NO;
    lanmu.selected = YES;
    
    if ([self.view.subviews containsObject:self.headlineVc.view]) {
        [self.headlineVc removeFromParentViewController];
        [self.headlineVc.view removeFromSuperview];
    }
    
    if ([self.view.subviews containsObject:self.attentionVc.view]) {
        [self.attentionVc removeFromParentViewController];
        [self.attentionVc.view removeFromSuperview];
    }
    
    [self addChildViewController:self.columnVc];
    if (![self.view.subviews containsObject:self.columnVc.view]) {
        [self.view addSubview:self.columnVc.view];
        [self.columnVc.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    
}

-(void)setupLeftMenuButton{
    UIButton *leftDrawerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftDrawerButton setImage:[UIImage imageNamed:@"gfg"] forState:UIControlStateNormal];
    [leftDrawerButton setImageEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
    [leftDrawerButton addTarget:self action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backBtn = [[UIBarButtonItem alloc] initWithCustomView:leftDrawerButton];
    self.navigationItem.leftBarButtonItem = backBtn;
}

- (void)setupRightMenuButtons
{
    toutiao = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 76, 32)];
    [toutiao setImage:[UIImage imageNamed:@"toutiao2"] forState:UIControlStateNormal];
    [toutiao setImage:[UIImage imageNamed:@"toutiaoseled"] forState:UIControlStateSelected];
    [toutiao addTarget:self action:@selector(changeTotoutiao) forControlEvents:UIControlEventTouchUpInside];
    [toutiao setImageEdgeInsets:UIEdgeInsetsMake(0, 14, 0, -14)];
    UIBarButtonItem * headLineBtn = [[UIBarButtonItem alloc] initWithCustomView:toutiao];
    
    
    guanzhu = [[UIButton alloc] initWithFrame:CGRectMake( 0, 0, 76, 32)];
    [guanzhu setImage:[UIImage imageNamed:@"guanzhu"] forState:UIControlStateNormal];
    [guanzhu setImage:[UIImage imageNamed:@"guanzhuseled"] forState:UIControlStateSelected];
    [guanzhu addTarget:self action:@selector(changeToguanzhu) forControlEvents:UIControlEventTouchUpInside];
    [guanzhu setImageEdgeInsets:UIEdgeInsetsMake(0, 7, 0, -7)];
     UIBarButtonItem * attentionBtn = [[UIBarButtonItem alloc] initWithCustomView:guanzhu];
    
    
    lanmu = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 76, 32)];
    [lanmu setImage:[UIImage imageNamed:@"lanmu"] forState:UIControlStateNormal];
    [lanmu setImage:[UIImage imageNamed:@"lanmuseled"] forState:UIControlStateSelected];
    [lanmu addTarget:self action:@selector(changeTolanmu) forControlEvents:UIControlEventTouchUpInside];
     UIBarButtonItem * columnBtn = [[UIBarButtonItem alloc] initWithCustomView:lanmu];
    
    [self changeTotoutiao];
    
    self.navigationItem.rightBarButtonItems = @[columnBtn,attentionBtn,headLineBtn];
}

-(void)notice:(id)sender{
    NotificationViewController *nextVc = [[NotificationViewController alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
}

-(void)collect:(id)sender{
    CollectViewController *nextVc = [[CollectViewController alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
}

-(void)comment:(id)sender{
    CommentViewController *nextVc = [[CommentViewController alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
}

-(void)offLine:(id)sender{
    OffLineReadViewController *nextVc = [[OffLineReadViewController alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
}

- (void)memberCt:(id)sender{
    MemberCenterViewController *nextVc = [[MemberCenterViewController alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
}

- (HeadlinesViewController *)headlineVc
{
    if (!_headlineVc) {
        _headlineVc = [[HeadlinesViewController alloc] init];
    }
    return _headlineVc;
}

- (AttentionViewController *)attentionVc
{
    if (!_attentionVc) {
        _attentionVc = [[AttentionViewController alloc] init];
    }
    return _attentionVc;
}

- (ColumnViewController *)columnVc
{
    if (!_columnVc) {
        _columnVc = [[ColumnViewController alloc] init];
    }
    return _columnVc;
}

#pragma mark - Button Handlers
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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
