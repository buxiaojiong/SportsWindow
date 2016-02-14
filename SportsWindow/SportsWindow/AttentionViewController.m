//
//  AttentionViewController.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/20.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "AttentionViewController.h"
#import <Masonry.h>
#import "AttentionView.h"
#import "AddKeyWordViewController.h"

@interface AttentionViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
attentionDelegate
>
{
    UIView *headView;
    AttentionView *attentionView;
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    headView = [[UIView alloc] init];
    [self.view addSubview:headView];
    headView.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@35);
    }];
    
    UIButton *allBtn = [UIButton new];
    [headView addSubview:allBtn];
    [allBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(headView);
        make.left.equalTo(headView).offset(5);
        make.width.equalTo(@45);
    }];
    [allBtn setTitle:@"全部" forState:UIControlStateNormal];
    [allBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    allBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    
    UIImageView *lineImage = [UIImageView new];
    [headView addSubview:lineImage];
    lineImage.image = [UIImage imageNamed:@"line"];
    [lineImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(allBtn.mas_right).offset(5);
        make.top.equalTo(headView.mas_top).offset(10);
        make.bottom.equalTo(headView.mas_bottom).offset(-10);
    }];
    
    UIButton *setBtn = [UIButton new];
    [headView addSubview:setBtn];
    [setBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headView.mas_top);
        make.bottom.equalTo(headView.mas_bottom);
        make.right.equalTo(headView);
        make.width.equalTo(@50);
    }];
    [setBtn setImage:[UIImage imageNamed:@"gear"] forState:UIControlStateNormal];
    [setBtn setImage:[UIImage imageNamed:@"gearseled"] forState:UIControlStateSelected];
    [setBtn addTarget:self action:@selector(setBtnPressed:) forControlEvents:UIControlEventTouchUpInside];

    UIImageView *lineImage2 = [UIImageView new];
    [headView addSubview:lineImage2];
    lineImage2.image = [UIImage imageNamed:@"line"];
    [lineImage2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(setBtn.mas_left);
        make.top.equalTo(headView.mas_top).offset(10);
        make.bottom.equalTo(headView.mas_bottom).offset(-10);
    }];
    
    UIScrollView *attentScrollView = [UIScrollView new];
    [headView addSubview:attentScrollView];
    attentScrollView.backgroundColor = [UIColor clearColor];
    
    for (int i = 0; i < 8; i++) {
        UIButton *keyBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(5+i*(55+10), 0, 55, 35)];
        [attentScrollView addSubview:keyBtn1];
//        [keyBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(attentScrollView);
//            make.top.bottom.equalTo(headView);
//            make.width.equalTo(@55);
//        }];
        NSString *title = [NSString stringWithFormat:@"关键字%d",i];
        [keyBtn1 setTitle:title forState:UIControlStateNormal];
        [keyBtn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        keyBtn1.titleLabel.font = [UIFont systemFontOfSize:14];
    }
 
    

    
    
    [attentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(headView);
        make.left.equalTo(lineImage.mas_right);
        make.right.equalTo(lineImage2.mas_left);
    }];
    attentScrollView.showsHorizontalScrollIndicator = NO;
    attentScrollView.contentSize = CGSizeMake(8 * 65+5, 35);
    
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

- (void)setBtnPressed:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected == NO)
    {
        if (attentionView) {
            [attentionView removeFromSuperview];
        }
    }
    else
    {
        attentionView = ({
            AttentionView *view = [[AttentionView alloc] init];
            [self.view addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(headView.mas_bottom);
                make.left.equalTo(self.view);
                make.bottom.equalTo(self.view);
                make.right.equalTo(self.view);
            }];
            view.delegate = self;
            view;
        });
    }
    

}

#pragma mark - attentionDelegate
- (void)junmToAddKeyWordView
{
    AddKeyWordViewController *nextVc = [[AddKeyWordViewController alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
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
        titleLabe.text = @"关注标题关注标题";
        
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
