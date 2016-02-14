//
//  CollectViewController.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/15.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "CollectViewController.h"
#import <Masonry.h>

@interface CollectViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
{
    UIButton *rightDrawerButton;
}
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"我的收藏";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIButton *leftDrawerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftDrawerButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftDrawerButton setImageEdgeInsets:UIEdgeInsetsMake(5, -10, -5, 10)];
    [leftDrawerButton addTarget:self action:@selector(backToMainVc:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backBtn = [[UIBarButtonItem alloc] initWithCustomView:leftDrawerButton];
    self.navigationItem.leftBarButtonItem = backBtn;
    
    rightDrawerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [rightDrawerButton setImage:[UIImage imageNamed:@"collectLeft"] forState:UIControlStateNormal];
    [rightDrawerButton setImage:[UIImage imageNamed:@"gou"] forState:UIControlStateSelected];
    [rightDrawerButton setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    [rightDrawerButton addTarget:self action:@selector(collectionList:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:rightDrawerButton];
    rightBtn.style = UIBarButtonItemStylePlain;
    self.navigationItem.rightBarButtonItem = rightBtn;
    
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


-(void)backToMainVc:(id)sender{
    //    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //    MainViewController *mainVc = [[MainViewController alloc] init];
    //    [appDelegate.drawerController setCenterViewController:mainVc];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)collectionList:(UIBarButtonItem *)sender
{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    if(self.tableView.editing)
    {
        rightDrawerButton.selected = YES;
    }
    else
    {
        rightDrawerButton.selected = NO;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([otherGestureRecognizer.view isKindOfClass:[UITableView class]]) {
        return YES;
    }
    return NO;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
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

// 插入删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
//        [self._arrayName removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
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
        titleLabe.text = @"收藏标题收藏标题";

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

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
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
