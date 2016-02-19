//
//  OffLineReadViewController.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/15.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "OffLineReadViewController.h"
#import <Masonry.h>
#import <MMPlaceHolder.h>
#import "BXButton.h"
#import "BXAlterView.h"
#import "OffLineDetailViewController.h"

#define kColorWithRGB(r, g, b) [UIColor colorWithRed:(r) / 255.f green:(g) / 255.f blue:(b) / 255.f alpha:1.f]

@interface OffLineReadViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>

{
    UIButton *attentionBtn;
    UIButton *allBtn;
    UIButton *otBtn;
    UIButton *tfBtn;
    UIView *cover;
    BXAlterView *alterView;
    UIView *headView;
    UIView *downLoadHeadView;
}
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation OffLineReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"离线阅读";
    
    UIButton *leftDrawerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftDrawerButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftDrawerButton setImageEdgeInsets:UIEdgeInsetsMake(5, -10, -5, 10)];
    [leftDrawerButton addTarget:self action:@selector(backToMainVc:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backBtn = [[UIBarButtonItem alloc] initWithCustomView:leftDrawerButton];
    self.navigationItem.leftBarButtonItem = backBtn;
    
    UIButton *rightDrawerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [rightDrawerButton setImage:[UIImage imageNamed:@"deletright"] forState:UIControlStateNormal];
    [rightDrawerButton setImageEdgeInsets:UIEdgeInsetsMake(-3, 10, 3, -10)];
    [rightDrawerButton addTarget:self action:@selector(deleledowned:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc] initWithCustomView:rightDrawerButton];
    self.navigationItem.rightBarButtonItem = leftBtn;
    
    headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 32)];
    headView.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0];
    [self.view addSubview:headView];
    
    UILabel *sortLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 9, 0, 0)];
    sortLabel.text = @"更新";
    sortLabel.font = [UIFont systemFontOfSize:12];
    [sortLabel sizeToFit];
    [headView addSubview:sortLabel];
    
    UIButton *updataBtn = [[UIButton alloc] initWithFrame:CGRectMake(headView.frame.size.width - 35, 4, 24, 24)];
    [updataBtn setImage:[UIImage imageNamed:@"refreshBtn"] forState:UIControlStateNormal];
    [headView addSubview:updataBtn];
    [updataBtn addTarget:self action:@selector(refreshDownLoad:) forControlEvents:UIControlEventTouchUpInside];
    
    
    attentionBtn = [[UIButton alloc] initWithFrame:CGRectMake(updataBtn.frame.origin.x - 60, 4, 52, 24)];
    attentionBtn.backgroundColor = [UIColor redColor];
    [headView addSubview:attentionBtn];
    
    attentionBtn.backgroundColor = kColorWithRGB(204, 204, 204);
    [attentionBtn setTitle:@"仅关注" forState:UIControlStateNormal];
    [attentionBtn setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
    [attentionBtn setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
    [attentionBtn addTarget:self action:@selector(attentionBtned:) forControlEvents:UIControlEventTouchUpInside];
    attentionBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:attentionBtn.bounds
                                                   byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight
                                                         cornerRadii:CGSizeMake(6, 6)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = attentionBtn.bounds;
    maskLayer.path = maskPath.CGPath;
    attentionBtn.layer.mask = maskLayer;
    
    allBtn = [[UIButton alloc] initWithFrame:CGRectMake(attentionBtn.frame.origin.x - 53, 4, 52, 24)];
    allBtn.backgroundColor = kColorWithRGB(204, 204, 204);
    [allBtn setTitle:@"全部" forState:UIControlStateNormal];
    [allBtn setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
    [allBtn setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
    [allBtn addTarget:self action:@selector(allBtned:) forControlEvents:UIControlEventTouchUpInside];
    allBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [headView addSubview:allBtn];
    
    UIBezierPath *maskPath2 = [UIBezierPath bezierPathWithRoundedRect:allBtn.bounds
                                                   byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft
                                                         cornerRadii:CGSizeMake(6, 6)];
    CAShapeLayer *maskLayer2 = [[CAShapeLayer alloc] init];
    maskLayer2.frame = attentionBtn.bounds;
    maskLayer2.path = maskPath2.CGPath;
    allBtn.layer.mask = maskLayer2;
    
    
    otBtn = [[UIButton alloc] initWithFrame:CGRectMake(allBtn.frame.origin.x - 60, 4, 52, 24)];
    otBtn.backgroundColor = kColorWithRGB(204, 204, 204);
    [otBtn setTitle:@"24小时" forState:UIControlStateNormal];
    [otBtn setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
    [otBtn setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
    [otBtn addTarget:self action:@selector(otBened:) forControlEvents:UIControlEventTouchUpInside];
    otBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [headView addSubview:otBtn];
    
    UIBezierPath *maskPath3 = [UIBezierPath bezierPathWithRoundedRect:otBtn.bounds
                                                    byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight
                                                          cornerRadii:CGSizeMake(6, 6)];
    CAShapeLayer *maskLayer3 = [[CAShapeLayer alloc] init];
    maskLayer3.frame = attentionBtn.bounds;
    maskLayer3.path = maskPath3.CGPath;
    otBtn.layer.mask = maskLayer3;
    
    tfBtn = [[UIButton alloc] initWithFrame:CGRectMake(otBtn.frame.origin.x - 53, 4, 52, 24)];
    tfBtn.backgroundColor = kColorWithRGB(204, 204, 204);
    [tfBtn setTitle:@"12小时" forState:UIControlStateNormal];
    [tfBtn setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
    [tfBtn setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
    [tfBtn addTarget:self action:@selector(tfBtned:) forControlEvents:UIControlEventTouchUpInside];
    tfBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [headView addSubview:tfBtn];
    
    UIBezierPath *maskPath4 = [UIBezierPath bezierPathWithRoundedRect:tfBtn.bounds
                                                    byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft
                                                          cornerRadii:CGSizeMake(6, 6)];
    CAShapeLayer *maskLayer4 = [[CAShapeLayer alloc] init];
    maskLayer4.frame = attentionBtn.bounds;
    maskLayer4.path = maskPath4.CGPath;
    tfBtn.layer.mask = maskLayer4;
    
    [self tfBtned:tfBtn];
    [self allBtned:allBtn];
    
    self.tableView = ({
        UITableView *view = [UITableView new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(headView.mas_bottom);
            make.left.equalTo(self.view);
            make.bottom.equalTo(self.view);
            make.right.equalTo(self.view);
        }];
        view.delegate = self;
        view.dataSource = self;
        view;
    });
}

- (void)attentionBtned:(UIButton *)sender
{
    sender.selected = YES;
    sender.backgroundColor = kColorWithRGB(185, 0, 0);
    allBtn.selected = NO;
    allBtn.backgroundColor = kColorWithRGB(204, 204, 204);
}

- (void)allBtned:(UIButton *)sender
{
    sender.selected = YES;
    sender.backgroundColor = kColorWithRGB(185, 0, 0);
    attentionBtn.selected = NO;
    attentionBtn.backgroundColor = kColorWithRGB(204, 204, 204);
    
}

- (void)otBened:(UIButton *)sender
{
    sender.selected = YES;
    sender.backgroundColor = kColorWithRGB(185, 0, 0);
    tfBtn.selected = NO;
    tfBtn.backgroundColor = kColorWithRGB(204, 204, 204);
}

- (void)tfBtned:(UIButton *)sender
{
    sender.selected = YES;
    sender.backgroundColor = kColorWithRGB(185, 0, 0);
    otBtn.selected = NO;
    otBtn.backgroundColor = kColorWithRGB(204, 204, 204);
}

- (void)deleledowned:(id)sender
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    UIWindow *window =  [UIApplication sharedApplication].keyWindow;
    cover = [[UIView alloc] initWithFrame:bounds];
    cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    [window addSubview:cover];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancleBtnPressed:)];
    [cover addGestureRecognizer:tapGestureRecognizer];
    
    alterView = [BXAlterView new];
    [cover addSubview:alterView];
    [alterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(cover);
        make.left.equalTo(cover).offset(60);
        make.right.equalTo(cover).offset(-60);
        make.height.equalTo(@140);
    }];
    
    UILabel *title = [UILabel new];
    [alterView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(alterView);
        make.left.equalTo(alterView).offset(20);
        make.right.equalTo(alterView).offset(-20);
        make.top.equalTo(alterView).offset(30);
        make.height.equalTo(@20);
    }];
    
    title.text = @"清除所有离线数据？";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor grayColor];
    title.font = [UIFont systemFontOfSize:16];
    title.backgroundColor = [UIColor clearColor];
    
    
    BXButton *downLoadBtn = [BXButton new];
    downLoadBtn.side = BXBtnSideLeft;
    [alterView addSubview:downLoadBtn];
    
    BXButton *cancleBtn = [BXButton new];
    cancleBtn.side = BXBtnSideRight;
    [alterView addSubview:cancleBtn];
    
    [downLoadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(alterView).offset(20);
        make.top.equalTo(title.mas_bottom).offset(10);
        make.right.equalTo(cancleBtn.mas_left).offset(-2);
        make.height.equalTo(@40);
    }];
    
    [cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(downLoadBtn.mas_right).offset(2);
        make.top.equalTo(title.mas_bottom).offset(10);
        make.right.equalTo(alterView).offset(-20);
        make.width.equalTo(downLoadBtn.mas_width);
        make.height.equalTo(@40);
    }];
    
    [downLoadBtn setTitle:@"清除" forState:UIControlStateNormal];
    [downLoadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    downLoadBtn.backgroundColor = kColorWithRGB(185, 0, 0);
    
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancleBtn setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
    cancleBtn.backgroundColor = kColorWithRGB(204, 204, 204);
    [cancleBtn addTarget:self action:@selector(cancleBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    alterView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
    
    [UIView animateWithDuration:0.3 animations:^{
        cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:0 animations:^{
        
        [alterView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(cover);
        }];
        [self.view layoutIfNeeded];
        alterView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)refreshDownLoad:(id)sender
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    UIWindow *window =  [UIApplication sharedApplication].keyWindow;
    cover = [[UIView alloc] initWithFrame:bounds];
    cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    [window addSubview:cover];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancleBtnPressed:)];
    [cover addGestureRecognizer:tapGestureRecognizer];
    
    alterView = [BXAlterView new];
    [cover addSubview:alterView];
    [alterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(cover);
        make.left.equalTo(cover).offset(60);
        make.right.equalTo(cover).offset(-60);
        make.height.equalTo(@180);
    }];

    UILabel *title = [UILabel new];
    [alterView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(alterView);
        make.left.equalTo(alterView).offset(60);
        make.right.equalTo(alterView).offset(-60);
        make.top.equalTo(alterView).offset(30);
        make.height.equalTo(@20);
    }];
    
    title.text = @"离线下载";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor grayColor];
    title.font = [UIFont systemFontOfSize:16];
    title.backgroundColor = [UIColor clearColor];
    
    UILabel *countLabel = [UILabel new];
    [alterView addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(alterView);
        make.left.equalTo(alterView).offset(20);
        make.right.equalTo(alterView).offset(-20);
        make.top.equalTo(title.mas_bottom).offset(10);
        make.height.equalTo(@30);
    }];
    
    countLabel.text = @"有20篇资讯可下载";
    countLabel.textAlignment = NSTextAlignmentCenter;
    countLabel.textColor = [UIColor whiteColor];
    countLabel.font = [UIFont systemFontOfSize:18];
    countLabel.backgroundColor = [UIColor clearColor];
    
    BXButton *downLoadBtn = [BXButton new];
    downLoadBtn.side = BXBtnSideLeft;
    [alterView addSubview:downLoadBtn];
    
    BXButton *cancleBtn = [BXButton new];
    cancleBtn.side = BXBtnSideRight;
    [alterView addSubview:cancleBtn];
    
    [downLoadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(alterView).offset(20);
        make.top.equalTo(countLabel.mas_bottom).offset(10);
        make.right.equalTo(cancleBtn.mas_left).offset(-2);
        make.height.equalTo(@40);
    }];
    
    [cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(downLoadBtn.mas_right).offset(2);
        make.top.equalTo(countLabel.mas_bottom).offset(10);
        make.right.equalTo(alterView).offset(-20);
        make.width.equalTo(downLoadBtn.mas_width);
        make.height.equalTo(@40);
    }];
    
    [downLoadBtn setTitle:@"下载" forState:UIControlStateNormal];
    [downLoadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    downLoadBtn.backgroundColor = kColorWithRGB(185, 0, 0);
    [downLoadBtn addTarget:self action:@selector(downLoadBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancleBtn setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
    cancleBtn.backgroundColor = kColorWithRGB(204, 204, 204);
    [cancleBtn addTarget:self action:@selector(cancleBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    alterView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
    
    [UIView animateWithDuration:0.3 animations:^{
         cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
    } completion:^(BOOL finished) {

    }];
    
    [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:0 animations:^{
        
        [alterView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(cover);
        }];
        [self.view layoutIfNeeded];
        alterView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)cancleBtnPressed:(id)sender
{
    
    [UIView animateWithDuration:0.3 animations:^{
        alterView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
        cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    } completion:^(BOOL finished) {
        [cover removeFromSuperview];
    }];
    
}

- (void)downLoadBtnPressed:(id)sender
{
    
    [UIView animateWithDuration:0.3 animations:^{
        alterView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
        cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    } completion:^(BOOL finished) {
        [cover removeFromSuperview];
        
        downLoadHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 32)];
        downLoadHeadView.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0];
        [self.view addSubview:downLoadHeadView];
        
        UILabel *sortLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 9, 0, 0)];
        sortLabel.text = @"正在下载 12/20";
        sortLabel.font = [UIFont systemFontOfSize:12];
        [sortLabel sizeToFit];
        [downLoadHeadView addSubview:sortLabel];
        
        UIButton *downtipBtn = [[UIButton alloc] initWithFrame:CGRectMake(downLoadHeadView.frame.size.width - 35, 4, 24, 24)];
        [downtipBtn setImage:[UIImage imageNamed:@"downtip"] forState:UIControlStateNormal];
        [downLoadHeadView addSubview:downtipBtn];
        [downtipBtn addTarget:self action:@selector(downtipBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        
    }];
    
}

- (void)downtipBtnPressed:(UIButton *)sender
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    UIWindow *window =  [UIApplication sharedApplication].keyWindow;
    cover = [[UIView alloc] initWithFrame:bounds];
    cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    [window addSubview:cover];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancleBtnPressed:)];
    [cover addGestureRecognizer:tapGestureRecognizer];
    
    alterView = [BXAlterView new];
    [cover addSubview:alterView];
    [alterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(cover);
        make.left.equalTo(cover).offset(60);
        make.right.equalTo(cover).offset(-60);
        make.height.equalTo(@180);
    }];
    
    UILabel *title = [UILabel new];
    [alterView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(alterView);
        make.left.equalTo(alterView).offset(60);
        make.right.equalTo(alterView).offset(-60);
        make.top.equalTo(alterView).offset(30);
        make.height.equalTo(@20);
    }];
    
    title.text = @"正在下载";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor grayColor];
    title.font = [UIFont systemFontOfSize:16];
    title.backgroundColor = [UIColor clearColor];
    
    UILabel *countLabel = [UILabel new];
    [alterView addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(alterView);
        make.left.equalTo(alterView).offset(20);
        make.right.equalTo(alterView).offset(-20);
        make.top.equalTo(title.mas_bottom).offset(10);
        make.height.equalTo(@30);
    }];
    
    countLabel.text = @"下载进度 12/20";
    countLabel.textAlignment = NSTextAlignmentCenter;
    countLabel.textColor = [UIColor whiteColor];
    countLabel.font = [UIFont systemFontOfSize:18];
    countLabel.backgroundColor = [UIColor clearColor];
    
    BXButton *downLoadBtn = [BXButton new];
    downLoadBtn.side = BXBtnSideLeft;
    [alterView addSubview:downLoadBtn];
    
    BXButton *cancleBtn = [BXButton new];
    cancleBtn.side = BXBtnSideRight;
    [alterView addSubview:cancleBtn];
    
    [downLoadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(alterView).offset(20);
        make.top.equalTo(countLabel.mas_bottom).offset(10);
        make.right.equalTo(cancleBtn.mas_left).offset(-2);
        make.height.equalTo(@40);
    }];
    
    [cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(downLoadBtn.mas_right).offset(2);
        make.top.equalTo(countLabel.mas_bottom).offset(10);
        make.right.equalTo(alterView).offset(-20);
        make.width.equalTo(downLoadBtn.mas_width);
        make.height.equalTo(@40);
    }];
    
    [downLoadBtn setTitle:@"终止" forState:UIControlStateNormal];
    [downLoadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    downLoadBtn.backgroundColor = kColorWithRGB(185, 0, 0);
    [downLoadBtn addTarget:self action:@selector(cancleDownLoad:) forControlEvents:UIControlEventTouchUpInside];
    
    [cancleBtn setTitle:@"返回" forState:UIControlStateNormal];
    [cancleBtn setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
    cancleBtn.backgroundColor = kColorWithRGB(204, 204, 204);
    [cancleBtn addTarget:self action:@selector(cancleBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    alterView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
    
    [UIView animateWithDuration:0.3 animations:^{
        cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:0 animations:^{
        
        [alterView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(cover);
        }];
        [self.view layoutIfNeeded];
        alterView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)cancleDownLoad:(UIButton *)sender
{
    
    [UIView animateWithDuration:0.3 animations:^{
        alterView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
        cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    } completion:^(BOOL finished) {
        [cover removeFromSuperview];
        [downLoadHeadView removeFromSuperview];
        
    }];
}

-(void)backToMainVc:(id)sender{
    //    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //    MainViewController *mainVc = [[MainViewController alloc] init];
    //    [appDelegate.drawerController setCenterViewController:mainVc];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - tabelViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellIdentifir = @"CellIdentifer";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifir];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifir];
        UILabel *titleLabe = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, self.view.frame.size.width, 40)];
        [cell.contentView addSubview:titleLabe];
        titleLabe.font = [UIFont systemFontOfSize:16];
        titleLabe.text = @"离线标题离线标题";
        
        UILabel *fromLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80 - 30, 0, 0)];
        [cell.contentView addSubview:fromLabel];
        fromLabel.text = @"网易新闻";
        fromLabel.font = [UIFont systemFontOfSize:10];
        [fromLabel sizeToFit];
        
        UILabel *commentCount = [[UILabel alloc] initWithFrame:CGRectMake(fromLabel.frame.size.width+20+10, 80 - 30, 0, 0)];
        [cell.contentView addSubview:commentCount];
        commentCount.font = [UIFont systemFontOfSize:10];
        commentCount.text = @"评论 122";
        [commentCount sizeToFit];
        
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(commentCount.frame.origin.x+commentCount.frame.size.width+10, 80 - 30, 0, 0)];
        [cell.contentView addSubview:timeLabel];
        timeLabel.font = [UIFont systemFontOfSize:10];
        timeLabel.text = @"2014.04.04";
        [timeLabel sizeToFit];
    }

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OffLineDetailViewController *nextVc = [[OffLineDetailViewController alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
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
