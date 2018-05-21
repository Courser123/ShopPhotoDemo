//
//  BaseTableView.m
//  WMTTTTAAB
//
//  Created by MengWang on 2017/12/4.
//  Copyright © 2017年 yuki.wang. All rights reserved.
//

#import "BaseTableView.h"

@interface BaseTableView()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation BaseTableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.tbView = [[UITableView alloc] initWithFrame:CGRectZero];
        self.tbView.dataSource = self;
        self.tbView.delegate = self;
        [self addSubview:self.tbView];
        [self.tbView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.tbView reloadData];
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tbView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(self.delegate) {
        [self.delegate tableViewDidScroll:self.tbView withOffsetY:scrollView.contentOffset.y];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if(self.delegate) {
        [self.delegate tableViewDidScroll:self.tbView withOffsetY:scrollView.contentOffset.y];
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if(self.delegate) {
        [self.delegate tableViewDidScroll:self.tbView withOffsetY:scrollView.contentOffset.y];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if(self.delegate) {
        [self.delegate tableViewDidScroll:self.tbView withOffsetY:scrollView.contentOffset.y];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tbView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor blueColor];
    [self configureCell:indexPath withCell:cell];
    return cell;
}

- (void)configureCell:(nonnull NSIndexPath *)path withCell:(UITableViewCell *)cell {
    
}

@end
