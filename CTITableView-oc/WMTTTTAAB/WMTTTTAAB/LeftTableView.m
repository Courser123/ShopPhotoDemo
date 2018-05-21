//
//  LeftTableView.m
//  WMTTTTAAB
//
//  Created by MengWang on 2017/12/4.
//  Copyright © 2017年 yuki.wang. All rights reserved.
//

#import "LeftTableView.h"

@implementation LeftTableView

- (void)configureCell:(nonnull NSIndexPath *)path withCell:(UITableViewCell *)cell {
    cell.textLabel.text = [NSString stringWithFormat:@"%ld LEFT", path.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

@end
