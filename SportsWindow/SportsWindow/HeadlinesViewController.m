//
//  HeadlinesViewController.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/20.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "HeadlinesViewController.h"
#import <Masonry.h>
#import "OnLineDetailViewController.h"

@interface HeadlinesViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HeadlinesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView = ({
        UITableView *view = [UITableView new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        view.delegate = self;
        view.dataSource = self;
        view;
    });
    
}


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
        titleLabe.text = @"头条标题头条标题";
        
        
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
    OnLineDetailViewController *nextVc = [[OnLineDetailViewController alloc] init];
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
