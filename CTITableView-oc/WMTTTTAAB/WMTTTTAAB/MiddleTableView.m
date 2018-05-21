//
//  MiddleTableView.m
//  WMTTTTAAB
//
//  Created by MengWang on 2017/12/4.
//  Copyright © 2017年 yuki.wang. All rights reserved.
//

#import "MiddleTableView.h"

@implementation MiddleTableView

- (void)configureCell:(nonnull NSIndexPath *)path withCell:(UITableViewCell *)cell {
    cell.textLabel.text = [NSString stringWithFormat:@"%ld Middle", path.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

@end
