//
//  AttentionView.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/21.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "AttentionView.h"
#import <Masonry.h>

#define kColorWithRGB(r, g, b) [UIColor colorWithRed:(r) / 255.f green:(g) / 255.f blue:(b) / 255.f alpha:1.f]

@implementation AttentionView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        UIScrollView *scrollView = [UIScrollView new];
        scrollView.backgroundColor =  [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        [self addSubview:scrollView];
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        UIView *container = [UIView new];
        [scrollView addSubview:container];
        [container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(scrollView);
            make.width.equalTo(scrollView);
        }];
         container.backgroundColor = kColorWithRGB(238, 238, 238);
        
#pragma mark - 关注的栏目
        UILabel *title = ({
            UILabel *view = [UILabel new];
            [container addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(container).offset(30);
                make.left.equalTo(container).offset(20);
            }];
            view.font = [UIFont systemFontOfSize:19];
            [view sizeToFit];
            view.text = @"关注的栏目";
            view;
        });
        
        UIImageView *xuLine = ({
            UIImageView *view = [UIImageView new];
            [container addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(title.mas_bottom).offset(10);
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
                make.width.equalTo(@60);
            }];
            [view setTitle:@"足球" forState:UIControlStateNormal];
            [view setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
            [view setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
            view.backgroundColor = kColorWithRGB(204, 204, 204);
            [view addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
            view.titleLabel.font = [UIFont systemFontOfSize:14];
            
            view;
        });
        
        UIButton *btn2 = ({
            UIButton *view = [UIButton new];
            [container addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(xuLine.mas_bottom).offset(20);
                make.left.equalTo(btn1.mas_right).offset(5);
                make.width.equalTo(@60);
            }];
            [view setTitle:@"篮球" forState:UIControlStateNormal];
            [view setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
            [view setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
            view.backgroundColor = kColorWithRGB(204, 204, 204);
            view.titleLabel.font = [UIFont systemFontOfSize:14];
            [view addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
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
            [view setTitle:@"健身" forState:UIControlStateNormal];
            [view setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
            [view setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
            view.backgroundColor = kColorWithRGB(204, 204, 204);
            view.titleLabel.font = [UIFont systemFontOfSize:14];
            [view addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
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
            [view setTitle:@"足球" forState:UIControlStateNormal];
            [view setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
            [view setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
            view.backgroundColor = kColorWithRGB(204, 204, 204);
            view.titleLabel.font = [UIFont systemFontOfSize:14];
            [view addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
            view;
        });
        
//        UIButton *btn5 = ({
//            UIButton *view = [UIButton new];
//            [container addSubview:view];
//            [view mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(xuLine.mas_bottom).offset(20);
//                make.left.equalTo(btn4.mas_right).offset(5);
//                make.width.equalTo(@60);
//            }];
//            [view setTitle:@"篮球" forState:UIControlStateNormal];
//            [view setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
//            [view setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
//            view.backgroundColor = kColorWithRGB(204, 204, 204);
//            view.titleLabel.font = [UIFont systemFontOfSize:14];
//            [view addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
//            view;
//        });
        
        UIButton *btn6 = ({
            UIButton *view = [UIButton new];
            [container addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(btn1.mas_bottom).offset(10);
                make.left.equalTo(self).offset(20);
                make.width.equalTo(@60);
            }];
            [view setTitle:@"健身" forState:UIControlStateNormal];
            [view setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
            [view setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
            view.backgroundColor = kColorWithRGB(204, 204, 204);
            view.titleLabel.font = [UIFont systemFontOfSize:14];
            [view addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
            view;
        });
        
        UIButton *btn7 = ({
            UIButton *view = [UIButton new];
            [container addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(btn1.mas_bottom).offset(10);
                make.left.equalTo(btn6.mas_right).offset(5);
                make.width.equalTo(@80);
            }];
            [view setTitle:@"高尔夫" forState:UIControlStateNormal];
            [view setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
            [view setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
            view.backgroundColor = kColorWithRGB(204, 204, 204);
            view.titleLabel.font = [UIFont systemFontOfSize:14];
            [view addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
            view;
        });
        
        UIButton *btn8 = ({
            UIButton *view = [UIButton new];
            [container addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(btn1.mas_bottom).offset(10);
                make.left.equalTo(btn7.mas_right).offset(5);
                make.width.equalTo(@100);
            }];
            [view setTitle:@"体育新闻" forState:UIControlStateNormal];
            [view setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
            [view setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
            view.backgroundColor = kColorWithRGB(204, 204, 204);
            view.titleLabel.font = [UIFont systemFontOfSize:14];
            [view addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
            view;
        });
#pragma mRK - 关注的关键词
        UILabel *title2 = ({
            UILabel *view = [UILabel new];
            [container addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(btn8.mas_bottom).offset(30);
                make.left.equalTo(self).offset(20);
            }];
            view.font = [UIFont systemFontOfSize:19];
            [view sizeToFit];
            view.text = @"关注的关键词";
            view;
        });
        
        UIImageView *xuLine2 = ({
            UIImageView *view = [UIImageView new];
            [container addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(title2.mas_bottom).offset(10);
                make.left.equalTo(self).offset(20);
                make.right.equalTo(self).offset(-20);
            }];
            view.image = [UIImage imageNamed:@"xuline"];
            view;
        });
        
        UIButton *addBtn = ({
            UIButton *view = [UIButton new];
            [container addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(xuLine2.mas_bottom).offset(20);
                make.left.equalTo(self).offset(20);
                make.right.equalTo(self).offset(-20);
                make.height.equalTo(@40);
            }];
            [view setTitle:@"＋" forState:UIControlStateNormal];
            view.titleLabel.font = [UIFont systemFontOfSize:30];
            view.backgroundColor = kColorWithRGB(185, 0, 0);
            [view addTarget:self action:@selector(addBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
            view;
        });
        
        UIView *keywordView1 = ({
            UIView *view = [UIView new];
            [container addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(20);
                make.right.equalTo(self).offset(-20);
                make.top.equalTo(addBtn.mas_bottom).offset(5);
                make.height.equalTo(@35);
            }];
            view.backgroundColor = kColorWithRGB(217, 217, 217);
            view;
        });
        
        UILabel *keyword1 = ({
            UILabel *view = [UILabel new];
            [keywordView1 addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(keywordView1);
                make.left.equalTo(keywordView1).offset(20);
            }];
            view.font = [UIFont systemFontOfSize:14];
            view.text = @"C罗";
            view.textColor = kColorWithRGB(64, 64, 64);
            [view sizeToFit];
            view;
        });
        
        UIButton *keywordBtn_1 = ({
            UIButton *view = [UIButton new];
            [keywordView1 addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(keywordView1);
                make.right.equalTo(keywordView1);
                make.width.equalTo(@35);
            }];
            view.backgroundColor = kColorWithRGB(204, 204, 204);
            [view setImage:[UIImage imageNamed:@"cha"] forState:UIControlStateNormal];
            view;
        });
        
        UIView *keywordView2 = ({
            UIView *view = [UIView new];
            [container addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(20);
                make.right.equalTo(self).offset(-20);
                make.top.equalTo(keywordView1.mas_bottom).offset(5);
                make.height.equalTo(@35);
            }];
            view.backgroundColor = kColorWithRGB(217, 217, 217);
            view;
        });
        
        UILabel *keyword2 = ({
            UILabel *view = [UILabel new];
            [keywordView2 addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(keywordView2);
                make.left.equalTo(keywordView2).offset(20);
            }];
            view.font = [UIFont systemFontOfSize:14];
            view.text = @"姚明";
            view.textColor = kColorWithRGB(64, 64, 64);
            [view sizeToFit];
            view;
        });
        
        UIButton *keywordBtn_2 = ({
            UIButton *view = [UIButton new];
            [keywordView2 addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(keywordView2);
                make.right.equalTo(keywordView2);
                make.width.equalTo(@35);
            }];
            view.backgroundColor = kColorWithRGB(204, 204, 204);
            [view setImage:[UIImage imageNamed:@"cha"] forState:UIControlStateNormal];
            view;
        });
        
        UIView *keywordView3 = ({
            UIView *view = [UIView new];
            [container addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(20);
                make.right.equalTo(self).offset(-20);
                make.top.equalTo(keywordView2.mas_bottom).offset(5);
                make.height.equalTo(@35);
            }];
            view.backgroundColor = kColorWithRGB(217, 217, 217);
            view;
        });
        
        UILabel *keyword3 = ({
            UILabel *view = [UILabel new];
            [keywordView3 addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(keywordView3);
                make.left.equalTo(keywordView3).offset(20);
            }];
            view.font = [UIFont systemFontOfSize:14];
            view.text = @"C罗";
            view.textColor = kColorWithRGB(64, 64, 64);
            [view sizeToFit];
            view;
        });
        
        UIButton *keywordBtn_3 = ({
            UIButton *view = [UIButton new];
            [keywordView3 addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(keywordView3);
                make.right.equalTo(keywordView3);
                make.width.equalTo(@35);
            }];
            view.backgroundColor = kColorWithRGB(204, 204, 204);
            [view setImage:[UIImage imageNamed:@"cha"] forState:UIControlStateNormal];
            view;
        });
        
        UIView *keywordView4 = ({
            UIView *view = [UIView new];
            [container addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(20);
                make.right.equalTo(self).offset(-20);
                make.top.equalTo(keywordView3.mas_bottom).offset(5);
                make.height.equalTo(@35);
            }];
            view.backgroundColor = kColorWithRGB(217, 217, 217);
            view;
        });
        
        UILabel *keyword4 = ({
            UILabel *view = [UILabel new];
            [keywordView4 addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(keywordView4);
                make.left.equalTo(keywordView4).offset(20);
            }];
            view.font = [UIFont systemFontOfSize:14];
            view.text = @"C罗";
            view.textColor = kColorWithRGB(64, 64, 64);
            [view sizeToFit];
            view;
        });
        
        UIButton *keywordBtn_4 = ({
            UIButton *view = [UIButton new];
            [keywordView4 addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(keywordView4);
                make.right.equalTo(keywordView4);
                make.width.equalTo(@35);
            }];
            view.backgroundColor = kColorWithRGB(204, 204, 204);
            [view setImage:[UIImage imageNamed:@"cha"] forState:UIControlStateNormal];
            view;
        });
        
        
        [container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(keywordView4.mas_bottom).offset(50);
        }];
        
       
 
    }
    return self;
}

- (void)btnPressed:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected == NO)
    {
        sender.backgroundColor = kColorWithRGB(204, 204, 204);
    }
    else
    {
        sender.backgroundColor = kColorWithRGB(185, 0, 0);
    }
 
}

- (void)addBtnPressed:(UIButton *)sender
{
    [self.delegate junmToAddKeyWordView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
