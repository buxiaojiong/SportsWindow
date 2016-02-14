//
//  CommentViewController.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/15.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "CommentViewController.h"
#import <Masonry.h>
#define kColorWithRGB(r, g, b) [UIColor colorWithRed:(r) / 255.f green:(g) / 255.f blue:(b) / 255.f alpha:1.f]

@interface CommentViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
{
    UIButton *upBtn;
    UIButton *downBtn;
    UIButton *zanBtn;
    UIButton *timeBtn;
}
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"我的评论";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIButton *leftDrawerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftDrawerButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftDrawerButton setImageEdgeInsets:UIEdgeInsetsMake(5, -10, -5, 10)];
    [leftDrawerButton addTarget:self action:@selector(backToMainVc:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backBtn = [[UIBarButtonItem alloc] initWithCustomView:leftDrawerButton];
    self.navigationItem.leftBarButtonItem = backBtn;
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 32)];
    headView.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0];
    [self.view addSubview:headView];
    
    UILabel *sortLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 9, 0, 0)];
    sortLabel.text = @"排序依据";
    sortLabel.font = [UIFont systemFontOfSize:12];
    [sortLabel sizeToFit];
    [headView addSubview:sortLabel];
    
    upBtn = [[UIButton alloc] initWithFrame:CGRectMake(headView.frame.size.width - 35, 4, 32, 24)];
    [upBtn setImage:[UIImage imageNamed:@"upArr"] forState:UIControlStateNormal];
    [upBtn setImage:[UIImage imageNamed:@"uparrseled"] forState:UIControlStateSelected];
    [upBtn addTarget:self action:@selector(upBtned:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:upBtn];
    
    downBtn = [[UIButton alloc] initWithFrame:CGRectMake(upBtn.frame.origin.x - 33, 4, 32, 24)];
    [downBtn setImage:[UIImage imageNamed:@"downarr"] forState:UIControlStateNormal];
    [downBtn setImage:[UIImage imageNamed:@"downarrseled"] forState:UIControlStateSelected];
    [downBtn addTarget:self action:@selector(downBtned:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:downBtn];
    
    zanBtn = [[UIButton alloc] initWithFrame:CGRectMake(downBtn.frame.origin.x - 55, 4, 52, 24)];
    zanBtn.backgroundColor = kColorWithRGB(204, 204, 204);
    [zanBtn setTitle:@"赞" forState:UIControlStateNormal];
    [zanBtn setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
    [zanBtn setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
    zanBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [zanBtn addTarget:self action:@selector(zanBtned:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:zanBtn];
    
    timeBtn = [[UIButton alloc] initWithFrame:CGRectMake(zanBtn.frame.origin.x - 53, 4, 52, 24)];
    timeBtn.backgroundColor = kColorWithRGB(204, 204, 204);
    [timeBtn setTitle:@"时间" forState:UIControlStateNormal];
    [timeBtn setTitleColor:kColorWithRGB(64, 64, 64) forState:UIControlStateNormal];
    [timeBtn setTitleColor:kColorWithRGB(255, 255, 255) forState:UIControlStateSelected];
    timeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [timeBtn addTarget:self action:@selector(timeBtned:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:timeBtn];
    
    UIBezierPath *maskPathZan = [UIBezierPath bezierPathWithRoundedRect:zanBtn.bounds
                                                   byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight
                                                         cornerRadii:CGSizeMake(6, 6)];
    CAShapeLayer *maskLayerZan = [[CAShapeLayer alloc] init];
    maskLayerZan.frame = zanBtn.bounds;
    maskLayerZan.path = maskPathZan.CGPath;
    zanBtn.layer.mask = maskLayerZan;
    
    UIBezierPath *maskPathTime = [UIBezierPath bezierPathWithRoundedRect:timeBtn.bounds
                                                      byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft
                                                            cornerRadii:CGSizeMake(6, 6)];
    CAShapeLayer *maskLayerTime = [[CAShapeLayer alloc] init];
    maskLayerTime.frame = timeBtn.bounds;
    maskLayerTime.path = maskPathTime.CGPath;
    timeBtn.layer.mask = maskLayerTime;
    
    [self upBtned:upBtn];
    [self timeBtned:timeBtn];
    
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

- (void)upBtned:(UIButton *)sender
{
    sender.selected = YES;
    downBtn.selected = NO;
}

- (void)downBtned:(UIButton *)sender
{
    sender.selected = YES;
    upBtn.selected = NO;
}

- (void)zanBtned:(UIButton *)sender
{
    sender.backgroundColor = kColorWithRGB(185, 0, 0);
    sender.selected = YES;
    timeBtn.selected  = NO;
    timeBtn.backgroundColor  = kColorWithRGB(204, 204, 204);
    
}

- (void)timeBtned:(UIButton *)sender
{
    sender.backgroundColor = kColorWithRGB(185, 0, 0);
    sender.selected = YES;
    zanBtn.selected  = NO;
    zanBtn.backgroundColor  = kColorWithRGB(204, 204, 204);
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
    return 280;
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
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        UILabel *titleLabe = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, self.view.frame.size.width, 40)];
        [cell.contentView addSubview:titleLabe];
        titleLabe.font = [UIFont systemFontOfSize:16];
        titleLabe.text = @"评论标题评论标题评论标题";
        
        UILabel *fromLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 0, 0)];
        [cell.contentView addSubview:fromLabel];
        fromLabel.text = @"网易新闻";
        fromLabel.font = [UIFont systemFontOfSize:10];
        [fromLabel sizeToFit];
        
        UILabel *commentCount = [[UILabel alloc] initWithFrame:CGRectMake(fromLabel.frame.size.width+20+20, 50, 0, 0)];
        [cell.contentView addSubview:commentCount];
        commentCount.font = [UIFont systemFontOfSize:10];
        commentCount.text = @"评论 122";
        [commentCount sizeToFit];
        
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(commentCount.frame.origin.x+commentCount.frame.size.width+20, 50, 0, 0)];
        [cell.contentView addSubview:timeLabel];
        timeLabel.font = [UIFont systemFontOfSize:10];
        timeLabel.text = @"2014.04.04";
        [timeLabel sizeToFit];
        
        UIScrollView *commentView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 280-190, self.view.frame.size.width-40, 150)];
        [cell.contentView addSubview:commentView];
        UILabel *details = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-40, 0)];
        [commentView addSubview:details];
        details.text = @"评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣评论内荣";
        details.font = [UIFont systemFontOfSize:16];
        details.numberOfLines = 0;
        [commentView setContentSize:CGSizeMake(self.view.frame.size.width-40, details.frame.size.height)];
        [details sizeToFit];
        
        UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 250, 0, 0)];
        [cell.contentView addSubview:numberLabel];
        numberLabel.text = @"#21";
        numberLabel.font = [UIFont systemFontOfSize:10];
        [numberLabel sizeToFit];
        
        UIButton *zanCountBtn = [[UIButton alloc] initWithFrame:CGRectMake(numberLabel.frame.size.width+20+20, 252, 7.5, 7)];
        [cell.contentView addSubview:zanCountBtn];
        [zanCountBtn setImage:[UIImage imageNamed:@"zan"] forState:UIControlStateNormal];
        
        UILabel *zanCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(zanCountBtn.frame.origin.x+10, 250, 0, 0)];
        [cell.contentView addSubview:zanCountLabel];
        zanCountLabel.text = @"2123";
        zanCountLabel.font = [UIFont systemFontOfSize:10];
        [zanCountLabel sizeToFit];
        
        UIButton *caiCountBtn = [[UIButton alloc] initWithFrame:CGRectMake(zanCountLabel.frame.origin.x+50, 252, 7.5, 7)];
        [cell.contentView addSubview:caiCountBtn];
        [caiCountBtn setImage:[UIImage imageNamed:@"cai"] forState:UIControlStateNormal];
        
        UILabel *caiCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(caiCountBtn.frame.origin.x+10, 250, 0, 0)];
        [cell.contentView addSubview:caiCountLabel];
        caiCountLabel.text = @"223";
        caiCountLabel.font = [UIFont systemFontOfSize:10];
        [caiCountLabel sizeToFit];
    }

    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    OffLineDetailViewController *nextVc = [[OffLineDetailViewController alloc] init];
//    [self.navigationController pushViewController:nextVc animated:YES];
//}

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
