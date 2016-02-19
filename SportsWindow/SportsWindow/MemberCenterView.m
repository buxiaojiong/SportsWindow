

//
//  MemberCenterView.m
//  SportsWindow
//
//  Created by sourcecode on 16/2/19.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "MemberCenterView.h"
#import <Masonry.h>

@interface MemberCenterView ()



@end

@implementation MemberCenterView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UIView *container = [UIView new];
        [self addSubview:container];
        [container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
            make.width.equalTo(self);
        }];
        
        UILabel *personInfo = [UILabel new];
        [container addSubview:personInfo];
        [personInfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(container).offset(20);
            make.right.equalTo
            (container).offset(-20);
            make.top.mas_equalTo(container.mas_top).offset(40);
            make.height.equalTo(@41);
        }];
        personInfo.layer.borderColor = [[UIColor grayColor] CGColor];
        personInfo.layer.borderWidth = 0.7;
        personInfo.backgroundColor = [UIColor whiteColor];
        personInfo.text = @"个人信息";
        personInfo.textColor = [UIColor grayColor];
        personInfo.textAlignment = NSTextAlignmentCenter;
        personInfo.font = [UIFont systemFontOfSize:14];
        
        UIView *nameLabel = [UIView new];
        [container addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(container).offset(20);
            make.right.equalTo
            (container).offset(-20);
            make.top.mas_equalTo(personInfo.mas_bottom).offset(-1);
            make.height.equalTo(@50);
        }];
        nameLabel.backgroundColor = [UIColor whiteColor];
        nameLabel.layer.borderColor = [[UIColor grayColor] CGColor];
        nameLabel.layer.borderWidth = 0.7;
    
        UILabel *name = [UILabel new];
        [nameLabel addSubview:name];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(nameLabel).offset(15);
            make.centerY.equalTo(nameLabel);
        }];
        name.text = @"用户名";
        name.font = [UIFont systemFontOfSize:14];
        name.textAlignment = NSTextAlignmentCenter;
        [name sizeToFit];
    
        UIButton *userName = [UIButton new];
        [nameLabel addSubview:userName];
        [userName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(nameLabel).offset(-15);
            make.centerY.equalTo(nameLabel);
            make.width.equalTo(@100);
        }];
        [userName setTitle:@"张三张三" forState:UIControlStateNormal];
        userName.titleLabel.font = [UIFont systemFontOfSize:14];
        [userName setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [userName setTitleEdgeInsets:UIEdgeInsetsMake(0, 20, 0, -20)];
//        userName.backgroundColor = [UIColor redColor];
        [userName addTarget:self action:@selector(changeTheUserName:) forControlEvents:UIControlEventTouchUpInside];
    
        UIView *headImg = [UIView new];
        [container addSubview:headImg];
        [headImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(container).offset(20);
            make.right.equalTo
            (container).offset(-20);
            make.top.mas_equalTo(nameLabel.mas_bottom).offset(-1);
            make.height.equalTo(@50);
        }];
        headImg.backgroundColor = [UIColor whiteColor];
        headImg.layer.borderColor = [[UIColor grayColor] CGColor];
        headImg.layer.borderWidth = 0.7;
    
        UILabel *heard = [UILabel new];
        [headImg addSubview:heard];
        [heard mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headImg).offset(15);
            make.centerY.equalTo(headImg);
        }];
        heard.text = @"头像";
        heard.font = [UIFont systemFontOfSize:14];
        heard.textAlignment = NSTextAlignmentCenter;
        [heard sizeToFit];
        
        UIImageView *headImage = [UIImageView new];
        [headImg addSubview:headImage];
        [headImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.equalTo(@40);
            make.right.equalTo(headImg).offset(-15);
            make.centerY.equalTo(headImg);
        }];
        headImage.backgroundColor = [UIColor grayColor];
    
        //登陆绑定
        UILabel *signIn = [UILabel new];
        [container addSubview:signIn];
        [signIn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(container).offset(20);
            make.right.equalTo
            (container).offset(-20);
            make.top.mas_equalTo(headImg.mas_bottom).offset(20);
            make.height.equalTo(@41);
        }];
        signIn.layer.borderColor = [[UIColor grayColor] CGColor];
        signIn.layer.borderWidth = 0.7;
        signIn.backgroundColor = [UIColor whiteColor];
        signIn.text = @"登陆绑定";
        signIn.textColor = [UIColor grayColor];
        signIn.textAlignment = NSTextAlignmentCenter;
        signIn.font = [UIFont systemFontOfSize:14];
        
        UIView *weiBoView = [UIView new];
        [container addSubview:weiBoView];
        [weiBoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(container).offset(20);
            make.right.equalTo
            (container).offset(-20);
            make.top.mas_equalTo(signIn.mas_bottom).offset(-1);
            make.height.equalTo(@50);
        }];
        weiBoView.backgroundColor = [UIColor whiteColor];
        weiBoView.layer.borderColor = [[UIColor grayColor] CGColor];
        weiBoView.layer.borderWidth = 0.7;
    
        UILabel *weiboLabel = [UILabel new];
        [weiBoView addSubview:weiboLabel];
        [weiboLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weiBoView).offset(15);
            make.centerY.equalTo(weiBoView);
        }];
        weiboLabel.text = @"微博";
        weiboLabel.font = [UIFont systemFontOfSize:14];
        [weiboLabel sizeToFit];
        
        UIButton *weiboBtn = [UIButton new];
        [weiBoView addSubview:weiboBtn];
        [weiboBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@25);
            make.centerY.equalTo(weiBoView);
            make.right.equalTo(weiBoView).offset(-15);
        }];
        [weiboBtn setImage:[UIImage imageNamed:@"xukuang"] forState:UIControlStateNormal];
        [weiboBtn setImage:[UIImage imageNamed:@"xukaung_gou"] forState:UIControlStateSelected];
        [weiboBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
       
        UIView *weiXinView = [UIView new];
        [container addSubview:weiXinView];
        [weiXinView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(container).offset(20);
            make.right.equalTo
            (container).offset(-20);
            make.top.mas_equalTo(weiBoView.mas_bottom).offset(-1);
            make.height.equalTo(@50);
        }];
        weiXinView.backgroundColor = [UIColor whiteColor];
        weiXinView.layer.borderColor = [[UIColor grayColor] CGColor];
        weiXinView.layer.borderWidth = 0.7;
    
        UILabel *weixinLabel = [UILabel new];
        [weiXinView addSubview:weixinLabel];
        [weixinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weiXinView).offset(15);
            make.centerY.equalTo(weiXinView);
        }];
        weixinLabel.text = @"微信";
        weixinLabel.font = [UIFont systemFontOfSize:14];
        [weixinLabel sizeToFit];
        
        UIButton *weixinBtn = [UIButton new];
        [weiXinView addSubview:weixinBtn];
        [weixinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@25);
            make.centerY.equalTo(weiXinView);
            make.right.equalTo(weiXinView).offset(-15);
        }];
        [weixinBtn setImage:[UIImage imageNamed:@"xukuang"] forState:UIControlStateNormal];
        [weixinBtn setImage:[UIImage imageNamed:@"xukaung_gou"] forState:UIControlStateSelected];
        [weixinBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *qqView = [UIView new];
        [container addSubview:qqView];
        [qqView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(container).offset(20);
            make.right.equalTo
            (container).offset(-20);
            make.top.mas_equalTo(weiXinView.mas_bottom).offset(-1);
            make.height.equalTo(@50);
        }];
        qqView.backgroundColor = [UIColor whiteColor];
        qqView.layer.borderColor = [[UIColor grayColor] CGColor];
        qqView.layer.borderWidth = 0.7;
    
        UILabel *qqLabel = [UILabel new];
        [qqView addSubview:qqLabel];
        [qqLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(qqView).offset(15);
            make.centerY.equalTo(qqView);
        }];
        qqLabel.text = @"QQ";
        qqLabel.font = [UIFont systemFontOfSize:14];
        [qqLabel sizeToFit];
        
        UIButton *qqBtn = [UIButton new];
        [qqView addSubview:qqBtn];
        [qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@25);
            make.centerY.equalTo(qqView);
            make.right.equalTo(qqView).offset(-15);
        }];
        [qqBtn setImage:[UIImage imageNamed:@"xukuang"] forState:UIControlStateNormal];
        [qqBtn setImage:[UIImage imageNamed:@"xukaung_gou"] forState:UIControlStateSelected];
        [qqBtn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
    
        UIButton *signOut = [UIButton new];
        [container addSubview:signOut];
        [signOut mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(container).offset(20);
            make.right.equalTo
            (container).offset(-20);
            make.top.mas_equalTo(qqView.mas_bottom).offset(40);
            make.height.equalTo(@50);
        }];
        [signOut setTitle:@"退出账号" forState:UIControlStateNormal];
        signOut.backgroundColor = [UIColor colorWithRed:183/255.0 green:7/255.0 blue:16/255.0 alpha:1.0];

        
        weixinBtn.selected = YES;
        qqBtn.selected = YES;
        

        [container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(signOut.mas_bottom).offset(40);
        }];
        
        
        
    }
    return self;
}

- (void)selectedBtn:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

- (void)changeTheUserName:(UIButton *)sender
{
    if (self.userNameBtnBlock) {
        self.userNameBtnBlock(sender.titleLabel.text);
    }
}

@end
