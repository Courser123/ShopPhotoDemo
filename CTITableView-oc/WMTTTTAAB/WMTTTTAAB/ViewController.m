//
//  ViewController.m
//  WMTTTTAAB
//
//  Created by MengWang on 2017/12/4.
//  Copyright © 2017年 yuki.wang. All rights reserved.
//

#import "ViewController.h"
#import "BaseTableView.h"
#import "LeftTableView.h"
#import "RightTableView.h"
#import "MiddleTableView.h"



@interface ViewController ()<UIScrollViewDelegate, BTProtocol>
@property (nonatomic, strong)UIView *headView;
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)LeftTableView *tvLeft;
@property (nonatomic, strong)MiddleTableView *tvMiddle;
@property (nonatomic, strong)RightTableView *tvRight;
@property (nonatomic, strong)UISegmentedControl *segment;
@property (nonatomic, strong)NSMutableArray<BaseTableView *> *tableArrays;

@property (nonatomic, assign)CGFloat headHeight;
@property (nonatomic, assign)CGFloat segmentHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.headHeight = 200;
    self.segmentHeight = 30;
    
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, -210, [UIScreen mainScreen].bounds.size.width, self.headHeight + self.segmentHeight)];
    // todo 加collectionView
    self.headView.backgroundColor = [UIColor yellowColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.delegate = self;
    
    self.tvLeft = [[LeftTableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    self.tvMiddle = [[MiddleTableView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    self.tvRight = [[RightTableView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width *2, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    self.segment = [[UISegmentedControl alloc] initWithItems:@[@"11", @"22", @"33"]];
    self.segment.frame = CGRectMake(0, self.headHeight, [UIScreen mainScreen].bounds.size.width, self.segmentHeight);
    self.segment.backgroundColor = [UIColor whiteColor];
    [self.segment addTarget:self action:@selector(valuedChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.headView addSubview:self.segment];
    [self.view addSubview:self.scrollView];
    [self.tvLeft.tbView addSubview:self.headView];
    
    // fix size
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 0);
    
    self.tvLeft.delegate = self;
    self.tvMiddle.delegate = self;
    self.tvRight.delegate = self;
    
    self.tableArrays = [[NSMutableArray alloc] init];
    [self.tableArrays addObject:self.tvLeft];
    [self.tableArrays addObject:self.tvMiddle];
    [self.tableArrays addObject:self.tvRight];
    
    CGFloat totalInset = self.headHeight + self.segmentHeight;
    self.tvLeft.tbView.contentInset = UIEdgeInsetsMake(totalInset, 0, 0, 0);
    self.tvLeft.tbView.contentOffset = CGPointMake(0,-totalInset);

    self.tvMiddle.tbView.contentInset = UIEdgeInsetsMake(totalInset, 0, 0, 0);
    self.tvMiddle.tbView.contentOffset = CGPointMake(0,-totalInset);
    
    self.tvRight.tbView.contentInset = UIEdgeInsetsMake(totalInset, 0, 0, 0);
    self.tvRight.tbView.contentOffset = CGPointMake(0,-totalInset);
    
    self.scrollView.pagingEnabled = YES;
    [self.scrollView addSubview:self.tvLeft];
    [self.scrollView addSubview:self.tvMiddle];
    [self.scrollView addSubview:self.tvRight];

}

- (void)valuedChanged:(UISegmentedControl *)segment {
    [self scrollToIndexTable:segment.selectedSegmentIndex];
}

#pragma mark protocol

- (void)tableViewDidScroll:(UITableView *)tbView withOffsetY:(CGFloat)offsetY {
    CGFloat newOffsetY = offsetY;
    if (self.headView.superview != self.view) {
        CGFloat delta = 0.0;
        if(self.headView.superview == tbView) {
            if(newOffsetY + self.segmentHeight > 0) {
                delta = newOffsetY + self.segmentHeight;
                
                for (BaseTableView *table in self.tableArrays) {
                    if(table.tbView.contentOffset.y < (-self.segmentHeight)) {
                        table.tbView.contentOffset = CGPointMake(table.tbView.contentOffset.x,-self.segmentHeight);
                    }
                }
            }
            
            self.headView.frame = CGRectMake(0, -(self.segmentHeight + self.headHeight) + delta, self.headView.frame.size.width, self.headView.frame.size.height);
        }
        return;
        
    }
    
    if([self transInOffsetToOutOffset:newOffsetY] < self.headHeight) {
        self.headView.frame = CGRectMake(0, -([self transInOffsetToOutOffset:newOffsetY]), self.headView.frame.size.width, self.headView.frame.size.height);
    } else {
        self.headView.frame = CGRectMake(0, -self.headHeight, self.headView.frame.size.width, self.headView.frame.size.height);
    }
    
    if(newOffsetY + self.segmentHeight < 0) {
        if (tbView != self.tvLeft.tbView) {
            self.tvLeft.tbView.contentOffset = CGPointMake(0, offsetY);
        }
        if (tbView != self.tvMiddle.tbView) {
            self.tvMiddle.tbView.contentOffset = CGPointMake(0, offsetY);
        }
        if (tbView != self.tvRight.tbView) {
            self.tvRight.tbView.contentOffset = CGPointMake(0, offsetY);
        }
    }
}

- (CGFloat)transInOffsetToOutOffset:(CGFloat)inOffset {
    return inOffset + (self.segmentHeight + self.headHeight);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.x;
    if(offset > 375 * 1.5){
        self.segment.selectedSegmentIndex = 2;
    } else if (offset > 375 * 0.5) {
        self.segment.selectedSegmentIndex = 1;
    } else {
        self.segment.selectedSegmentIndex = 0;
    }
    [self.view insertSubview:self.headView aboveSubview:self.scrollView];
    
    BaseTableView *bTableView = self.tableArrays[self.segment.selectedSegmentIndex];
    [self tableViewDidScroll:bTableView.tbView withOffsetY:bTableView.tbView.contentOffset.y];
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self insertHeadViewToInTable];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self insertHeadViewToInTable];
}

- (void)insertHeadViewToInTable {
    BaseTableView *bTableView = self.tableArrays[self.segment.selectedSegmentIndex];
    [bTableView.tbView insertSubview:self.headView aboveSubview:bTableView.tbView];
    [self tableViewDidScroll:bTableView.tbView withOffsetY:bTableView.tbView.contentOffset.y];
}

- (void)scrollToIndexTable:(NSInteger)index {
    CGPoint position = CGPointMake([UIScreen mainScreen].bounds.size.width * index, 0.0);
    [self.scrollView setContentOffset:position animated:YES];
}

@end
