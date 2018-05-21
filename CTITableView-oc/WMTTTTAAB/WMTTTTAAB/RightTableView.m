//
//  RightTableView.m
//  WMTTTTAAB
//
//  Created by MengWang on 2017/12/4.
//  Copyright © 2017年 yuki.wang. All rights reserved.
//

#import "RightTableView.h"

@implementation RightTableView

- (void)configureCell:(nonnull NSIndexPath *)path withCell:(UITableViewCell *)cell {
    cell.textLabel.text = [NSString stringWithFormat:@"%ld Right", path.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

@end
