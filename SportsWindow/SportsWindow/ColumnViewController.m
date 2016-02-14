//
//  ColumnViewController.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/20.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "ColumnViewController.h"
#import <Masonry.h>

@interface ColumnViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
{
    UIView *headView;
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ColumnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    headView = [[UIView alloc] init];
    [self.view addSubview:headView];
    headView.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@35);
    }];
    
    UIButton *oneBtn = [UIButton new];
    [headView addSubview:oneBtn];
    [oneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(headView);
        make.left.equalTo(headView).offset(5);
        make.width.equalTo(@45);
    }];
    [oneBtn setTitle:@"足球" forState:UIControlStateNormal];
    [oneBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    oneBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UIButton *twoBtn = [UIButton new];
    [headView addSubview:twoBtn];
    [twoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(headView);
        make.left.equalTo(oneBtn.mas_right).offset(5);
        make.width.equalTo(@45);
    }];
    [twoBtn setTitle:@"篮球" forState:UIControlStateNormal];
    [twoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [twoBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    twoBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UIButton *threeBtn = [UIButton new];
    [headView addSubview:threeBtn];
    [threeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(headView);
        make.left.equalTo(twoBtn.mas_right).offset(5);
        make.width.equalTo(@45);
    }];
    [threeBtn setTitle:@"足球" forState:UIControlStateNormal];
    [threeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [threeBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    threeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UIButton *fourBtn = [UIButton new];
    [headView addSubview:fourBtn];
    [fourBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(headView);
        make.left.equalTo(threeBtn.mas_right).offset(5);
        make.width.equalTo(@45);
    }];
    [fourBtn setTitle:@"篮球" forState:UIControlStateNormal];
    [fourBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [fourBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    fourBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
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
        titleLabe.text = @"栏目标题栏目标题";
        
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
