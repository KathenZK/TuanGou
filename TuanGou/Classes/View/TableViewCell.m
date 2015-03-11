//
//  TableViewCell.m
//  团购
//
//  Created by medicool on 15/2/24.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "TableViewCell.h"
#import "TgModel.h"

@interface TableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *buyCount;


@end

@implementation TableViewCell

//通过TableView创建cell
+ (instancetype) cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"tg";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:nil options:nil]lastObject];
    }
    
    return cell;
}

- (void)setModel:(TgModel *)model
{
    _model = model;
    
    self.icon.image = [UIImage imageNamed:model.icon];
    self.title.text = model.title;
    self.price.text = [NSString stringWithFormat:@"￥%@", model.price];
    self.buyCount.text = [NSString stringWithFormat:@"%@已购买", model.buyCount];
}
@end
