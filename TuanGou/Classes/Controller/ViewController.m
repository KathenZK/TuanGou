//
//  ViewController.m
//  团购
//
//  Created by medicool on 15/2/16.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "ViewController.h"
#import "TgModel.h"
#import "TableViewCell.h"
#import "FooterView.h"
#import "HeaderView.h"

@interface ViewController ()<UITableViewDataSource, FooterViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *models;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 80;
    
    FooterView *footer = [FooterView footerView];
    footer.delegate = self;
    self.tableView.tableFooterView = footer;
    self.tableView.tableHeaderView = [HeaderView headerView];
}

//加载更多数据
- (void)FooterViewClickedloadMoreData
{
    TgModel *model = [[TgModel alloc]init];
    model.icon = @"ad_01";
    model.title = @"新增加的团购数据..";
    model.price = @"100";
    model.buyCount = @"0";
    
    [self.models addObject:model];
    [self.tableView reloadData];
}

- (NSArray *)models
{
    if (_models == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
        NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tgArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dicArray) {
            TgModel *model = [TgModel tgWithDict:dict];
            [tgArray addObject:model];
        }
        _models = tgArray;
    }
    return _models;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TableViewCell *cell = [TableViewCell cellWithTableView:tableView];
    cell.model = self.models[indexPath.row];
    
    return cell;
}
@end
