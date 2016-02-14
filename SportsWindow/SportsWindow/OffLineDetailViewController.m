//
//  OffLineDetailViewController.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/19.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "OffLineDetailViewController.h"
#import <Masonry.h>
#import "BXAlterView.h"

#define kColorWithRGB(r, g, b) [UIColor colorWithRed:(r) / 255.f green:(g) / 255.f blue:(b) / 255.f alpha:1.f]

@interface OffLineDetailViewController ()
{
    UIScrollView *scrollView;
    UIView *cover;
    BXAlterView *alterView;
}

@end

@implementation OffLineDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIButton *leftDrawerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftDrawerButton setImage:[UIImage imageNamed:@"backoffline"] forState:UIControlStateNormal];
    [leftDrawerButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    [leftDrawerButton addTarget:self action:@selector(backToNotificationView:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backBtn = [[UIBarButtonItem alloc] initWithCustomView:leftDrawerButton];
    self.navigationItem.leftBarButtonItem = backBtn;
    
    UIButton *rightDrawerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [rightDrawerButton setImage:[UIImage imageNamed:@"fenxiangOffLine"] forState:UIControlStateNormal];
    [rightDrawerButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    [rightDrawerButton addTarget:self action:@selector(fenxiang:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * shareBtn = [[UIBarButtonItem alloc] initWithCustomView:rightDrawerButton];
    
    UIButton *rightDrawerButton2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [rightDrawerButton2 setImage:[UIImage imageNamed:@"staroffline"] forState:UIControlStateNormal];
    [rightDrawerButton2 setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [rightDrawerButton2 addTarget:self action:@selector(collectionTheNews:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * collectBtn = [[UIBarButtonItem alloc] initWithCustomView:rightDrawerButton2];
    
    self.navigationItem.rightBarButtonItems = @[collectBtn,shareBtn];
    
    [self setupMainView];
}

- (void)setupMainView
{
    
    scrollView = [UIScrollView new];
    scrollView.backgroundColor =  [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    UILabel *titleLabel = [UILabel new];
    [container addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(container).offset(20);
        make.right.equalTo
        (container).offset(-20);
        make.top.mas_equalTo(container.mas_top).offset(20);
    }];
    titleLabel.text = @"内容标题内容标题内容标题内容标题内容标题内容标题";
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.numberOfLines = 0;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel sizeToFit];
    
    UILabel *timeLabel = ({
        UILabel *view = [UILabel new];
        [container addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(container).offset(20);
            make.right.equalTo(container).offset(-20);
            make.top.mas_equalTo(titleLabel.mas_bottom).offset(10);
        }];
        view.textAlignment = NSTextAlignmentCenter;
        view.font = [UIFont systemFontOfSize:10];
        view;
    });
    timeLabel.text = @"网易新闻  2014.04.04  12:21";
    [timeLabel sizeToFit];
    
    UILabel *contentLabel = ({
        UILabel *view = [UILabel new];
        [container addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(container).offset(20);
            make.right.equalTo(container).offset(-20);
            make.top.mas_equalTo(timeLabel.mas_bottom).offset(20);
        }];
        view.font = [UIFont systemFontOfSize:16];
        view.numberOfLines = 0;
        view;
    });
    contentLabel.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    [contentLabel sizeToFit];
    
#pragma mark - 关键词
    UILabel *keyWordTitle = ({
        UILabel *view = [UILabel new];
        [container addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(contentLabel.mas_bottom).offset(30);
            make.left.equalTo(container).offset(20);
        }];
        view.font = [UIFont systemFontOfSize:19];
        view.textColor = kColorWithRGB(150, 150, 150);
        [view sizeToFit];
        view.text = @"关键词";
        view;
    });
    
    UIImageView *xuLine = ({
        UIImageView *view = [UIImageView new];
        [container addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(keyWordTitle.mas_bottom).offset(10);
            make.left.equalTo(container).offset(20);
            make.right.equalTo(container).offset(-20);
        }];
        view.image = [UIImage imageNamed:@"xuline"];
        view;
    });
    
    UIButton *btn1 = ({
        UIButton *view = [UIButton new];
        [container addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(xuLine.mas_bottom).offset(20);
            make.left.equalTo(container).offset(20);
            make.width.equalTo(@50);
        }];
        [view setTitle:@"C罗" forState:UIControlStateNormal];
        [view setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
        [view setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
        view.backgroundColor = kColorWithRGB(204, 204, 204);
        //        [view addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        view.titleLabel.font = [UIFont systemFontOfSize:14];
        view;
    });
    
    UIButton *btn2 = ({
        UIButton *view = [UIButton new];
        [container addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(xuLine.mas_bottom).offset(20);
            make.left.equalTo(btn1.mas_right).offset(5);
            make.width.equalTo(@80);
        }];
        [view setTitle:@"贝克汉姆" forState:UIControlStateNormal];
        [view setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
        [view setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
        view.backgroundColor = kColorWithRGB(204, 204, 204);
        view.titleLabel.font = [UIFont systemFontOfSize:14];
        //        [view addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        view;
    });
    
    UIButton *btn3 = ({
        UIButton *view = [UIButton new];
        [container addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(xuLine.mas_bottom).offset(20);
            make.left.equalTo(btn2.mas_right).offset(5);
            make.width.equalTo(@60);
        }];
        [view setTitle:@"齐达内" forState:UIControlStateNormal];
        [view setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
        [view setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
        view.backgroundColor = kColorWithRGB(204, 204, 204);
        view.titleLabel.font = [UIFont systemFontOfSize:14];
        //        [view addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        view;
    });
    
    UIButton *btn4 = ({
        UIButton *view = [UIButton new];
        [container addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(xuLine.mas_bottom).offset(20);
            make.left.equalTo(btn3.mas_right).offset(5);
            make.width.equalTo(@60);
        }];
        [view setTitle:@"世界杯" forState:UIControlStateNormal];
        [view setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
        [view setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
        view.backgroundColor = kColorWithRGB(204, 204, 204);
        view.titleLabel.font = [UIFont systemFontOfSize:14];
        //        [view addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        view;
    });
    
    UIButton *btn5 = ({
        UIButton *view = [UIButton new];
        [container addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btn1.mas_bottom).offset(10);
            make.left.equalTo(container).offset(20);
            make.width.equalTo(@80);
        }];
        [view setTitle:@"罗纳尔多" forState:UIControlStateNormal];
        [view setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
        [view setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
        view.backgroundColor = kColorWithRGB(204, 204, 204);
        view.titleLabel.font = [UIFont systemFontOfSize:14];
        //        [view addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        view;
    });
    
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(btn5.mas_bottom).offset(40);
    }];
    
}

- (void)fenxiang:(id)sender
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    UIWindow *window =  [UIApplication sharedApplication].keyWindow;
    cover = [[UIView alloc] initWithFrame:bounds];
    cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    [window addSubview:cover];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismisstheView:)];
    [cover addGestureRecognizer:tapGestureRecognizer];
    
    alterView = [BXAlterView new];
    [cover addSubview:alterView];
    [alterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(cover);
        make.left.equalTo(cover).offset(60);
        make.right.equalTo(cover).offset(-60);
        make.height.equalTo(@340);
    }];
    
    UILabel *title = [UILabel new];
    [alterView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(alterView);
        make.left.equalTo(alterView).offset(40);
        make.right.equalTo(alterView).offset(-40);
        make.top.equalTo(alterView).offset(30);
        make.height.equalTo(@20);
    }];
    
    title.text = @"分享至";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = kColorWithRGB(179, 179, 179);
    title.font = [UIFont systemFontOfSize:16];
    title.backgroundColor = [UIColor clearColor];
    
    // 微信好友分享
    UIView *shareweichartView = ({
        UIView *view = [UIView new];
        [alterView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(alterView).offset(20);
            make.right.equalTo(alterView).offset(-20);
            make.top.equalTo(title.mas_bottom).offset(5);
            make.height.equalTo(@40);
        }];
        view.backgroundColor = [UIColor clearColor];
        view;
    });
    
    UIImageView *weichatImg = ({
        UIImageView *view = [UIImageView new];
        [shareweichartView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(shareweichartView);
            make.width.equalTo(@40);
        }];
        view.image = [UIImage imageNamed:@"shareweichat"];
        view.backgroundColor = kColorWithRGB(33, 33, 33);
        view;
    });
    
    UIButton *shareweichatBtn = ({
        UIButton *btn = [UIButton new];
        [shareweichartView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.equalTo(shareweichartView);
            make.left.equalTo(weichatImg.mas_right);
        }];
        [btn setTitle:@"微信好友" forState:UIControlStateNormal];
        [btn setTitleColor:kColorWithRGB(179, 179, 179) forState:UIControlStateNormal];
        btn.backgroundColor = kColorWithRGB(51, 51, 51);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
        btn;
    });
    
    // 微信朋友圈分享
    UIView *shareweifriendView = ({
        UIView *view = [UIView new];
        [alterView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(alterView).offset(20);
            make.right.equalTo(alterView).offset(-20);
            make.top.equalTo(shareweichartView.mas_bottom).offset(3);
            make.height.equalTo(@40);
        }];
        view.backgroundColor = [UIColor clearColor];
        view;
    });
    
    UIImageView *weifriendImg = ({
        UIImageView *view = [UIImageView new];
        [shareweifriendView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(shareweifriendView);
            make.width.equalTo(@40);
        }];
        view.image = [UIImage imageNamed:@"shareweifriend"];
        view.backgroundColor = kColorWithRGB(33, 33, 33);
        view;
    });
    
    UIButton *sharefriendBtn = ({
        UIButton *btn = [UIButton new];
        [shareweifriendView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.equalTo(shareweifriendView);
            make.left.equalTo(weifriendImg.mas_right);
        }];
        [btn setTitle:@"微信朋友圈" forState:UIControlStateNormal];
        [btn setTitleColor:kColorWithRGB(179, 179, 179) forState:UIControlStateNormal];
        btn.backgroundColor = kColorWithRGB(51, 51, 51);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -7, 0, 7)];
        btn;
    });
    
    // qq好友分享
    UIView *shareqqView = ({
        UIView *view = [UIView new];
        [alterView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(alterView).offset(20);
            make.right.equalTo(alterView).offset(-20);
            make.top.equalTo(shareweifriendView.mas_bottom).offset(3);
            make.height.equalTo(@40);
        }];
        view.backgroundColor = [UIColor clearColor];
        view;
    });
    
    UIImageView *qqImg = ({
        UIImageView *view = [UIImageView new];
        [shareqqView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(shareqqView);
            make.width.equalTo(@40);
        }];
        view.image = [UIImage imageNamed:@"shareqq"];
        view.backgroundColor = kColorWithRGB(33, 33, 33);
        view;
    });
    
    UIButton *shareqqBtn = ({
        UIButton *btn = [UIButton new];
        [shareqqView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.equalTo(shareqqView);
            make.left.equalTo(qqImg.mas_right);
        }];
        [btn setTitle:@"QQ好友" forState:UIControlStateNormal];
        [btn setTitleColor:kColorWithRGB(179, 179, 179) forState:UIControlStateNormal];
        btn.backgroundColor = kColorWithRGB(51, 51, 51);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -18, 0, 18)];
        btn;
    });
    
    // qq空间分享
    UIView *shareqqZoneView = ({
        UIView *view = [UIView new];
        [alterView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(alterView).offset(20);
            make.right.equalTo(alterView).offset(-20);
            make.top.equalTo(shareqqView.mas_bottom).offset(3);
            make.height.equalTo(@40);
        }];
        view.backgroundColor = [UIColor clearColor];
        view;
    });
    
    UIImageView *qqzoneImg = ({
        UIImageView *view = [UIImageView new];
        [shareqqZoneView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(shareqqZoneView);
            make.width.equalTo(@40);
        }];
        view.image = [UIImage imageNamed:@"shareqqzone"];
        view.backgroundColor = kColorWithRGB(33, 33, 33);
        view;
    });
    
    UIButton *shareqqzoneBtn = ({
        UIButton *btn = [UIButton new];
        [shareqqZoneView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.equalTo(shareqqZoneView);
            make.left.equalTo(qqzoneImg.mas_right);
        }];
        [btn setTitle:@"QQ空间" forState:UIControlStateNormal];
        [btn setTitleColor:kColorWithRGB(179, 179, 179) forState:UIControlStateNormal];
        btn.backgroundColor = kColorWithRGB(51, 51, 51);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -18, 0, 18)];
        btn;
    });
    
    // 微博分享
    
    UIView *shareweiboView = ({
        UIView *view = [UIView new];
        [alterView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(alterView).offset(20);
            make.right.equalTo(alterView).offset(-20);
            make.top.equalTo(shareqqZoneView.mas_bottom).offset(3);
            make.height.equalTo(@40);
        }];
        view.backgroundColor = [UIColor clearColor];
        view;
    });
    
    UIImageView *weiboImg = ({
        UIImageView *view = [UIImageView new];
        [shareweiboView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(shareweiboView);
            make.width.equalTo(@40);
        }];
        view.image = [UIImage imageNamed:@"shareweibo"];
        view.backgroundColor = kColorWithRGB(33, 33, 33);
        view;
    });
    
    UIButton *shareweiboBtn = ({
        UIButton *btn = [UIButton new];
        [shareweiboView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.equalTo(shareweiboView);
            make.left.equalTo(weiboImg.mas_right);
        }];
        [btn setTitle:@"微博" forState:UIControlStateNormal];
        [btn setTitleColor:kColorWithRGB(179, 179, 179) forState:UIControlStateNormal];
        btn.backgroundColor = kColorWithRGB(51, 51, 51);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -29, 0, 29)];
        btn;
    });
    
    // 复制链接
    UIView *sharelinkView = ({
        UIView *view = [UIView new];
        [alterView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(alterView).offset(20);
            make.right.equalTo(alterView).offset(-20);
            make.top.equalTo(shareweiboView.mas_bottom).offset(3);
            make.height.equalTo(@40);
        }];
        view.backgroundColor = [UIColor clearColor];
        view;
    });
    
    UIImageView *linkImg = ({
        UIImageView *view = [UIImageView new];
        [sharelinkView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(sharelinkView);
            make.width.equalTo(@40);
        }];
        view.image = [UIImage imageNamed:@"sharelink"];
        view.backgroundColor = kColorWithRGB(33, 33, 33);
        view;
    });
    
    UIButton *sharelinkBtn = ({
        UIButton *btn = [UIButton new];
        [sharelinkView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.equalTo(sharelinkView);
            make.left.equalTo(linkImg.mas_right);
        }];
        [btn setTitle:@"复制链接" forState:UIControlStateNormal];
        [btn setTitleColor:kColorWithRGB(179, 179, 179) forState:UIControlStateNormal];
        btn.backgroundColor = kColorWithRGB(51, 51, 51);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
        btn;
    });
    
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

- (void)dismisstheView:(id)sender
{
    
    [UIView animateWithDuration:0.3 animations:^{
        alterView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
        cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    } completion:^(BOOL finished) {
        [cover removeFromSuperview];
    }];
    
}


- (void)collectionTheNews:(id)sender
{
    
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
