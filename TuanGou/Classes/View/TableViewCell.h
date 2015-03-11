//
//  TableViewCell.h
//  团购
//
//  Created by medicool on 15/2/24.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TgModel;

@interface TableViewCell : UITableViewCell

//通过TableView创建cell
+ (instancetype) cellWithTableView:(UITableView *)tableView;

//团购模型
@property (nonatomic, strong) TgModel *model;

@end
